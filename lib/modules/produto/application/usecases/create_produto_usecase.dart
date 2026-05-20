
import 'package:api_estoque_clean_code/modules/produto/application/dto/create_produto_dto.dart';
import 'package:api_estoque_clean_code/modules/produto/application/mappers/produto_mapper.dart';
import 'package:api_estoque_clean_code/modules/produto/domain/repositories/produto_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class CreateProdutoUsecase {
  final ProdutoRepository _repository;

  CreateProdutoUsecase(this._repository);

  Future<void> execute (CreateProdutoDto dto)async{
    final produto = ProdutoMapper.fromCreateDto(dto);
    await _repository.create(produto);
  }
}