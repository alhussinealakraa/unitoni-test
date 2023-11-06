
import 'package:dio/dio.dart';

import '../../core/utilities/constants.dart';

class AppModule {
  String get baseUrl => BASE_URL;

  BaseOptions dioOption() =>
      BaseOptions(
        baseUrl: BASE_URL,
        contentType: 'application/json',
        responseType: ResponseType.plain,
        headers: <String, String>{
          'Accept': 'application/json;text/plain',
          'Connection': 'keep-alive',
        },
      );

  Dio dio(BaseOptions option,) {
    final Dio dio = Dio(option);
    return dio
      ..interceptors.addAll(<Interceptor>[
        LogInterceptor(
          requestBody: true,
          responseBody: true,
          responseHeader: true,
          requestHeader: true,
          request: true,
        ),
      ]);
  }
}
