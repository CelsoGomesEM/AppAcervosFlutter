import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pocflutterapp/dominio/discente.dart';
import 'package:pocflutterapp/services/login_service.dart';
import 'package:scoped_model/scoped_model.dart';

class SessaoUsuarioModel extends Model{

  bool estaCarregando = false;
  Discente discenteLogado;
  Map<String, dynamic> usuarioDados;

  void registrarUsuario(Map<String, dynamic> usuarioDados, VoidCallback onSucess, VoidCallback onFail) async{

    estaCarregando =  true;
    notifyListeners();

    try{

      var retorno = await LoginService().registreUsuario(usuarioDados);
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

  void realizarLogin(Map<String, dynamic> usuarioDados, VoidCallback onSucess, VoidCallback onFail) async{

    estaCarregando =  true;
    notifyListeners();

    try{

      discenteLogado = await LoginService().realizeLogin(usuarioDados);
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