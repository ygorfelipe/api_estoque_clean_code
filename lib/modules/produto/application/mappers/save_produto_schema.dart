import 'package:zard/zard.dart';

import '../dto/create_produto_dto.dart';

final saveProdutoSchema = z.inferType(
  fromMap: (json) => CreateProdutoDto(
    nome: json['nome'],
    descricao: json['descricao'],
    precoUnitario: json['preco_unitario'],
    estoque: json['estoque'],
  ),
  mapSchema: z.map({
    'nome':z.string().min(2, message: 'Nome do produto obrigatorio'),
    'descricao': z.string().optional(),
    'preco_unitario':z.double(message: 'Preço obrigatório').nonnegative(),
    'estoque': z.int(message: 'Estoque minimo obrigatorio').min(1).nonnegative(),
  }),
);
