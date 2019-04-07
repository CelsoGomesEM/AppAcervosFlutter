import 'package:flutter/material.dart';

class CriaContaScreen extends StatelessWidget {

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: Text("Criar Conta"),
          centerTitle: true,
        ),
        body: Form(
          key: _formKey,
          child: ListView(
            padding: EdgeInsets.all(15.0),
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Nome completo"
                ),
                keyboardType: TextInputType.text,
                maxLength: 50,
                validator: (text){
                  if(text.isEmpty){
                    return "Nome inválido!";
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 16.0,
              ),
              TextFormField(
                decoration: InputDecoration(
                    hintText: "E-mail"
                ),
                keyboardType: TextInputType.text,
                maxLength: 50,
                validator: (text){
                  if(text.isEmpty){
                    return "E-mail inválido!";
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 16.0,
              ),
              TextFormField(
                decoration: InputDecoration(
                    hintText: "Senha"
                ),
                obscureText: true,
                keyboardType: TextInputType.text,
                maxLength: 10,
                validator: (text){
                  if(text.isEmpty){
                    return "Senha inválida!";
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 16.0,
              ),
              SizedBox(
                height: 45.0,
                child: RaisedButton(
                    color: Theme.of(context).primaryColor,
                    child: Text("Criar", style:
                      TextStyle(
                        color: Colors.white,
                        fontSize: 18.0
                      ),),
                    onPressed: (){

                    }),
              )
            ],
          ),
        ),

    );
  }
}
