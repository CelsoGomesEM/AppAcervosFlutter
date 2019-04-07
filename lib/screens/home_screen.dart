import 'package:flutter/material.dart';
import 'package:pocflutterapp/screens/minhaspublicacoes_screen.dart';
import 'package:pocflutterapp/screens/pagina_principal.dart';
import 'package:pocflutterapp/screens/publicacoes_screen.dart';
import 'package:pocflutterapp/widgets/drawer_customizado.dart';

class HomeScreen extends StatelessWidget {

  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blueGrey,
            title: Text("Principal"),
            centerTitle: true,
          ),
          drawer: DrawerCustomizado(_pageController),
        ),
        Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blueGrey,
            title: Text("Publicações"),
            centerTitle: true,
          ),
          drawer: DrawerCustomizado(_pageController),
          body: PublicacoesScreen(),
        ),
        Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blueGrey,
            title: Text("Minhas Publicações"),
            centerTitle: true,
          ),
          drawer: DrawerCustomizado(_pageController),
          body: MinhasPublicacoes(),
        )
        //Container(color: Colors.red,),
        //Container(color: Colors.yellow),
      ],
    );
  }
}

