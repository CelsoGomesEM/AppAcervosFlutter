import 'package:flutter/material.dart';
import 'package:pocflutterapp/models/sessao_usuario_model.dart';
import 'package:pocflutterapp/screens/login_screen.dart';
import 'package:pocflutterapp/widgets/menus_drawer.dart';
import 'package:scoped_model/scoped_model.dart';

class DrawerCustomizado extends StatelessWidget {

  final PageController _pageController;
  DrawerCustomizado(this._pageController);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Stack(
        children: <Widget>[
          _construaPlanoDeFundo(),
          ListView(
            padding: EdgeInsets.only(left: 25.0, top: 35.0),
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 8.0),
                padding: EdgeInsets.fromLTRB(0.0, 16.0, 16.0, 8.0),
                height: 170.0,
                //color: Colors.yellow,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      top: 5.0,
                      left: 0.0,
                      child: Text("Acervos\nAcadêmicos",style: TextStyle(
                        fontSize: 34.0, fontWeight: FontWeight.bold
                      ),),
                    ),
                    Positioned(
                      left: 0.0,
                      bottom: 0.0,
                      child: ScopedModelDescendant<SessaoUsuarioModel>(
                          builder: (context, child, model){
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text("Olá, ${model.estaLogado() ? model.discenteLogado.nome : ''}", style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold
                                ),),
                                GestureDetector(
                                  child: Text("Logout > ", style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white
                                  ),),
                                  onTap: (){
                                    model.deslogar();
                                    Navigator.of(context).push(MaterialPageRoute(
                                        builder: (context) => LoginScreen())
                                    );
                                  },
                                )
                              ],
                            );
                          }
                      )
                    )
                  ],
                ),
              ),
              Divider(),
              MenuDrawer(Icons.home, "Principal", _pageController, 0),
              MenuDrawer(Icons.list, "Publicações", _pageController, 1),
              MenuDrawer(Icons.list, "Minhas Publicações",_pageController, 2),
            ],
          )
        ],
      ),
    );
  }
}


Widget _construaPlanoDeFundo() => Container(
  decoration: BoxDecoration(
      gradient: LinearGradient(colors: [
        Colors.teal,
        Colors.white
      ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter
      )
  ),
);