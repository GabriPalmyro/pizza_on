import 'package:dio/dio.dart';
import 'package:xdebugging/external/debugging_settings.dart';

abstract class NetworkInterceptors {
  List<Interceptor> interceptors();
}

class NetworkInterceptorsImpl implements NetworkInterceptors {
  @override
  List<Interceptor> interceptors() {
    return [
      LogInterceptor(responseBody: true, requestBody: true),
      DebuggingSettings.instance.interceptor,
    ];
  }
}