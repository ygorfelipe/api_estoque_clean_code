
import 'package:api_estoque_clean_code/modules/produto/application/dto/create_produto_dto.dart';

import '../mappers/save_produto_schema.dart';

class ProdutoValidator {
  static CreateProdutoDto validateCreate(Map<String, dynamic> json,) {
    final parsed = saveProdutoSchema.parse(json);
 return parsed;
  }
}