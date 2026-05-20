abstract interface class ProdutoException implements Exception {
  final String msg;

  const ProdutoException(this.msg);
}
