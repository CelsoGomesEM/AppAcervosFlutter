import 'package:flutter/material.dart';
import 'package:pocflutterapp/models/discente_model.dart';
import 'package:pocflutterapp/models/sessao_usuario_model.dart';
import 'package:pocflutterapp/screens/criaconta_screen.dart';
import 'package:pocflutterapp/screens/home_screen.dart';
import 'package:scoped_model/scoped_model.dart';


class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _scafoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          key: _scafoldKey,
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
                              controller: _emailController,
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
                              controller: _senhaController,
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

                                    var discenteModel = new DiscenteModel(
                                        email: _emailController.text,
                                        senha: _senhaController.text
                                    );

                                    model.realizarLogin(discenteModel, _onSucess, _onFail);

                                  }
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

  void _onSucess(){
    _scafoldKey.currentState.showSnackBar(
        SnackBar(content: Text(
          "Entrando",
        ),
          backgroundColor: Colors.lightBlue,
          duration: Duration(seconds: 5),
        )
    );
    Future.delayed(Duration(seconds: 3)).then((_){
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => HomeScreen()));
    });
  }

  void _onFail(){
    _scafoldKey.currentState.showSnackBar(
        SnackBar(content: Text(
          "Falha no Login",
        ),
          backgroundColor: Colors.redAccent,
          duration: Duration(seconds: 3),
        )
    );
  }
}
