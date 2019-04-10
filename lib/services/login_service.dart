import 'dart:convert';
import 'package:pocflutterapp/models/discente_model.dart';
import 'package:pocflutterapp/services/api_service.dart';


class LoginService {
  Future<String> registreUsuario(DiscenteModel discente) async {

    var api = ApiService();

    var result = await api.post("https://repositorioapi.herokuapp.com/api/login/registrarusuario",
        json.encode(
            { 'nome': discente.nome,
              'email': discente.email,
              'senha': discente.senha
            })
    );

    var map = json.decode(result);

    if (map["codigo"] == 0) {
      return map["token"];
    }

    throw Exception(map['Mensagem']);
  }

  Future<String> realizeLogin(DiscenteModel discente) async {

    var api = ApiService();

    var result = await api.post("https://repositorioapi.herokuapp.com/api/login/realizelogin",
        json.encode(
            {
              'email': discente.email,
              'senha': discente.senha
            })
    );

    var map = json.decode(result);

    if (map["codigo"] == 0) {
      return map["token"];
    }

    throw Exception(map['Mensagem']);
  }
}