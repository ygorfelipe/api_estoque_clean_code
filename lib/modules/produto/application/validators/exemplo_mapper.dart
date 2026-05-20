/*

import 'package:zard/zard.dart';

final saveProdutoSchema = z.inferType(
  fromMap: (json) => CreateProductDTO(
    nome: json['nome'],
    descricao: json['descricao'],
    precoBase: json['preco_base'],
    estoque: json['estoque'],
  ),
  mapSchema: z.map({
    'nome': z
        .string()
        .min(2, message: 'Nome do produto conter minimo 2 caracteres')
        .optional(),
    'descricao': z.string().optional(),
    'preco_base': z.double(
      message: 'Preco obrigatorio',
    ).nonnegative(message: 'Preco nao pode ser negativo').optional(),
    'estoque': z.int(
      message: 'Estoque minimo obrigatorio',
    ).nonnegative(message: 'Estoque nao pode ser negativo').optional(),
  }),
);

final updateProdutoSchema = z.inferType(
  fromMap: (json) => UpdateProductDTO(
    id: json['id'],
    nome: json.containsKey('nome') ? json['nome'] : null,
    descricao: json.containsKey('descricao') ? json['descricao'] : null,
    precoBase: json.containsKey('preco_base') ? json['preco_base'] : null,
    estoque: json.containsKey('estoque') ? json['estoque'] : null,
    ativo: json.containsKey('ativo') ? json['ativo'] : null,
    percentual: json.containsKey('percentual') ? json['percentual'] : null,
    promocaoAtiva: json.containsKey('promocao_ativa')
        ? json['promocao_ativa']
        : null,
    dataInicioPromocao: json.containsKey('data_inicio_promocao')
        ? json['data_inicio_promocao']
        : null,
    dataFimPromocao: json.containsKey('data_fim_promocao')
        ? json['data_fim_promocao']
        : null,
    camposEnviados: json.keys.toSet(),
  ),
  mapSchema: z.map({
    'id': z.int(),
    'nome': z.string().nullish(),
    'descricao': z.string().nullish(),
    'preco_base': z.double().nullish(),
    'estoque': z.int().nullish(),
    'ativo': z.bool().nullish(),
    'percentual': z.double().nullish(),
    'promocao_tiva': z.bool().nullish(),
    'data_inicio_promocao': z.date().nullish(),
    'data_fim_promocao': z.date().nullish(),
  }),
);

final dataProductSchema = z.inferType(
  fromMap: (json) {
    return Produto(
      id: json['id'],
      nome: json['nome'],
      descricao: json['descricao'],
      precoBase: json['preco_base'],
      estoque: json['estoque'],
      ativo: json['ativo'] == 1 ? true : false,
      imageUrl: json['image_url'],
      precoPromocional: json['preco_promocional'],
      promocaoAtiva: json['promocao_ativa'] == 1 ? true : false,
      dataInicioPromocao: json['data_inicio_promocao'],
      dataFimPromocao: json['data_fim_promocao'],
    );
  },
  mapSchema: z.map({
    'id': z.int(),
    'nome': z.string(),
    'descricao': z.string().nullable().optional(),
    'preco_base': z.num().nullable().optional(),
    'estoque': z.int().nullable().optional(),
    'ativo': z.int().nullable().optional(),
    'image_url': z.coerce.string(),
    'preco_promocional': z.num().nullable().optional(),
    'promocao_ativa': z.int().nullable().optional(),
    'data_inicio_promocao': z.coerce.date().nullish(),
    'data_fim_promocao': z.coerce.date().nullish(),
  }),
);

final updateSalesSchema = z.inferType(
  fromMap: (json) => UpdateSalesProductDto(
    id: json['id'],
    percentual: json['percentual'],
    dataInicioPromocao: DateTime.parse(json['data_inicio_promocao']),
    dataFimPromocao: DateTime.parse(json['data_fim_promocao']),
    promocaoAtiva: json['promocao_ativa'],
  ),
  mapSchema: z.map({
    'id': z.int(),
    'percentual': z.double(message: 'Percentual obrigatorio'),
    'data_inicio_promocao': z.string(message: 'Data inicial obrigatoria'),
    'data_fim_promocao': z.string(message: 'Data final obrigatoria'),
    'promocao_ativa': z.bool(message: 'Informe o status da promocao'),
  }),
);

*/