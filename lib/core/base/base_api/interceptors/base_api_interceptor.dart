import 'package:dio/dio.dart';
import 'package:package_info_plus/package_info_plus.dart';

class BaseApiInterceptor extends Interceptor {
  BaseApiInterceptor({required this.packageInfo});

  final PackageInfo packageInfo;

  Map<String, String> get headers => {
    'X-Client-Version': '${packageInfo.version}+${packageInfo.buildNumber}',
    'accept': 'application/json',
  };

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers.addAll(headers);

    handler.next(options);
  }
}
