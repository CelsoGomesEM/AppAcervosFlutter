import 'package:flutter/material.dart';
import 'package:pocflutterapp/dominio/publicacao.dart';

class DetalhesPublicacaoRepo extends StatefulWidget {

  final Publicacao publicacao;

  DetalhesPublicacaoRepo(this.publicacao);

  @override
  _DetalhesPublicacaoRepoState createState() => _DetalhesPublicacaoRepoState(publicacao);
}

class _DetalhesPublicacaoRepoState extends State<DetalhesPublicacaoRepo> {

  final Publicacao publicacao;

  _DetalhesPublicacaoRepoState(this.publicacao);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text("Detalhes"),
        centerTitle: true,
      ),
      body: Container(
          child: Card(
            color: Color.fromRGBO(104, 222, 202, 1),
            margin: EdgeInsets.all(8.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    "Nome do Acervo: ${publicacao.titulo}"
                  )
                ],
              ),
            ),
          )
      ),
    );
  }
}

