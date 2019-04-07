import 'package:flutter/material.dart';
import 'package:pocflutterapp/models/sessao_usuario_model.dart';
import 'package:pocflutterapp/screens/criaconta_screen.dart';
import 'package:scoped_model/scoped_model.dart';

class LoginScreen extends StatelessWidget {

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: ScopedModelDescendant<SessaoUsuarioModel>(
          builder: (context, child, model){
            if(model.estaCarregando)
              return Center(
                child: CircularProgressIndicator(

                ),
              );

            return Container(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Flexible(
                    child: FlutterLogo(
                      size: 250,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 20),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                            autofocus: false,
                            keyboardType: TextInputType.emailAddress,
                            maxLength: 50,
                            validator: (text) {
                              if (text.isEmpty) return "E-mail inválido!";
                              return null;
                            },
                            decoration: InputDecoration(
                              counterText: '',
                              hintText: "Informe o e-mail",
                              helperText: "Sem espaços",
                              prefixIcon: Icon(Icons.email),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(0)),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(3),
                          ),
                          TextFormField(
                            obscureText: true,
                            maxLength: 10,
                            validator: (text){
                              if(text.isEmpty){
                                return "Senha inválida!";
                              }
                            },
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                counterText: '',
                                hintText: "Informe a Senha",
                                helperText: "Sem espaços",
                                prefixIcon: Icon(Icons.lock_outline),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(0))),
                          ),
                          Padding(
                            padding: EdgeInsets.all(4),
                          ),
                          Container(
                            width: double.infinity,
                            height: 45,
                            child: RaisedButton(
                              color: Theme.of(context).primaryColor,
                              colorBrightness:
                              Theme.of(context).primaryColorBrightness,
                              child: Text("Entrar"),
                              onPressed: () {
                                if(_formKey.currentState.validate()){

                                }
                                model.RealizarLogin();
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(4),
                          ),
                          SizedBox(
                            width: double.infinity,
                            height: 45,
                            child:
                            RaisedButton(
                              color: Theme.of(context).primaryColor,
                              colorBrightness:
                              Theme.of(context).primaryColorBrightness,
                              child: Text("Cadastre-se aqui"),
                              onPressed: () {
                                Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (context) => CriaContaScreen()
                                    )
                                );
                              },
                            ),
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                FlatButton(
                                  child: Text("Esqueci minha senha", style: TextStyle(
                                      decoration: TextDecoration.underline
                                  ),
                                  ),
                                  padding: EdgeInsets.zero,
                                  onPressed: (){

                                  },
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        )
      ),
    );
  }
}