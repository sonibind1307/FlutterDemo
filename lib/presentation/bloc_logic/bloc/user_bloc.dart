part of '../../../core/export.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final ApiRepository _apiRepository;

  int _currentPage = 1;
  bool _isFetching = false;
  bool _isOnline = true;
  bool _hasMore = true;

  final List<UserModel> _allUsers = [];
  String _query = '';
  final ConnectionBloc _connectionBloc;

  UserBloc(this._apiRepository, this._connectionBloc)
      : super(InitialUserState()) {
    on<FetchUsers>(_onFetchUsers);
    on<SearchUsers>(_onSearchUser);
    on<LoadUsersFromCache>(_onLoadUsersFromCache);

    _connectionBloc.stream.listen((state) {
      if (state is ConnectionFailure) {
        _isOnline = false;
        if (_allUsers.isEmpty) {
          add(LoadUsersFromCache());
        }
      } else {
        _isOnline = true;
        if (_allUsers.isEmpty) {
          add(FetchUsers());
        }
      }
    });

    add(LoadUsersFromCache());
  }

  Future<void> _onLoadUsersFromCache(
    LoadUsersFromCache event,
    Emitter<UserState> emit,
  ) async {
    await _fetchDataFromHive(emit);
  }

  Future<void> _onFetchUsers(FetchUsers event, Emitter<UserState> emit) async {
    if (!_isOnline) {
      return; // Exit, don't call API on swipe it will work
    }
    if (_isFetching || !_hasMore) return;

    _isFetching = true;
    // If first page, show main loader
    if (_currentPage == 1) {
      emit(LoadingUserState());
    } else {
      if (state is SuccessUserState) {
        emit((state as SuccessUserState).copyWith(isLoadingMore: true));
      } else {
        emit(SuccessUserState(_allUsers, isLoadingMore: true));
      }
    }

    final response =
        await _apiRepository.getUserList(page: _currentPage, perPage: 10);
    if (response is DataSuccess) {
      final List<UserModel> newUsers = response.data ?? [];

      if (newUsers.isEmpty) {
        _hasMore = false; // last data from api will be null or empty
      } else {
        _currentPage++;
        _allUsers.addAll(newUsers);

        //save data to hive here
        _saveDataToHive();
      }

      emit(SuccessUserState(_allUsers));
    } else if (response is DataFailed) {
      final error = response.error;
      if (!_isOnline) {
        await _fetchDataFromHive(emit);
      } else if (error?.response?.statusCode == 404) {
        emit(ErrorUserState(AppConstant.errorNotFound));
      } else if (error?.response?.statusCode == 401) {
        emit(ErrorUserState(AppConstant.errorUnauthorized));
      } else if (error?.response?.statusCode == 500) {
        emit(ErrorUserState(AppConstant.errorServer));
      } else if (error?.type == DioExceptionType.connectionTimeout) {
        emit(ErrorUserState(AppConstant.errorTimeOut));
      } else {
        emit(ErrorUserState(AppConstant.errorCommonMsg));
      }
    }
    _isFetching = false;
  }

  Future<void> _onSearchUser(SearchUsers event, Emitter<UserState> emit) async {
    _query = event.query;
    if (state is SuccessUserState) {
      emit((state as SuccessUserState).copyWith(users: _filteredUsers()));
    } else {
      emit(SuccessUserState(_filteredUsers()));
    }
  }

  List<UserModel> _filteredUsers() {
    if (_query.isEmpty) return _allUsers;
    final normalizedQuery = Helper.normalize(_query);

    return _allUsers.where((u) {
      final login = u.login ?? '';
      final nodeId = u.nodeId ?? '';
      return Helper.normalize(login).contains(normalizedQuery) ||
          Helper.normalize(nodeId).contains(normalizedQuery);
    }).toList();
  }

  Future<void> _saveDataToHive() async {
    final box = Hive.box<UserModel>(AppConstant.hiveBoxUser);
    await box.clear(); // or keep all pages if needed
    await box.addAll(_allUsers);
  }

  Future<void> _fetchDataFromHive(Emitter<UserState> emit) async {
    final box = Hive.box<UserModel>(AppConstant.hiveBoxUser);
    final cachedUsers = box.values.toList();

    if (cachedUsers.isNotEmpty) {
      _allUsers.clear();
      _allUsers.addAll(cachedUsers);
      emit(SuccessUserState(_allUsers));
    } else {
      emit(ErrorUserState(AppConstant.errorNoInternet));
    }
  }

  @override
  Future<void> close() {
    return super.close();
  }
}
