import 'package:flutter/material.dart';
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
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  TextFormField(
                    controller: _senhaController,
                    decoration: InputDecoration(
                      hintText: 'Senha'
                    ),
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

                        var email = _emailController.text;
                        var senha = _senhaController.text;

                        model.registrarUsuario(email, senha, _onSucess, _onFail);
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
    Future.delayed(Duration(seconds: 5)).then((_){
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
