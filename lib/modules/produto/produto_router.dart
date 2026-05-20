
import 'package:api_estoque_clean_code/application/routers/router_configure.dart';
import 'package:get_it/get_it.dart';
import 'package:shelf_router/shelf_router.dart';

import 'presentation/controllers/produto_controller.dart';

class ProdutoRouter implements IRouter{
  final produtoController = GetIt.I.get<ProdutoController>();

  @override
  void configure(Router router) {
    router.mount('/produto', produtoController.router.call);
  }
  
}