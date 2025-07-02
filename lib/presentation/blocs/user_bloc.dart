part of export;

class UserBloc extends Bloc<UserEvent, UserState> {
  final ApiRepository _apiRepository;

  UserBloc(this._apiRepository) : super(InitialUserState()) {
    on<FetchUsers>((event, state) async {
      emit(LoadingUserState());
      try {
        final user = _apiRepository.getUserList(page: 1);
        print("user ---> ${user}");
      } catch (e) {}
    });
  }
}
