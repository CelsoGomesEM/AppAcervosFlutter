import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

class CriaPublicacao extends StatefulWidget {
  @override
  _CriaPublicacaoState createState() => _CriaPublicacaoState();
}

class _CriaPublicacaoState extends State<CriaPublicacao> {

  final _formKey = GlobalKey<FormState>();

  String _filePath;

  void verifiqueOqueTemDentroDoArquivo() async{

    try{

      File arquivo = new File(_filePath);

      var contents = await arquivo.readAsBytes();

      print(contents);

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
      body: Form(
          key: _formKey,
          child: ListView(
            padding: EdgeInsets.all(15.0),
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                    hintText: 'Título',
                ),
                validator: (texto){
                  if(texto.isEmpty)
                    return "E-mail inválido!";
                },

              ),
              SizedBox(
                height: 16.0,
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Subtítulo',
                ),
                validator: (texto){
                  if(texto.isEmpty)
                    return "E-mail inválido!";
                },

              ),
              SizedBox(
                height: 16.0,
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Palavras-chave',
                ),
                validator: (texto){
                  if(texto.isEmpty)
                    return "E-mail inválido!";
                },

              ),
              SizedBox(
                height: 16.0,
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Autores',
                ),
                validator: (texto){
                  if(texto.isEmpty)
                    return "E-mail inválido!";
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
                  maxLines: 50,
                  decoration: InputDecoration(
                    hintText: "Comente",
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
                margin: EdgeInsets.fromLTRB(0.0, 90.0, 0, 0),
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
                  onPressed: verifiqueOqueTemDentroDoArquivo,
                  tooltip: "Salvar",

                ),

              ),
            ],
          ),
      ),
    );
  }
}
