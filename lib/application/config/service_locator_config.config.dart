// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../modules/connection-test/controller/connection_controller.dart'
    as _i553;
import '../../modules/produto/application/usecases/create_produto_usecase.dart'
    as _i879;
import '../../modules/produto/domain/repositories/produto_repository.dart'
    as _i716;
import '../../modules/produto/infra/repositories/produto_repository_impl.dart'
    as _i994;
import '../../modules/produto/presentation/controllers/produto_controller.dart'
    as _i673;
import '../database/database_connection.dart' as _i396;
import '../database/database_connection_configuration.dart' as _i896;
import '../logger/i_logger.dart' as _i742;
import '../logger/logger.dart' as _i512;

// initializes the registration of main-scope dependencies inside of GetIt
_i174.GetIt $initGetIt(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i526.GetItHelper(getIt, environment, environmentFilter);
  gh.factory<_i553.ConnectionController>(() => _i553.ConnectionController());
  gh.lazySingleton<_i396.IDatabaseConnection>(
    () => _i396.DatabaseConnectionImpl(
      gh<_i896.DatabaseConnectionConfiguration>(),
    ),
  );
  gh.lazySingleton<_i742.ILogger>(() => _i512.Logger());
  gh.lazySingleton<_i716.ProdutoRepository>(
    () => _i994.ProdutoRepositoryImpl(
      gh<_i742.ILogger>(),
      gh<_i396.IDatabaseConnection>(),
    ),
  );
  gh.factory<_i879.CreateProdutoUsecase>(
    () => _i879.CreateProdutoUsecase(gh<_i716.ProdutoRepository>()),
  );
  gh.factory<_i673.ProdutoController>(
    () => _i673.ProdutoController(
      gh<_i742.ILogger>(),
      gh<_i879.CreateProdutoUsecase>(),
    ),
  );
  return getIt;
}
