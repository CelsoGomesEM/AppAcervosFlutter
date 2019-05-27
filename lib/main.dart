import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pocflutterapp/models/sessao_usuario_model.dart';
import 'package:pocflutterapp/screens/login_screen.dart';
import 'package:pocflutterapp/widgets/item_publicacao.dart';
import 'package:scoped_model/scoped_model.dart';

void main() {
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp,DeviceOrientation.portraitDown])
      .then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel<SessaoUsuarioModel>(
      //Tudo que estiver no escopo do model ter acesso ao model para realizar atualizações no app
      model: SessaoUsuarioModel(),
      child: MaterialApp(
      title: "Flutter Acervos",
      theme: ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: Colors.blueGrey
      ),
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
      ),
    );
  }
}


