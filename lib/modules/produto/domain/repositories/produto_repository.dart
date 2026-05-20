import 'package:api_estoque_clean_code/modules/produto/domain/entities/produto.dart';


abstract interface class ProdutoRepository {
  Future<void> create (Produto produto);
  
}