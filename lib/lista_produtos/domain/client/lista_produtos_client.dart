

import '../entity/produto_entity.dart';

abstract class ProdutosClient {
  Future<List<Produto>> getListaProdutos();
}
