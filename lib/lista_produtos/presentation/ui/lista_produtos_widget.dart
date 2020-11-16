import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teste_salcisne/lista_produtos/domain/entity/produto_entity.dart';

import '../bloc/lista_produtos_bloc.dart';

class ListaProdutosWidget extends StatelessWidget {
  const ListaProdutosWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return BlocBuilder(
        bloc: BlocProvider.of<ListaProdutosBloc>(context),
        // ignore: missing_return
        builder: (context, state) {
          if (state is ListaProdutosInitial) {
            return Container(
                color: Colors.white, child: Center(child: Text("Nenhum resultado encontrado", style: TextStyle(fontSize: 22.0,color: Colors.black), textAlign: TextAlign.center,)),);
          } else if (state is Error) {
            return Container(color: Colors.white, child: Center(child: Text("Erro Inesperado", style: TextStyle(fontSize: 22.0,color: Colors.black), textAlign: TextAlign.center,)),);
          } else if (state is Loading) {
            return Container(color: Colors.white, child: Center(child: CircularProgressIndicator(),));
          } else if (state is ListaCarregada) {
            final stateAsPlayerFetchedState = state as ListaCarregada;
            final produtos = stateAsPlayerFetchedState.produtos;
            return buildProdutosList(produtos);
          }
        },
      );
  }

  Widget buildProdutosList(List<Produto> produtos){
    return Expanded(
      child: ListView.separated(
        itemBuilder: (BuildContext context, index){
          Produto produto = produtos[index];
          return Container(
            color: Colors.white,
            child: ListTile(
              leading: Text(produto.nome, style: TextStyle(fontSize: 22.0, color: Colors.black),),
              title: Text(
                produto.local,
                style: TextStyle(fontSize: 22.0, color: Colors.black),
              ),
              subtitle: Text(
                produto.quantidade.toString(),
                style: TextStyle(fontSize: 16.0, color: Colors.black87)
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, index) {
          return Divider(
            height: 8.0,
            color: Colors.transparent,
          );
        },
        itemCount: produtos.length,
      ),
    );
  }

}
