part of '../../core/export.dart';

abstract class ApiRepository {
  Future<DataState<List<UserModel>>> getUserList(
      {required int perPage, required int page});
}
