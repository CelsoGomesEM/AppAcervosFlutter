import 'dart:io';
import 'package:open_file/open_file.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pocflutterapp/dominio/publicacao.dart';
import 'package:permission_handler/permission_handler.dart';

class DetalhesPublicacaoRepo extends StatefulWidget {

  final Publicacao publicacao;

  DetalhesPublicacaoRepo(this.publicacao);

  @override
  _DetalhesPublicacaoRepoState createState() => _DetalhesPublicacaoRepoState(publicacao);
}

class _DetalhesPublicacaoRepoState extends State<DetalhesPublicacaoRepo> {

  final Publicacao publicacao;

  _DetalhesPublicacaoRepoState(this.publicacao);

  Future<Directory> crieLocalArmazenamentoPublicacoes() async {
    var existeDiretorioCriado = await existeDiretorioTemporarioDePublicacoes();

    if(!existeDiretorioCriado){
      return crieDiretorioTemporario();
    }
  }

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
                    "${publicacao.titulo}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    _monteSubtituloEPalavrasChave(publicacao),
                    style: TextStyle(
                      fontSize: 17
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        "Por:",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18
                        ),
                      ),
                      SizedBox(
                        width: 7.0,
                      ),
                      Text(
                        "${publicacao.autores}",
                        style: TextStyle(
                          fontSize: 17
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Resumo Completo",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "${publicacao.resumo}",
                    style: TextStyle(
                      fontSize: 17,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        ""
                      ),
                      RaisedButton(
                        child: Text(
                          "Download"
                        ),
                        onPressed: publicacao.documento == null ? null : _obtenhaPdfDaPublicacao,
                      )
                    ],
                  ),
                  Divider(height: 20,
                  color: Colors.black,
                  ),
                  Text(
                    "Comentários:",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold
                    ),
                  )
                ],
              ),
            ),
          )
      ),
    );
  }

  Future<Function> _obtenhaPdfDaPublicacao() async{

    Map<PermissionGroup, PermissionStatus> permissions = await PermissionHandler().requestPermissions([PermissionGroup.storage]);

    if(permissions.containsKey(PermissionGroup.storage) && permissions.containsValue(PermissionStatus.granted)){
      var diretorio = await crieLocalArmazenamentoPublicacoes();
      File file = await new File('${diretorio.path}/${publicacao.titulo}.pdf').create();
      file.writeAsBytes(publicacao.documento);

      var resultado = await _ExibaDialogoDeConfirmacao(context);

      if(resultado == true){
        OpenFile.open(file.path);
      }
    }
  }

  Future _ExibaDialogoDeConfirmacao(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Confirmação"),
          content: Text(
            "Deseja abrir documento?",
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

  String _monteSubtituloEPalavrasChave(Publicacao publicacao){
      return "${publicacao.subtitulo}, Palavras Chave [${publicacao.palavrachave}]";
  }
}

