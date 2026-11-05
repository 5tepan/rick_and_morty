import 'dart:convert';

import 'package:base_flutter_proj/core/base/base_api/api_response.dart';
import 'package:base_flutter_proj/core/base/base_api/entities/base_api_response.dart';
import 'package:base_flutter_proj/core/base/base_api/json_schema.dart';
import 'package:base_flutter_proj/core/debug/logger.dart';
import 'package:base_flutter_proj/core/errors/app_error_code.dart';
import 'package:base_flutter_proj/core/errors/app_exception.dart';
import 'package:dio/dio.dart';

/// Утилитарный класс для парсинга ответа сервера.
class ApiResponseParser {
  /// Разбирает JSON ответа без дополнительной обёртки.
  static BaseApiResponse parseRawResponse(Response<String> response) {
    final status = response.statusCode ?? 0;
    final raw = response.data;
    final isSuccess = status >= 200 && status < 300;
    Object? json;
    try {
      json = raw == null ? null : jsonDecode(raw);
    } on FormatException {
      return BaseApiResponse(
        statusCode: status,
        rawData: raw,
        errorCode: isSuccess
            ? AppErrorCode.invalidJson
            : AppErrorCode.requestFailed,
      );
    }

    if (!isSuccess) {
      return BaseApiResponse(
        statusCode: status,
        rawData: raw,
        dataJson: json,
        errorCode: AppErrorCode.requestFailed,
      );
    }
    if (json is! Map<String, dynamic>) {
      return BaseApiResponse(
        statusCode: status,
        rawData: raw,
        errorCode: AppErrorCode.invalidJson,
      );
    }
    return BaseApiResponse(statusCode: status, rawData: raw, dataJson: json);
  }

  static ApiResponse<List<T>> parseListFromResponse<T>(
    BaseApiResponse response, {
    required String key,
    required T Function(Map<String, dynamic>) fromJson,
    AppErrorCode emptyErrorCode = AppErrorCode.dataNotFound,
  }) {
    try {
      if (response.isError) {
        return ApiResponse.error(
          errorCode: response.errorCode ?? AppErrorCode.requestFailed,
          serverMessage: response.serverMessage,
          baseApiResponse: response,
        );
      }

      final jsonData = (response.dataJson as Map?)?[key];
      if (jsonData == null) {
        return ApiResponse.error(
          errorCode: emptyErrorCode,
          baseApiResponse: response,
        );
      }
      final list = (jsonData as List<dynamic>)
          .map((e) => fromJson(e as JsonSchema))
          .toList();
      return ApiResponse(baseApiResponse: response, result: list);
    } catch (e, s) {
      CustomLogger.error('Parse list error', e, s);
      return ApiResponse.error(
        errorCode: AppErrorCode.parseError,
        baseApiResponse: response,
      );
    }
  }

  /// Возвращает объект или выбрасывает общую ошибку API.
  static T parseObjectOrThrow<T extends Object>(
    BaseApiResponse response, {
    required T Function(Map<String, dynamic>) fromJson,
    String? key,
    AppErrorCode emptyErrorCode = AppErrorCode.dataNotFound,
  }) {
    final parsed = parseObjectFromResponse<T>(
      response,
      fromJson: fromJson,
      key: key,
      emptyErrorCode: emptyErrorCode,
    );
    final result = parsed.result;
    if (parsed.isError || result == null) {
      throw AppException(
        parsed.errorCode ?? AppErrorCode.requestFailed,
        serverMessage: parsed.serverMessage,
      );
    }
    return result;
  }

  static ApiResponse<T> parseObjectFromResponse<T>(
    BaseApiResponse response, {
    required T Function(Map<String, dynamic>) fromJson,
    String? key,
    AppErrorCode emptyErrorCode = AppErrorCode.dataNotFound,
  }) {
    try {
      if (response.isError) {
        return ApiResponse.error(
          errorCode: response.errorCode ?? AppErrorCode.requestFailed,
          serverMessage: response.serverMessage,
          baseApiResponse: response,
        );
      }

      if (response.dataJson == null) {
        return ApiResponse.error(
          errorCode: emptyErrorCode,
          baseApiResponse: response,
        );
      }

      final jsonData = (key?.isNotEmpty ?? false)
          ? (response.dataJson as Map)[key]
          : response.dataJson;
      if (jsonData == null) {
        return ApiResponse.error(
          errorCode: emptyErrorCode,
          baseApiResponse: response,
        );
      }
      final object = fromJson(jsonData as JsonSchema);
      return ApiResponse(baseApiResponse: response, result: object);
    } catch (e, s) {
      CustomLogger.error('Parse object error', e, s);
      return ApiResponse.error(
        errorCode: AppErrorCode.parseError,
        baseApiResponse: response,
      );
    }
  }
}
