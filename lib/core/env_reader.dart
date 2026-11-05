import 'package:base_flutter_proj/core/config.dart';
import 'package:flutter/foundation.dart';

/// Снимок `--dart-define`. Пустая строка значит «ключ не задан».
@immutable
class EnvDefines {
  const EnvDefines({
    this.flavor = 'dev',
    this.apiUrlDomain = '',
    this.apiUrlRelativePath = '',
    this.apiUseHttps = '',
    this.showDebugBanner = '',
    this.localeMode = '',
  });

  final String flavor;
  final String apiUrlDomain;
  final String apiUrlRelativePath;
  final String apiUseHttps;
  final String showDebugBanner;
  final String localeMode;

  static EnvDefines fromEnvironment() {
    return const EnvDefines(
      flavor: String.fromEnvironment('FLAVOR', defaultValue: 'dev'),
      apiUrlDomain: String.fromEnvironment('API_URL_DOMAIN'),
      apiUrlRelativePath: String.fromEnvironment('API_URL_RELATIVE_PATH'),
      apiUseHttps: String.fromEnvironment('API_USE_HTTPS'),
      showDebugBanner: String.fromEnvironment('SHOW_DEBUG_BANNER'),
      localeMode: String.fromEnvironment('LOCALE_MODE'),
    );
  }
}

/// Читает конфигурацию из `--dart-define` / `--dart-define-from-file`.
abstract final class EnvReader {
  static Config getConfig() => configFrom(EnvDefines.fromEnvironment());

  @visibleForTesting
  static Config configFrom(EnvDefines env) {
    final flavor = switch (env.flavor) {
      'prod' => Flavor.prod,
      'devbackend' => Flavor.devBackend,
      'dev' => Flavor.dev,
      _ => throw Exception('Unknown FLAVOR: ${env.flavor}'),
    };
    final isProd = flavor == Flavor.prod;

    return Config(
      apiUrlDomain: _orDefault(env.apiUrlDomain, 'rickandmortyapi.com'),
      apiUrlRelativePath: _orDefault(env.apiUrlRelativePath, '/api/'),
      isHttpsApi: _parseBool(env.apiUseHttps, defaultValue: true),
      flavor: flavor,
      showDebugBanner: _parseBool(env.showDebugBanner, defaultValue: !isProd),
      localeMode: _localeMode(
        env.localeMode.isEmpty
            ? (isProd ? 'russianOnly' : 'russianAndEnglish')
            : env.localeMode,
      ),
    );
  }

  static String _orDefault(String value, String fallback) {
    return value.isEmpty ? fallback : value;
  }

  static bool _parseBool(String value, {bool defaultValue = false}) {
    if (value.isEmpty) {
      return defaultValue;
    }
    return value.toLowerCase() == 'true';
  }

  static AppLocaleMode _localeMode(String value) {
    return switch (value) {
      'russianOnly' => AppLocaleMode.russianOnly,
      _ => AppLocaleMode.russianAndEnglish,
    };
  }
}
