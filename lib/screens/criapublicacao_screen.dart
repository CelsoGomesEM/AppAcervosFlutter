import 'package:flutter/material.dart';

class CriaPublicacao extends StatefulWidget {
  @override
  _CriaPublicacaoState createState() => _CriaPublicacaoState();
}

class _CriaPublicacaoState extends State<CriaPublicacao> {

  final _formKey = GlobalKey<FormState>();

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
                      onPressed: (){

                      },
                      child: Text("Upload"),
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    "Tipos arquivos: PDF",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              )
            ],
          ),
      ),
      floatingActionButton: Container(
        width: 358,
        height: 50,
        child: FloatingActionButton(
            backgroundColor: Colors.lightBlue,
            child: Text("Salvar",
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold
            ),),
            shape: RoundedRectangleBorder(),
            onPressed: (){

            },
            tooltip: "Salvar",

            ),

      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
