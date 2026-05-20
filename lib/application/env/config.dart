
import 'package:dotenv/dotenv.dart';

import '../logger/logger.dart';

class Env {
  static Env? _instance;
  Logger? _logger;
  DotEnv env = DotEnv(includePlatformEnvironment: true)..load();

  Env._();

  static Env get i {
    _instance ??= Env._();
    return _instance!;
  }

  void load() {
    env = DotEnv()..load();
    _logger?.infoServer(this);
  }

  String? operator [](String key) => env[key] ?? '';
}
