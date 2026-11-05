import 'package:base_flutter_proj/core/debug/http_log_interceptor.dart';
import 'package:flutter/foundation.dart';
import 'package:talker_flutter/talker_flutter.dart';

typedef LogEmit =
    void Function(Object msg, [Object? exception, StackTrace? stackTrace]);

// Класс для удобства работы с Talker
abstract final class CustomLogger {
  static late final Talker _talker;
  static bool _isInitialized = false;
  static bool _isTalkerCreated = false;

  static String routeName = 'talker';

  static late final HTTPLogInterceptor _httpInterceptor = HTTPLogInterceptor(
    talker: _ensureTalker(),
  );

  static HTTPLogInterceptor get httpInterceptor => _httpInterceptor;

  static Talker get talker => _ensureTalker();

  static void error(Object msg, [Object? exception, StackTrace? stackTrace]) {
    _ensureTalker().error(msg, exception, stackTrace);
  }

  static void warning(Object msg, [Object? exception, StackTrace? stackTrace]) {
    _ensureTalker().warning(msg, exception, stackTrace);
  }

  static void info(Object msg, [Object? exception, StackTrace? stackTrace]) {
    _ensureTalker().info(msg, exception, stackTrace);
  }

  static void verbose(Object msg, [Object? exception, StackTrace? stackTrace]) {
    _ensureTalker().verbose(msg, exception, stackTrace);
  }

  static void init() {
    _ensureTalker();
    if (_isInitialized) {
      return;
    }

    FlutterError.onError = onFlutterError;

    PlatformDispatcher.instance.onError = (error, stack) {
      CustomLogger.onError(error, stack);
      return true;
    };

    _isInitialized = true;
  }

  static Talker _ensureTalker() {
    if (_isTalkerCreated) {
      return _talker;
    }
    _talker = TalkerFlutter.init();
    _isTalkerCreated = true;
    return _talker;
  }

  static void onFlutterError(FlutterErrorDetails details) {
    _ensureTalker().error(details.exception, details.stack);
  }

  static void onError(Object error, StackTrace stack) {
    _ensureTalker().error(error, stack);
  }
}
