import 'package:base_flutter_proj/core/assets/app_assets_preloader.dart';
import 'package:base_flutter_proj/core/debug/logger.dart';
import 'package:base_flutter_proj/core/storage/hive_bootstrap.dart';

abstract final class AppBootstrap {
  static Future<void> initialize() async {
    CustomLogger.init();
    await HiveBootstrap.ensureInitialized();
    await AppAssetsPreloader.preloadVectors();
  }
}
