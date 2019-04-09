import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pocflutterapp/models/discente_model.dart';
import 'package:scoped_model/scoped_model.dart';

class SessaoUsuarioModel extends Model{

  bool estaCarregando = false;
  DiscenteModel discenteLogado;


  void registrarUsuario(String email, String senha, VoidCallback onSucess, VoidCallback onFail) async{

    estaCarregando =  true;
    notifyListeners();

    await Future.delayed(Duration(seconds: 5));

    this.discenteLogado = DiscenteModel(nome: "Celso Gomes", email: email, senha: senha);
    onSucess();

    estaCarregando = false;
    notifyListeners();

  }


  void realizarLogin(String email, String senha, VoidCallback onSucess, VoidCallback onFail) async{

    estaCarregando =  true;
    notifyListeners();

    await Future.delayed(Duration(seconds: 5));

    this.discenteLogado = DiscenteModel(nome: "Celso Gomes", email: email, senha: senha);
    onSucess();

    estaCarregando = false;
    notifyListeners();

  }

  bool estaLogado(){
    return discenteLogado != null;
  }

  void deslogar() async{
    discenteLogado = null;
    notifyListeners();
  }
}