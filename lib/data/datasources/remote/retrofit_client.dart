import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../../domain/model/user_model.dart';

part 'retrofit_client.g.dart';

@RestApi(baseUrl: "https://api.github.com/")
abstract class RetrofitClient {
  factory RetrofitClient(Dio dio, {String baseUrl}) = _RetrofitClient;

  @GET("users")
  Future<HttpResponse<List<UserModel>>> getUserList({
    @Query("per_page") required int perPage,
    @Query("page") required int page,
  });
}
