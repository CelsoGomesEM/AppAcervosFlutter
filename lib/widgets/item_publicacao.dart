import 'package:flutter/material.dart';
import 'package:pocflutterapp/models/publicacao_model.dart';
import 'package:meta/meta.dart';
import 'package:pocflutterapp/screens/detalhes_publicacao.dart';

class ItemPublicacao extends StatelessWidget {

  final PublicacaoModel publicacao;

  ItemPublicacao({@required this.publicacao});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: (){
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => DetalhesPublicacao()));
        },
        child: Card(
          child: Container(
            padding: EdgeInsets.all(8.0),
            height: 120.0,
            child: Row(
              children: <Widget>[
                Text(publicacao.titulo, textAlign: TextAlign.end, style: TextStyle(
                  fontSize: 25
                ),)
              ],
            ),
          )
        ),
    );
  }
}
