import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
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
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        autofocus: false,
                        validator: (texto) {
                          if (texto.isEmpty) return "Informe o CPF";
                          return null;
                        },
                        keyboardType: TextInputType.number,
                        maxLength: 11,
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
                          onPressed: () {

                          },
                          color: Theme.of(context).primaryColor,
                          colorBrightness:
                          Theme.of(context).primaryColorBrightness,
                          child: Text("Entrar"),
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
                            onPressed: () {

                            },
                            color: Theme.of(context).primaryColor,
                            colorBrightness:
                            Theme.of(context).primaryColorBrightness,
                            child: Text("Esqueci minha senha"),
                          ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text("Cadastre-se aqui", style: TextStyle(
                              decoration: TextDecoration.underline
                            ),)
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}