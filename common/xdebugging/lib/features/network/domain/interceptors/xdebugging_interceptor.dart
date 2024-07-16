import 'dart:convert';

import 'package:dio/dio.dart';

import '../../../../core/data/repository/shared_preferences_repository.dart';
import '../../data/models/api_response.dart';
import '../../di/network_module.dart';

class XDebuggingInterceptor extends Interceptor {
  XDebuggingInterceptor();

  late final SharedPreferencesRepository _repository = NetworkModule().repository;
  late DateTime _requestTime;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    _requestTime = DateTime.now();
    handler.next(options);
  }

  @override
  Future<void> onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) async {
    await _saveResponse(response);
    handler.next(response);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    await _saveError(err);
    handler.next(err);
  }

  Map<String, dynamic> _getJson(String data) {
    try {
      return jsonDecode(data) as Map<String, dynamic>;
    } catch (_) {
      return {};
    }
  }

  Future<void> _saveResponse(Response<dynamic> response) async {
    try {
      await _repository.save(
        ApiResponse(
          requestTime: _requestTime,
          responseTime: DateTime.now(),
          baseUrl: response.requestOptions.uri.toString(),
          method: response.requestOptions.method,
          statusCode: response.statusCode,
          body: response.data,
          request: response.requestOptions.data,
          contentType: response.requestOptions.contentType,
          sendTimeout: response.requestOptions.sendTimeout,
          responseType: response.requestOptions.responseType.name,
          receiveTimeout: response.requestOptions.receiveTimeout,
          queryParameters: response.requestOptions.queryParameters,
          connectionTimeout: response.requestOptions.connectTimeout,
          curl: response.requestOptions.uri.toString(),
          headers: response.headers.map,
          path: response.requestOptions.path,
        ),
      );
    } catch (_) {}
  }

  Future<void> _saveError(DioException response) async {
    try {
      await _repository.save(
        ApiResponse(
          requestTime: _requestTime,
          responseTime: DateTime.now(),
          baseUrl: response.requestOptions.uri.toString(),
          method: response.requestOptions.method,
          statusCode: response.response?.statusCode,
          body: _getJson(response.response.toString()),
          request: response.requestOptions.data,
          contentType: response.requestOptions.contentType,
          sendTimeout: response.requestOptions.sendTimeout,
          responseType: response.requestOptions.responseType.name,
          receiveTimeout: response.requestOptions.receiveTimeout,
          queryParameters: response.requestOptions.queryParameters,
          connectionTimeout: response.requestOptions.connectTimeout,
          curl: response.requestOptions.uri.toString(),
          headers: response.response?.headers.map,
          path: response.requestOptions.path,
        ),
      );
    } catch (_) {}
  }
}
