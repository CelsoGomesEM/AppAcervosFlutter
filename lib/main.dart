import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pocflutterapp/models/minhas_publicacoes_model.dart';
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
      model: SessaoUsuarioModel(),
      child: ScopedModelDescendant<SessaoUsuarioModel>(
          builder: (context, child, model){
            return ScopedModel<MinhasPublicacoesModel>(
                model: MinhasPublicacoesModel(model),
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
            ),
    );
  }
}


