part of '../export.dart';

final locator = GetIt.instance;

Future<void> initializeDependencies() async {
  ///dio connection and default duration is 30
  Dio dio = Dio(BaseOptions(connectTimeout: Duration(seconds: 30)));
  locator.registerSingleton<Dio>(dio);
  locator.registerSingleton<RetrofitClient>(RetrofitClient(locator<Dio>()));
  locator.registerSingleton<ApiRepository>(
    ApiRepositoryImpl(locator<RetrofitClient>()),
  );
}
