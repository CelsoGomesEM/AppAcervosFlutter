import 'package:flutter/material.dart';
import 'package:pocflutterapp/screens/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Acervos",
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.yellow
      ),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}


