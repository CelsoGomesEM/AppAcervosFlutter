import 'package:flutter/material.dart';
import 'package:pocflutterapp/models/discente_model.dart';
import 'package:pocflutterapp/models/sessao_usuario_model.dart';
import 'package:scoped_model/scoped_model.dart';

class CriaContaScreen extends StatefulWidget {
  @override
  _CriaContaScreenState createState() => _CriaContaScreenState();
}

class _CriaContaScreenState extends State<CriaContaScreen> {

  final _formKey = GlobalKey<FormState>();
  final _scafoldKey = GlobalKey<ScaffoldState>();
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();
  final _nomeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scafoldKey,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text("Criar Conta"),
        centerTitle: true,
      ),
      body: ScopedModelDescendant<SessaoUsuarioModel>(
        builder: (context, child, model){

          if(model.estaCarregando){
            return Center(
              child: CircularProgressIndicator(
              ),
            );
          }
          return Form(
            key: _formKey,
            child: ListView(
                padding: EdgeInsets.all(15.0),
                children: <Widget>[
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      hintText: 'E-mail'
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
                    controller: _senhaController,
                    obscureText: true,
                    maxLength: 8,
                    decoration: InputDecoration(
                      hintText: 'Senha'
                    ),
                    validator: (texto){
                      if(texto.isEmpty)
                        return "Senha inválida!";
                    },
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  TextFormField(
                    controller: _nomeController,
                    maxLength: 24,
                    decoration: InputDecoration(
                      hintText: 'Nome Completo'
                    ),
                    validator: (texto){
                      if(texto.isEmpty)
                        return "Nome inválido!";
                    },
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  RaisedButton(
                    child: Text("Criar",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    onPressed: (){
                      if(_formKey.currentState.validate()){
                        Map<String, dynamic> usuarioDados = {
                          "nome" : _nomeController.text,
                          "senha" : _senhaController.text,
                          "email" : _emailController.text
                        };
                        model.registrarUsuario(usuarioDados, _onSucess, _onFail);
                      }
                    },
                  )
                ],
            ),
          );
        },
      ),
    );
  }

  void _onSucess(){
    _scafoldKey.currentState.showSnackBar(
        SnackBar(content: Text(
          "Usuário criado com sucesso!",
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
          "Falha ao criar usuário!",
        ),
          backgroundColor: Colors.redAccent,
          duration: Duration(seconds: 5),
        )
    );
  }
}
