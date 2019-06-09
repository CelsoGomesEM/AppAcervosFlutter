import 'package:flutter/material.dart';
import 'package:pocflutterapp/dominio/publicacao.dart';
import 'package:pocflutterapp/services/publicacao_service.dart';
import 'package:pocflutterapp/widgets/item_repo.dart';

class PublicacoesRepositorio extends StatelessWidget {

  List<Publicacao> _publicacoes;

  @override
  Widget build(BuildContext context) {
    var _futureBuilder = _crieFutureBuilder();
    return Scaffold(
      body: _futureBuilder,
    );
  }

  Container _crieFutureBuilder() {
    return Container(
      child: FutureBuilder(
        future: _obtenhaPublicacoesDoRepositorio(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return new Center(
                child: CircularProgressIndicator(
                ),
              );
            default:
              if (snapshot.hasError) {
                return Center(
                  child: Text("Erro:${snapshot.error}"),
                );
              }
              else if (snapshot.hasData) {
                return _CreateListViewBuilder(context, snapshot);
              }
              else {
                return new Center(
                  child: Text("Não foram cadastradas publicações",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                    ),),
                );
              }
          }
        },
      ),
    );
  }

  Widget _CreateListViewBuilder(BuildContext context, AsyncSnapshot snapshot){
    _publicacoes = snapshot.data;
    return new ListView.builder(
      padding: EdgeInsets.all(4.0),
      itemCount: _publicacoes.length,
      itemBuilder:(BuildContext context, int index){
        return ItemRepositorio(_publicacoes[index]);
      },
    );
  }

  Future<List<Publicacao>>_obtenhaPublicacoesDoRepositorio() async {

    var servicoPublicacoesApi = new PublicacaoService();
    var resultado = await servicoPublicacoesApi.obtenhaTodasPublicacoesDoRepositorio();

    return resultado.isEmpty ? null : resultado;
  }
}
