part of export;

abstract class ApiRepository {
  Future<DataState<List<UserModel>>> getUserList({required int page});
}
