part of export;

final locator = GetIt.instance;

Future<void> initializeDependencies() async {
  ///dio connection and default duration is 40
  Dio dio = Dio(BaseOptions(connectTimeout: Duration(seconds: 40)));

  (dio.httpClientAdapter as BrowserHttpClientAdapter).withCredentials = false;
  locator.registerSingleton<Dio>(dio);
  locator.registerSingleton<RetrofitClient>(RetrofitClient(locator<Dio>()));
  locator.registerSingleton<ApiRepository>(
    ApiRepositoryImpl(locator<RetrofitClient>()),
  );
}
