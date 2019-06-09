import 'package:flutter/material.dart';
import 'package:pocflutterapp/dominio/publicacao.dart';
import 'package:meta/meta.dart';
import 'package:pocflutterapp/models/minhas_publicacoes_model.dart';
import 'package:pocflutterapp/screens/detalhes_publicacao.dart';

class ItemPublicacao extends StatelessWidget {

  final Publicacao publicacao;

  ItemPublicacao(this.publicacao);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: (){
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => DetalhesPublicacao()));
        },
        onLongPress: () async {
          var resultado = await _ExibaDialogoDeConfirmacao(context);

          if(resultado == true){
            MinhasPublicacoesModel.of(context).removaPublicacao(publicacao);
          }
        },
        child: Card(
          child: Container(
            padding: EdgeInsets.all(11.0),
            height: 230.0,
            color: Color.fromRGBO(104, 222, 202, 1),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(2.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                              publicacao.titulo,
                              maxLines: 2,
                              style: new TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0
                              ),
                        ),
                        Text(publicacao.subtitulo,
                          style: TextStyle(
                              fontSize: 12.0),
                        ),
                         SizedBox(
                           height: 5.0,
                         ),
                         Text("Por: ${publicacao.autores}",
                           maxLines: 2,
                           style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0
                           ),
                         ),
                         Container(
                              margin: new EdgeInsets.only(top: 5.0),
                              child: new Text(publicacao.resumo,maxLines: publicacao.resumo.length,),
                         ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ),
    );
  }

  Future _ExibaDialogoDeConfirmacao(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Confirmação"),
          content: Text(
            "Deseja remover publicacao?",
          ),
          actions: [
            FlatButton(
              child: Text("NÃO"),
              onPressed: () {
                Navigator.pop(context, false);
              },
            ),
            FlatButton(
              child: Text("SIM"),
              onPressed: () {
                Navigator.pop(context, true);
              },
            ),
          ],
        );
      },
    );
  }


}
