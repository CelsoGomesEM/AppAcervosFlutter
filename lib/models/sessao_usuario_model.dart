import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pocflutterapp/models/discente_model.dart';
import 'package:pocflutterapp/services/login_service.dart';
import 'package:scoped_model/scoped_model.dart';

class SessaoUsuarioModel extends Model{

  bool estaCarregando = false;
  DiscenteModel discenteLogado;
  String tokenDiscenteLogado;


  void registrarUsuario(DiscenteModel discente, VoidCallback onSucess, VoidCallback onFail) async{

    estaCarregando =  true;
    notifyListeners();

    try{

      var token = await LoginService().registreUsuario(discente);
      onSucess();
      estaCarregando = false;
      notifyListeners();

    }catch(erro){
        Future.delayed(Duration(seconds: 5)).then((_){
          onFail();
          estaCarregando = false;
          notifyListeners();
        });
    }
  }

  void realizarLogin(DiscenteModel discente, VoidCallback onSucess, VoidCallback onFail) async{

    estaCarregando =  true;
    notifyListeners();

    try{

      var token = await LoginService().realizeLogin(discente);
      tokenDiscenteLogado = token;
      discenteLogado = discente;
      onSucess();
      estaCarregando = false;
      notifyListeners();

    }catch(erro){
      Future.delayed(Duration(seconds: 5)).then((_){
        onFail();
        estaCarregando = false;
        notifyListeners();
      });
    }
  }

  bool estaLogado(){
    return discenteLogado != null;
  }

  void deslogar() async{
    discenteLogado = null;
    notifyListeners();
  }
}