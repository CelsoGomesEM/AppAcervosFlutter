import 'package:flutter/material.dart';

class PaginaPrincipal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  return Stack(
    children: <Widget>[
      _construaPlanoDeFundo(),
      CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            floating: true,
            snap: true,
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text("Principal", style: TextStyle(
                color: Colors.black
              ),),
              centerTitle: true,
            ),
          )
        ],
      )
    ],
  );
  }
}

Widget _construaPlanoDeFundo() => Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(colors: [
        Colors.teal,
        Colors.white
      ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight
      )
    ),
);