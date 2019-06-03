import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pocflutterapp/dominio/discente.dart';
import 'package:pocflutterapp/services/publicacao_service.dart';
import 'package:meta/meta.dart';

class CriaPublicacao extends StatefulWidget {

  Discente DiscenteLogado;

  CriaPublicacao(Discente discenteLogado){
   this.DiscenteLogado = discenteLogado;
  }

  @override
  _CriaPublicacaoState createState() => _CriaPublicacaoState(DiscenteLogado);
}

class _CriaPublicacaoState extends State<CriaPublicacao> {

  Discente DiscenteLogado;

  _CriaPublicacaoState(Discente discenteLogado){
    this.DiscenteLogado = discenteLogado;
  }

  final _formKey = GlobalKey<FormState>();
  final _scafoldKey = GlobalKey<ScaffoldState>();
  final _tituloController = TextEditingController();
  final _subtituloController = TextEditingController();
  final _palavrasChaveController = TextEditingController();
  final _autoresController = TextEditingController();
  final _resumoController = TextEditingController();
  String _filePath;

  Future<bool> existeDiretorioTemporarioDePublicacoes() async {

    bool existeDiretorioCriado = false;

    var localTemporario = await getExternalStorageDirectory();
    final localTemporarioAcervos = '${localTemporario.path}/PublicacoesDaily';
    var diretorioAcervos = new Directory(localTemporarioAcervos);

    diretorioAcervos.exists().then((existe){
      existe ? existeDiretorioCriado = true : existe;
    });

    return existeDiretorioCriado;
  }

  Future<Directory> crieDiretorioTemporario() async {
    var localDeArmazenamentoTemporario = await getExternalStorageDirectory();
    final local = '${localDeArmazenamentoTemporario.path}/PublicacoesDaily' ;
    final diretorioCriado = await new Directory(local).create();
    return diretorioCriado;
  }

  Future<Directory> crieLocalArmazenamentoPublicacoes() async {
      var existeDiretorioCriado = await existeDiretorioTemporarioDePublicacoes();

      if(!existeDiretorioCriado){
        var diretorio = crieDiretorioTemporario();
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
                        if(_formKey.currentState.validate()){
                          Map<String, dynamic> dadosDaPublicacao = {
                            "titulo" : _tituloController.text,
                            "subtitulo" : _subtituloController.text,
                            "palavrachave": _palavrasChaveController.text,
                            "autores": _autoresController.text,
                            "resumo" : _resumoController.text,
                            "documento": obtenhaBytesDoArquivoPdfSelecionado(),
                            "discenteid": DiscenteLogado.id,
                          };
                          PublicacaoService().registrePublicacao(dadosDaPublicacao, _onSucess,  _onFail);
                        }
                        if(resultadoDialog){
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

  _ExibaDialogoNaoFoiPossivelCriarRepositorioTemporario(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(
            "Não foi Possível criar repositório temporário, tente novamente!",
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

  //Verificar se vai ser obrigatório o cara selecionar um arquivo pdf
  Future<List<int>> obtenhaBytesDoArquivoPdfSelecionado()async {

    File arquivo = new File(_filePath);

    var arquivoEmBytes = await arquivo.readAsBytes();

    return arquivoEmBytes;
  }

  void _onSucess(){
    _scafoldKey.currentState.showSnackBar(
        SnackBar(content: Text(
          "Publicacao criada com sucesso!",
        ),
          backgroundColor: Colors.lightBlue,
          duration: Duration(seconds: 5),
        )
    );
    Future.delayed(Duration(seconds: 3)).then((_){
      Navigator.of(context).pop();
    });
  }

  void _onFail(){
    _scafoldKey.currentState.showSnackBar(
        SnackBar(content: Text(
          "Falha ao criar publicação!",
        ),
          backgroundColor: Colors.redAccent,
          duration: Duration(seconds: 5),
        )
    );
  }
}
