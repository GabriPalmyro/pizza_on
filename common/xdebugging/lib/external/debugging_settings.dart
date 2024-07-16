import 'package:dio/dio.dart';

import '../features/network/domain/interceptors/xdebugging_interceptor.dart';

class DebuggingSettings {
  DebuggingSettings._();

  static final DebuggingSettings instance = DebuggingSettings._();

  static DebuggingSettings get getInstance => instance;

  Interceptor get interceptor => XDebuggingInterceptor();
}
