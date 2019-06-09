import 'package:flutter/material.dart';
import 'package:pocflutterapp/dominio/publicacao.dart';
import 'package:pocflutterapp/screens/detalhes_publicacao_repo.dart';

class ItemRepositorio extends StatelessWidget {

  final Publicacao publicacao;

  ItemRepositorio(this.publicacao);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => DetalhesPublicacaoRepo(publicacao)));
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
                              color: Colors.grey,
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
                          child: new Text(publicacao.resumo,
                            maxLines: publicacao.resumo.length,),
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
}
