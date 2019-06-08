import 'package:flutter/material.dart';
import 'package:pocflutterapp/models/minhas_publicacoes_model.dart';
import 'package:pocflutterapp/models/sessao_usuario_model.dart';
import 'package:pocflutterapp/screens/criapublicacao_screen.dart';
import 'package:pocflutterapp/widgets/item_publicacao.dart';
import 'package:scoped_model/scoped_model.dart';

class PublicacoesUsuarioScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var _futureBuilder = _crieFutureBuilder();
    return Scaffold(
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
        child: ScopedModelDescendant<MinhasPublicacoesModel>(
            builder: (context, child, model){
              if(model.publicacoesDoUsuario == null || model.publicacoesDoUsuario.length == 0){
                return Center(
                  child: Text("Não Existe publicações a serem exibidas",
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold
                    ),
                    textAlign: TextAlign.center,
                  ),
                );
              }
              if(model.publicacoesDoUsuario.length > 0){
                return ListView(
                  children: <Widget>[
                    Column(
                      children: model.publicacoesDoUsuario.map((pub){
                        return ItemPublicacao(pub);
                      }).toList(),
                    )
                  ],
                );
              }
            }
        )
    );
  }
}
