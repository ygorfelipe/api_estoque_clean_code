import 'package:api_estoque_clean_code/application/database/database_connection_configuration.dart';
import 'package:injectable/injectable.dart';
import 'package:mysql_client/mysql_client.dart';

abstract interface class IDatabaseConnection {
  //Future<IResultSet> execute(String sql, [List<dynamic>? params]);
  Future<IResultSet> execute(String sql, [Map<String, dynamic>? params]);
  Future<T> transcation<T>(
    Future<T> Function(MySQLConnection connection) action,
  );
  Future<void> close();
}

@LazySingleton(as: IDatabaseConnection)
class DatabaseConnectionImpl implements IDatabaseConnection {
  late final MySQLConnectionPool _pool;
  DatabaseConnectionImpl(DatabaseConnectionConfiguration config) {
    _pool = MySQLConnectionPool(
      host: config.host,
      port: config.port,
      userName: config.user,
      password: config.password,
      maxConnections: config.maxConnections,
    );
  }

  @override
  Future<void> close() => _pool.close();

  @override
  Future<IResultSet> execute(String sql, [Map<String, dynamic>? params]) =>
      _pool.execute(sql, params);

  @override
  Future<T> transcation<T>(
    Future<T> Function(MySQLConnection connection) action,
  ) => _pool.transactional((connection) => action(connection));
}
