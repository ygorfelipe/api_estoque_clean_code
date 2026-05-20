class CreateProdutoDto {
  final String nome;
  final String descricao;
  final double precoUnitario;
  final int estoque;

  CreateProdutoDto({
    required this.nome,
    required this.descricao,
    required this.precoUnitario,
    required this.estoque,
  });
}
