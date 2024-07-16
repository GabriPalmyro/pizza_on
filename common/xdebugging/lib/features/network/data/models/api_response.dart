import 'dart:convert';

import 'package:equatable/equatable.dart';

import '../../../../core/data/models/debugging_model.dart';

class ApiResponse extends Equatable implements DebuggingModel {
  const ApiResponse({
    required this.requestTime,
    required this.responseTime,
    required this.baseUrl,
    required this.path,
    required this.method,
    required this.statusCode,
    required this.request,
    required this.body,
    required this.contentType,
    required this.sendTimeout,
    required this.responseType,
    required this.receiveTimeout,
    required this.queryParameters,
    required this.connectionTimeout,
    required this.curl,
    required this.headers,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      requestTime: json['requestTime'] != null
          ? DateTime.parse(
              json['requestTime'],
            )
          : null,
      responseTime: json['responseTime'] != null
          ? DateTime.parse(
              json['responseTime'],
            )
          : null,
      baseUrl: json['baseUrl'],
      path: json['path'],
      method: json['method'],
      statusCode: json['statusCode'] != null ? json['statusCode'] as int : null,
      request: json['request'],
      body: json['body'],
      contentType: json['contentType'],
      sendTimeout: json['sendTimeout'] != null
          ? Duration(
              milliseconds: json['sendTimeout'],
            )
          : null,
      responseType: json['responseType'],
      receiveTimeout: json['receiveTimeout'] != null
          ? Duration(
              milliseconds: json['receiveTimeout'],
            )
          : null,
      queryParameters: json['queryParameters'],
      connectionTimeout: json['connectionTimeout'] != null
          ? Duration(
              milliseconds: json['connectionTimeout'],
            )
          : null,
      curl: json['curl'],
      headers: json['headers'],
    );
  }

  final DateTime? requestTime;
  final DateTime? responseTime;
  final String? baseUrl;
  final String? path;
  final String? method;
  final int? statusCode;
  final String? request;
  final dynamic body;
  final String? contentType;
  final Duration? sendTimeout;
  final String? responseType;
  final Duration? receiveTimeout;
  final Map<String, dynamic>? queryParameters;
  final Duration? connectionTimeout;
  final String? curl;
  final Map<String, dynamic>? headers;

  @override
  List<Object?> get props => [
        requestTime,
        responseTime,
        baseUrl,
        path,
        method,
        statusCode,
        request,
        body,
        contentType,
        sendTimeout,
        responseType,
        receiveTimeout,
        queryParameters,
        connectionTimeout,
        curl,
        headers,
      ];

  ApiResponse copyWith({
    DateTime? requestTime,
    DateTime? responseTime,
    String? baseUrl,
    String? path,
    String? method,
    int? statusCode,
    String? request,
    dynamic body,
    String? contentType,
    Duration? sendTimeout,
    String? responseType,
    Duration? receiveTimeout,
    Map<String, dynamic>? queryParameters,
    Duration? connectionTimeout,
    String? curl,
    Map<String, dynamic>? headers,
  }) {
    return ApiResponse(
      requestTime: requestTime ?? this.requestTime,
      responseTime: responseTime ?? this.responseTime,
      baseUrl: baseUrl ?? this.baseUrl,
      path: path ?? this.path,
      method: method ?? this.method,
      statusCode: statusCode ?? this.statusCode,
      request: request ?? this.request,
      body: body ?? this.body,
      contentType: contentType ?? this.contentType,
      sendTimeout: sendTimeout ?? this.sendTimeout,
      responseType: responseType ?? this.responseType,
      receiveTimeout: receiveTimeout ?? this.receiveTimeout,
      queryParameters: queryParameters ?? this.queryParameters,
      connectionTimeout: connectionTimeout ?? this.connectionTimeout,
      curl: curl ?? this.curl,
      headers: headers ?? this.headers,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'requestTime': requestTime?.toIso8601String(),
      'responseTime': responseTime?.toIso8601String(),
      'baseUrl': baseUrl,
      'path': path,
      'method': method,
      'statusCode': statusCode,
      'request': request,
      'body': body,
      'contentType': contentType,
      'sendTimeout': sendTimeout?.inMilliseconds,
      'responseType': responseType,
      'receiveTimeout': receiveTimeout?.inMilliseconds,
      'queryParameters': queryParameters,
      'connectionTimeout': connectionTimeout?.inMilliseconds,
      'curl': curl,
      'headers': headers,
    };
  }

  String get prettyJson {
    if (body == null) {
      return '';
    }
    return const JsonEncoder.withIndent('  ').convert(body);
  }

  String get prettyJsonRequest {
    if (request == null) {
      return '';
    }
    return const JsonEncoder.withIndent('  ').convert(receiveTimeout);
  }

  @override
  int compareTo(DebuggingModel other) {
    if (other is ApiResponse) {
      return responseTime!.compareTo(other.responseTime!);
    }
    return 0;
  }

  @override
  // TODO: implement subtitle
  String get subtitle => throw UnimplementedError();

  @override
  // TODO: implement title
  String get title => throw UnimplementedError();
}
