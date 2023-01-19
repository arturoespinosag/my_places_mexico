import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:myplaces_mexico/src/src.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiClient {
  ApiClient._();

  static final ApiClient _instance = ApiClient._();
  static ApiClient get instance => _instance;
  static late bool useSap;
  static late bool useSunat;

  late Dio dio;

  void init({
    required String baseUrl,
    bool enableLogging = false,
    // required ILocalRepository localRepository,
  }) {
    dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        headers: <String, String>{
          HttpHeaders.contentTypeHeader: 'application/json'
        },
        connectTimeout: 30000,
        receiveTimeout: 30000,
      ),
    );
    // dio.interceptors.add(AuthInterceptor(localRepository: localRepository));
    // dio.interceptors.add(RetryInterceptor(dio: dio));

    if (enableLogging) {
      dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          logPrint: (message) {
            log('$message');
            // Temporarily enable print at publish time
            //ignore: avoid_print, temporary print to see log in adb logcat only on dev, execute command:  Mac: adb logcat | grep flutter. Windows: adb logcat | findstr flutter
            // print(message);
          },
        ),
      );
    }
  }

  static Future<Response> request(ApiRequest request) {
    return _instance.dio.request<void>(
      request.url,
      data: request.body,
      queryParameters: request.query,
      options: Options(
        method: request.method,
        headers: request.headers,
        contentType: request.contentType,
      ),
    );
  }
}
