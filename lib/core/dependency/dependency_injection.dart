import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:manfaa/components/global_variables.dart';
import 'package:manfaa/core/api_client/api_client.dart';
import 'package:manfaa/core/storage/storage.dart';
import 'package:manfaa/features/landing_page/data/repository/landing_page_repository.dart';
import 'package:manfaa/features/landing_page/data/repository/landing_page_repository_impl.dart';

Future<void> setUpDependencies() async {
  injector.registerSingleton<Storage>(await Storage.init());
  injector.registerFactory<Dio>(
    () => Dio()
      ..options = BaseOptions(
        contentType: 'application/json',
        sendTimeout: const Duration(seconds: 3),
        receiveTimeout: const Duration(seconds: 30),
        connectTimeout: const Duration(seconds: 30),
        headers: {},
      )
      ..interceptors.addAll(
        [
          LogInterceptor(
            error: kDebugMode,
            request: kDebugMode,
            requestBody: kDebugMode,
            responseBody: kDebugMode,
          ),
        ],
      ),
  );
  injector.registerSingleton<ApiClient>(ApiClient(injector.get<Dio>()));
  injector.registerLazySingleton(InternetConnectionChecker.new);
  _setupRepositories();
  injector.registerSingleton<Connectivity>(Connectivity());
}

void _setupRepositories() {
  injector.registerSingleton<LandingPageRepostiory>(
    LandingPageRepostioryImpl(dioClient: injector.get<ApiClient>()),
  );
}
