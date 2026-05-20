// ignore_for_file: public_member_api_docs, sort_constructors_first

class Produto {
  final int? id;
  final String nome;
  final String? descricao;
  final double precoUnitario;
  final bool ativo;
  final int estoque;
  final String? urlImage;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? userId;
  Produto({
    this.id,
    required this.nome,
    this.descricao,
    required this.precoUnitario,
     this.ativo = true,
    required this.estoque,
    this.urlImage,
     this.createdAt,
    this.updatedAt,
     this.userId,
  });


  double calcularPromocao(double percentual) {
    final desconto = (precoUnitario * percentual) / 100;

    return double.parse((precoUnitario - desconto).toStringAsFixed(2));
  }
  bool get possuiEstoque => estoque > 0;
}

