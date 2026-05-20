
import 'package:api_estoque_clean_code/application/database/database_connection.dart';
import 'package:api_estoque_clean_code/application/exception/data_base_exception.dart';
import 'package:api_estoque_clean_code/application/logger/i_logger.dart';
import 'package:api_estoque_clean_code/modules/produto/domain/entities/produto.dart';
import 'package:api_estoque_clean_code/modules/produto/domain/repositories/produto_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:mysql_client/exception.dart';

@LazySingleton(as: ProdutoRepository)
class ProdutoRepositoryImpl implements ProdutoRepository{
  final ILogger _logger;
  final IDatabaseConnection _connection;

  ProdutoRepositoryImpl(this._logger, this._connection);


  @override
  Future<void> create(Produto produto) async {
    try {
      await _connection.execute(
        ''' 
 INSERT INTO tb_produtos (
   nome,
   descricao,
   preco_unitario,
   ativo,
   estoque,
   url_image,
   created_at
 )
 VALUES (
   :nome,
   :descricao,
   :preco_unitario,
   :ativo,
   :estoque,
   :url_image,
   :created_at
 )
 ''',
        {
          'nome': produto.nome,
          'descricao': produto.descricao,
          'preco_unitario': produto.precoUnitario,
          'ativo': produto.ativo,
          'estoque': produto.estoque,
          'url_image': produto.urlImage,
          'created_at': produto.createdAt,
        },
      );
    } on MySQLException catch (e, s) {
      _logger.error('Erro ao criar produto', e, s);
      throw DataBaseException();
    }
  }
  
}