import 'produto_exception.dart';

class ProdutoNotFound implements ProdutoException {
  @override
  String get msg => 'Produto não encontrado';
  
}