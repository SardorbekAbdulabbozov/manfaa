import 'package:dio/dio.dart';
import 'package:dio_retry_plus/dio_retry_plus.dart';

class ApiClient {
  final Dio dio;

  ApiClient(this.dio) {
    dio.interceptors.add(
      RetryInterceptor(
        dio: dio,
        logPrint: (s) {},
        refreshTokenFunction: () async {},
        forbiddenFunction: () async {},
        toNoInternetPageNavigator: () async {},
      ),
    );
  }
}
