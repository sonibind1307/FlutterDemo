part of export;

class ApiRepositoryImpl extends BaseApiRepository implements ApiRepository {
  final RetrofitClient _client;

  ApiRepositoryImpl(this._client);

  @override
  Future<DataState<List<UserModel>>> getUserList(
      {required int perPage, required int page}) {
    return getStateOf<List<UserModel>>(
        request: () => _client.getUserList(perPage: perPage, page: page));
  }
}
