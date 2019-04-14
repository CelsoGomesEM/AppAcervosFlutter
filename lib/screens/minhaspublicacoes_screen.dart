import 'package:flutter/material.dart';
import 'package:pocflutterapp/screens/criapublicacao_screen.dart';

class MinhasPublicacoes extends StatefulWidget {
  @override
  _MinhasPublicacoesState createState() => _MinhasPublicacoesState();
}

class _MinhasPublicacoesState extends State<MinhasPublicacoes> {

  final _scafoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scafoldKey,
      body: ListView(

      ),
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) => CriaPublicacao()
                )
            );
          },
          tooltip: "Adicione",
          child: Icon(Icons.add),
          ),

    );
  }
}

