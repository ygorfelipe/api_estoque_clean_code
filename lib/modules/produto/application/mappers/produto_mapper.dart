import 'package:api_estoque_clean_code/modules/produto/application/dto/create_produto_dto.dart';
import 'package:api_estoque_clean_code/modules/produto/domain/entities/produto.dart';

class ProdutoMapper {
  static Produto fromCreateDto(CreateProdutoDto dto) {
    return Produto(
      nome: dto.nome,
      descricao: dto.descricao,
      precoUnitario: dto.precoUnitario,
      estoque: dto.estoque,
    );
  }
}
