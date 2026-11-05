import 'dart:convert';
import 'package:base_flutter_proj/core/base/base_api/api_response_parser.dart';
import 'package:base_flutter_proj/core/base/base_api/entities/base_api_response.dart';
import 'package:base_flutter_proj/core/base/base_api/interceptors/base_api_interceptor.dart';
import 'package:base_flutter_proj/core/config.dart';
import 'package:base_flutter_proj/core/debug/logger.dart';
import 'package:base_flutter_proj/core/errors/app_error_code.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:package_info_plus/package_info_plus.dart';

typedef ConnectivityCheck = Future<bool> Function();

abstract class BaseApi {
  final Config config;
  final PackageInfo packageInfo;
  final ConnectivityCheck checkConnection;

  BaseApi({
    required this.config,
    required this.packageInfo,
    required this.checkConnection,
    bool enableHttpLogs = false,
  }) : isLoggerOutputEnabled = enableHttpLogs;

  final bool isLoggerOutputEnabled;

  late final Dio client =
      Dio(
          BaseOptions(
            responseType: ResponseType.plain,
            validateStatus: (status) => status != null,
          ),
        )
        ..interceptors.addAll([
          BaseApiInterceptor(packageInfo: packageInfo),
          if (isLoggerOutputEnabled) CustomLogger.httpInterceptor,
        ]);

  Future<bool> _hasConnection() => checkConnection();

  @protected
  Future<Uri> buildUri({
    required String relativePath,
    Map<String, dynamic>? queryParameters,
  }) async {
    queryParameters ??= {};

    return config.isHttpsApi
        ? Uri.https(
            config.apiUrlDomain,
            config.apiUrlRelativePath + relativePath,
            queryParameters,
          )
        : Uri.http(
            config.apiUrlDomain,
            config.apiUrlRelativePath + relativePath,
            queryParameters,
          );
  }

  /// Строки, числа и bool уходят как есть. Вложенные структуры — JSON,
  /// а не `toString()` у Map.
  Map<String, String>? encodeFields(Map<String, dynamic>? params) {
    return params?.map((key, value) {
      if (value == null) return MapEntry(key, '');
      if (value is String) return MapEntry(key, value);
      if (value is num || value is bool) return MapEntry(key, '$value');
      return MapEntry(key, jsonEncode(value));
    });
  }

  Uri _fallbackUri(String relativePath) {
    final path = config.apiUrlRelativePath + relativePath;
    return config.isHttpsApi
        ? Uri.https(config.apiUrlDomain, path)
        : Uri.http(config.apiUrlDomain, path);
  }

  Future<BaseApiResponse> sendGetRequest(
    String relativePath, {
    Map<String, dynamic>? params,
  }) async {
    if (!await _hasConnection()) {
      return BaseApiResponse(errorCode: AppErrorCode.noInternet);
    }

    Uri? uri;
    try {
      uri = await buildUri(
        relativePath: relativePath,
        queryParameters: encodeFields(params),
      );

      final response = await client.getUri<String>(uri);
      return parseResponse(response);
    } catch (error) {
      return processResponseError(error, uri ?? _fallbackUri(relativePath));
    }
  }

  Future<BaseApiResponse> sendPostRequest(
    String relativePath, {
    Map<String, dynamic>? body,
    Map<String, String>? headers,
  }) async {
    if (!await _hasConnection()) {
      return BaseApiResponse(errorCode: AppErrorCode.noInternet);
    }

    Uri? uri;
    try {
      uri = await buildUri(relativePath: relativePath);
      final response = await client.postUri<String>(
        uri,
        data: encodeFields(body),
        options: Options(
          headers: headers,
          contentType: body == null ? null : Headers.formUrlEncodedContentType,
        ),
      );

      return parseResponse(response);
    } catch (error) {
      return processResponseError(error, uri ?? _fallbackUri(relativePath));
    }
  }

  Future<BaseApiResponse> sendPostJsonRequest(
    String relativePath, {
    Map<String, dynamic>? body,
    Map<String, String>? headers,
  }) async {
    if (!await _hasConnection()) {
      return BaseApiResponse(errorCode: AppErrorCode.noInternet);
    }

    Uri? uri;
    try {
      uri = await buildUri(relativePath: relativePath);
      final requestHeaders = {
        'Content-Type': Headers.jsonContentType,
        ...?headers,
      };
      final response = await client.postUri<String>(
        uri,
        data: body,
        options: Options(headers: requestHeaders),
      );

      return parseResponse(response);
    } catch (error) {
      return processResponseError(error, uri ?? _fallbackUri(relativePath));
    }
  }

  Future<BaseApiResponse> sendPostRequestWithFiles(
    String relativePath,
    List<MapEntry<String, MultipartFile>> files, [
    Map<String, dynamic>? params,
  ]) async {
    if (!await _hasConnection()) {
      return BaseApiResponse(errorCode: AppErrorCode.noInternet);
    }

    Uri? uri;
    try {
      uri = await buildUri(relativePath: relativePath);
      final formData = FormData();
      final fields = encodeFields(params);
      if (fields != null) {
        formData.fields.addAll(fields.entries);
      }
      formData.files.addAll(files);
      final response = await client.postUri<String>(uri, data: formData);
      return parseResponse(response);
    } catch (error) {
      return processResponseError(error, uri ?? _fallbackUri(relativePath));
    }
  }

  BaseApiResponse processResponseError(Object error, Uri uri) {
    switch (error) {
      case final String msg:
        return BaseApiResponse(serverMessage: msg);
      case DioException(:final type)
          when type == DioExceptionType.connectionError ||
              type == DioExceptionType.connectionTimeout ||
              type == DioExceptionType.sendTimeout ||
              type == DioExceptionType.receiveTimeout:
        return BaseApiResponse(errorCode: AppErrorCode.connectionError);
      default:
        CustomLogger.error(error);
        return BaseApiResponse(errorCode: AppErrorCode.unknownError);
    }
  }

  @protected
  BaseApiResponse parseResponse(Response<String> response) {
    if (isLoggerOutputEnabled) {
      CustomLogger.httpInterceptor.logResponse(response: response);
    }
    return ApiResponseParser.parseRawResponse(response);
  }
}
