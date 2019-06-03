import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pocflutterapp/models/publicacao_model.dart';
import 'package:pocflutterapp/services/api_service.dart';
import 'package:pocflutterapp/services/publicacao_service.dart';

class CriaPublicacao extends StatefulWidget {
  @override
  _CriaPublicacaoState createState() => _CriaPublicacaoState();
}

class _CriaPublicacaoState extends State<CriaPublicacao> {

  final _formKey = GlobalKey<FormState>();
  final _scafoldKey = GlobalKey<ScaffoldState>();
  final _tituloController = TextEditingController();
  final _subtituloController = TextEditingController();
  final _palavrasChaveController = TextEditingController();
  final _resumoController = TextEditingController();
  String _filePath;

  void verifiqueOqueTemDentroDoArquivo() async{

    try{

      /*File arquivo = new File(_filePath);
      var contents = await arquivo.readAsBytes();
      var localTemporario = await getExternalStorageDirectory();
      final myImagePath = '${localTemporario.path}/AcervosPublicacoes' ;
      final myImgDir = await new Directory(myImagePath).create();
      File file = await new File('${myImgDir.path}/documentoTeste.pdf').create();
      file.writeAsBytes(contents);
      var listOfFiles = await myImgDir.list(recursive: true).toList();

      print(contents);*/

      /*File arquivo = new File(_filePath);

      var arquivoEmBytes = await arquivo.readAsBytes();

      var publicacao =  new PublicacaoModel();
      publicacao.titulo = "Calendario 2018 Fitness";
      publicacao.subtitulo = "Fitness";
      publicacao.resumo = "Calendario 2018 Atividades Físicas";
      publicacao.autores = "Luana Silva";
      publicacao.documento = arquivoEmBytes;
      publicacao.palavrachave = "Fit";
      publicacao.discenteid = 23;

      var body = json.encode(publicacao);

      var teste = await ApiService().post("http://192.168.1.7/RepositorioAcervosAPI/api/publicacao/registrarpublicacao", body);

      var teste2 = "";*/

      print("Cheguei Aqui");

    }on PlatformException catch(e){
      print("Error while reading file: " + e.toString());
    }
  }

  void getFilePath() async {
    try {
      String filePath = await FilePicker.getFilePath(type: FileType.CUSTOM, fileExtension: 'pdf');

      if (filePath == '') {
        return;
      }

      print("File path: " + filePath);

      setState((){
        this._filePath = filePath;
      });

    } on PlatformException catch (e) {
      print("Error while picking the file: " + e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Publicação"),
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
                maxLines: 10,
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 7, 0, 0),
                padding: EdgeInsets.only(bottom: 40.0),
                height: 200,
                child: TextField(
                  maxLines: 50,
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
                      onPressed: getFilePath,
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
                  onPressed: () async {
                      var resultadoDialog = await _ExibaDialogoDeConfirmacao(context);
                      if(resultadoDialog){
                        realizePublicacao();
                        resultadoDialog = await _ExibaDialogConfirmado(context);
                        if(resultadoDialog){
                          //Limpe campos de input e pronto
                          Navigator.pop(context);
                        }
                      }
                  },
                  tooltip: "Salvar",
                ),
              ),
            ],
          ),
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
            "Deseja salvar publicação?",
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

  _ExibaDialogConfirmado(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(
            "Publicação realizada com sucesso!",
          ),
          actions: [
            FlatButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.pop(context, true);
              },
            ),
          ],
        );
      },
    );
  }

  void realizePublicacao() {

  }
}
