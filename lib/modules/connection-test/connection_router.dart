import 'package:get_it/get_it.dart';
import 'package:shelf_router/shelf_router.dart';

import '../../application/routers/router_configure.dart';
import 'controller/connection_controller.dart';

class ConnectionRouter implements IRouter {
  final connectionController = GetIt.I.get<ConnectionController>();

  @override
  void configure(Router router) {
    router.mount('/ping', connectionController.router.call);
  }
}
