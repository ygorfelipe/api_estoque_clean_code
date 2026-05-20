import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:injectable/injectable.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:zard/zard.dart';

import '../../../../application/logger/i_logger.dart';
import '../../application/usecases/create_produto_usecase.dart';
import '../../application/validators/produto_validator.dart';

part 'produto_controller.g.dart';

@Injectable()
class ProdutoController {
  final ILogger _logger;
  final CreateProdutoUsecase _usecase;

  ProdutoController(this._logger, this._usecase);

  @Route.get('/')
  Future<Response> find(Request request) async {
    return Response.ok(jsonEncode(''));
  }

  @Route.post('/')
  Future<Response> create(Request request) async {
    try {
      final body = await request.readAsString();
      final resBody = jsonDecode(body);

      log(resBody.toString());
      final dto = ProdutoValidator.validateCreate(jsonDecode(body));
      await _usecase.execute(dto);

      return Response.ok(
        jsonEncode({'message': 'Produto cadastrado com sucesso'}),
      );
    } on ZardError catch (e) {
      _logger.error('Erro zard: ${e.messages}');
      return Response.badRequest(body: jsonEncode({'message': e.messages}));
    } catch (e, s) {
      _logger.error('Erro ao criar produto', e, s);
      return Response.internalServerError();
    }
  }

  Router get router => _$ProdutoControllerRouter(this);
}
