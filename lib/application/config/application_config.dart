import 'package:api_estoque_clean_code/application/database/database_connection_configuration.dart';
import 'package:dotenv/dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:shelf_router/shelf_router.dart';

import '../routers/router_configure.dart';
import 'service_locator_config.dart';

class ApplicationConfig {
  final env = DotEnv();

  Future<void> loadConfigApplication(Router router) async {
    await _loadEnv();
    _loadDatabaseConfig();
    _loadDependecies();
    _loadRoutersConfigure(router);
  }

  Future<void> _loadEnv() async => env.load();

  void _loadDatabaseConfig() {
    final databaseConfig = DatabaseConnectionConfiguration(
      host: env['DATABASE_HOST'] ?? env['databaseHost']!,
      user: env['DATABASE_USER'] ?? env['databaseUser']!,
      port: int.tryParse(env['DATABASE_PORT'] ?? env['databasePort']!) ?? 0,
      password: env['DATABASE_PASSWORD'] ?? env['databasePassword']!,
      databaseName: env['DATABASE_NAME'] ?? env['databaseName']!,
      maxConnections:
          int.tryParse(env['DATABASE_PORT'] ?? env['databasePort']!) ?? 0,
    );
    GetIt.I.registerSingleton(databaseConfig);
  }

  void _loadDependecies() => configureDependencies();

  void _loadRoutersConfigure(Router router) =>
      RouterConfigure(router).configure();
}
