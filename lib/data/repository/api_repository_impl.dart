part of export;

class ApiRepositoryImpl extends BaseApiRepository implements ApiRepository {
  final RetrofitClient _client;

  ApiRepositoryImpl(this._client);

  @override
  Future<DataState<List<UserModel>>> getUserList({required int page}) {
    return getStateOf<List<UserModel>>(request: () => _client.getUserList());
  }
}
