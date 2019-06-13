import 'package:flutter/material.dart';
import 'package:pocflutterapp/dominio/publicacao.dart';


class DetalhesPublicacao extends StatefulWidget {

  final Publicacao publicacao;

  DetalhesPublicacao(this.publicacao);

  @override
  _DetalhesPublicacaoState createState() => _DetalhesPublicacaoState(publicacao);
}

class _DetalhesPublicacaoState extends State<DetalhesPublicacao> {

  final Publicacao publicacao;

  _DetalhesPublicacaoState(this.publicacao);


  final _formKey = GlobalKey<FormState>();
  final _scafoldKey = GlobalKey<ScaffoldState>();
  final _tituloController = TextEditingController();
  final _subtituloController = TextEditingController();
  final _palavrasChaveController = TextEditingController();
  final _autoresController = TextEditingController();
  final _resumoController = TextEditingController();
  String _filePath;


  @override
  Widget build(BuildContext context) {

    _tituloController.text = publicacao.titulo;
    _subtituloController.text = publicacao.subtitulo;
    _palavrasChaveController.text = publicacao.palavrachave;
    _autoresController.text = publicacao.autores;
    _resumoController.text = publicacao.resumo;

    return Scaffold(
      appBar: AppBar(
        title: Text("Detalhes"),
        centerTitle: true,
      ),
      key: _scafoldKey,
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(15.0),
          children: <Widget>[
            TextFormField(
              controller: _tituloController,
              decoration: InputDecoration(
                hintText: 'Título',
              ),
              maxLength: 250,
              validator: (texto){
                if(texto.isEmpty)
                  return "Título inválido!";
              },
            ),
            SizedBox(
              height: 2.0,
            ),
            TextFormField(
              controller: _subtituloController,
              decoration: InputDecoration(
                hintText: 'Subtítulo',
              ),
              maxLength: 250,
              validator: (texto){
                if(texto.isEmpty)
                  return "Subtítulo inválido!";
              },
            ),
            SizedBox(
              height: 2.0,
            ),
            TextFormField(
              controller: _palavrasChaveController,
              decoration: InputDecoration(
                hintText: 'Palavras-chave',
              ),
              maxLength: 250,
              validator: (texto){
                if(texto.isEmpty)
                  return "Palavras-chave inválido!";
              },
            ),
            SizedBox(
              height: 2.0,
            ),
            TextFormField(
              controller: _autoresController,
              decoration: InputDecoration(
                hintText: 'Autores',
              ),
              maxLength: 250,
              validator: (texto){
                if(texto.isEmpty)
                  return "Autores inválido!";
              },
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              "Resumo: ",
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 7, 0, 0),
              padding: EdgeInsets.only(bottom: 40.0),
              height: 200,
              child: TextField(
                controller: _resumoController,
                maxLines: 10,
                decoration: InputDecoration(
                  hintText: "Descreva um breve resumo da publicação",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              children: <Widget>[
                Text(
                  "File: ",
                  style: TextStyle(
                      fontSize: 15
                  ),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Container(
                  width: 150,
                  child: RaisedButton(
                    onPressed: (){},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Upload",
                          style: TextStyle(
                              fontSize: 14.0
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        _filePath == null ? Icon(Icons.file_upload, size: 30,) : Icon(Icons.check, size: 30, color: Colors.green,),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  "Extensões: .Pdf",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0.0, 50.0, 0, 0),
              width: 358,
              height: 50,
              child: FloatingActionButton(
                backgroundColor: Colors.lightBlue,
                child: Text("Salvar",
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold
                  ),),
                shape: RoundedRectangleBorder(),
                onPressed: () {

                },
                tooltip: "Salvar",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
