import 'dart:async';
import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

part 'connection_controller.g.dart';

@Injectable()
class ConnectionController {
  @Route.get('/')
  Future<Response> registerStudent(Request request) async {
    try {
      return Response.ok(jsonEncode({'message': 'pong'}));
    } catch (e) {
      return Response.internalServerError();
    }
  }

  Router get router => _$ConnectionControllerRouter(this);
}
