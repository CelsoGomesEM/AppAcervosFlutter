import 'package:pocflutterapp/dominio/publicacao.dart';
import 'package:pocflutterapp/services/publicacao_service.dart';
import 'package:scoped_model/scoped_model.dart';
import 'dart:async';
import 'package:flutter/material.dart';

class PublicacaoModel extends Model{

  bool estaEditando = false;
  Publicacao publicacaoContexto;
  Map<String, dynamic> dadosPublicacao;

  void registrarPublicacao(Map<String, dynamic> dadosPublicacao, VoidCallback onSucess, VoidCallback onFail) async{

    notifyListeners();

    var publicacao = new Publicacao(id: null, titulo: null, subtitulo: null);

    try{

      var retorno = await PublicacaoService().registrePublicacao(publicacao);
      onSucess();
      notifyListeners();

    }catch(erro){
      Future.delayed(Duration(seconds: 5)).then((_){
        onFail();
        notifyListeners();
      });
    }
  }
}