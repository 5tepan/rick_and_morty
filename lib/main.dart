import 'dart:async';

import 'package:base_flutter_proj/core/debug/logger.dart';
import 'package:base_flutter_proj/core/env_reader.dart';
import 'package:base_flutter_proj/runner.dart';

void main() async {
  final config = EnvReader.getConfig();
  await runZonedGuarded(() async {
    await run(config);
  }, CustomLogger.onError);
}
