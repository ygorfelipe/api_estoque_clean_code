
import 'package:api_estoque_clean_code/modules/produto/produto_router.dart';
import 'package:shelf_router/shelf_router.dart';
import '../../modules/connection-test/connection_router.dart';

abstract class IRouter {
  void configure(Router router);
}

class RouterConfigure {
  final Router _router;

  RouterConfigure(this._router);
  final List<IRouter> _routers = [
    ConnectionRouter(),
    ProdutoRouter(),

  ];
  void configure() {
    for (var r in _routers) {
      r.configure(_router);
    }
  }
}
