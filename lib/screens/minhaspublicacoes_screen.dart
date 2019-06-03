import 'package:flutter/material.dart';
import 'package:pocflutterapp/dominio/discente.dart';
import 'package:pocflutterapp/dominio/publicacao.dart';
import 'package:pocflutterapp/models/sessao_usuario_model.dart';
import 'package:pocflutterapp/screens/criapublicacao_screen.dart';
import 'package:pocflutterapp/services/publicacao_service.dart';
import 'dart:async';

import 'package:pocflutterapp/widgets/item_publicacao.dart';
import 'package:scoped_model/scoped_model.dart';

class MinhasPublicacoes extends StatefulWidget {
  @override
  _MinhasPublicacoesState createState() => _MinhasPublicacoesState();
}

class _MinhasPublicacoesState extends State<MinhasPublicacoes> {

  final _scafoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var _futureBuilder = _crieFutureBuilder();
    return Scaffold(
      key: _scafoldKey,
      body: _futureBuilder,
      floatingActionButton: Container(
        child: ScopedModelDescendant<SessaoUsuarioModel>(builder: (context, child, model){
         return FloatingActionButton(
           tooltip: "Adicione",
           child: Icon(Icons.add),
           onPressed: (){
             Navigator.of(context).push(
                 MaterialPageRoute(
                     builder: (context) => CriaPublicacao(model.discenteLogado)
                 )
             );
           },
         );
        },
        ),
      ),
    );
  }

  Container _crieFutureBuilder(){
    return new Container(
      child: ScopedModelDescendant<SessaoUsuarioModel>(
          builder: (context, child, model){
            return FutureBuilder(
              future: _obtenhaPublicacoesDoUsuario(model.discenteLogado),
              builder: (BuildContext context, AsyncSnapshot snapshot){
                switch(snapshot.connectionState){
                  case ConnectionState.none:
                  case ConnectionState.waiting:
                    return new Center(
                      child: CircularProgressIndicator(
                      ),
                    );
                  default:
                    if(snapshot.hasError){
                      return Center(
                        child: Text("Erro:${snapshot.error}"),
                      );
                    }
                    else if(snapshot.hasData){
                      return _CreateListViewBuilder(context, snapshot);
                    }
                    else{
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
            );
          }
      )
    );
  }

  Future<List<Publicacao>>_obtenhaPublicacoesDoUsuario(Discente discenteLogado) async {
    var servicoPublicacoesApi = new PublicacaoService();

    var resultado = await servicoPublicacoesApi.obtenhaPublicacoesDoUsuario(discenteLogado.id);

    return resultado.isEmpty ? null : resultado;
  }

  Widget _CreateListViewBuilder(BuildContext context, AsyncSnapshot snapshot){
    List<Publicacao> publicacoes = snapshot.data;
    return new ListView.builder(
        padding: EdgeInsets.all(4.0),
        itemCount: publicacoes.length,
        itemBuilder:(BuildContext context, int index){
          return ItemPublicacao(publicacao: publicacoes[index],);
        },
    );

  }
}

