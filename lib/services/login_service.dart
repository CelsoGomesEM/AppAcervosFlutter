import 'dart:convert';
import 'package:pocflutterapp/models/discente_model.dart';
import 'package:pocflutterapp/services/api_service.dart';


class LoginService {
  Future<String> registreUsuario(Map<String, dynamic> usuarioDados) async {

    var api = ApiService();

    var result = await api.post("https://repositorioapi.herokuapp.com/api/login/registrarusuario",
        json.encode(
            { 'nome': usuarioDados["nome"],
              'email': usuarioDados["email"],
              'senha': usuarioDados["senha"]
            })
    );

    var map = json.decode(result);

    if (map["codigo"] == 0) {
      return map["token"];
    }

    throw Exception(map['Mensagem']);
  }

  Future<DiscenteModel> realizeLogin(Map<String, dynamic> usuarioDados) async {

    var api = ApiService();

    var result = await api.post("https://repositorioapi.herokuapp.com/api/login/realizelogin",
        json.encode(
            {
              'email': usuarioDados["email"],
              'senha': usuarioDados["senha"]
            })
    );

    var map = json.decode(result);

    if (map['codigo'] == 0) {
      return DiscenteModel(
        id: map['result']['id'] as int,
        nome: map['result']['nome'] as String,
        email: map['result']['email'] as String
      );
    }

    throw Exception(map['Mensagem']);
  }
}