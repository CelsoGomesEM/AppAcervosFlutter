import 'dart:convert';
import 'package:pocflutterapp/dominio/publicacao.dart';
import 'package:pocflutterapp/services/api_service.dart';
import 'dart:async';

class PublicacaoService {

  Future<List<Publicacao>> obtenhaTodasPublicacoesDoRepositorio() async {

    var api = new ApiService();
    var result = await api.get("https://repositorioapi.herokuapp.com/api/publicacao/obtenhatodaspublicacoesrepositorio");
    var map = json.decode(result);
    var resultado = ResultadoDoGet.fromJson(map);
    return resultado.results;
  }

  Future<List<Publicacao>> obtenhaPublicacoesDoUsuario(int idUsuario) async {

    var api = new ApiService();
    var result = await api.get("https://repositorioapi.herokuapp.com/api/publicacao/obtenhapublicacoespeloid?idUsuario=${idUsuario}");
    var map = json.decode(result);
    var resultado = ResultadoDoGet.fromJson(map);
    return resultado.results;
  }

  Future<int> registrePublicacao(Publicacao publicacao) async{

    var body = MapeieJsonPublicacao(publicacao);
    var api = ApiService();
    var response = await api.post("https://repositorioapi.herokuapp.com/api/publicacao/registrarpublicacao", body);
    var map = json.decode(response);
    return map['result']['id'];
  }

  void deletePublicacao(Publicacao publicacao) async{

    var body = MapeieJsonPublicacao(publicacao);
    var api = ApiService();
    await api.post("https://repositorioapi.herokuapp.com/api/publicacao/deletepublicacaopeloid", body);
  }

  String MapeieJsonPublicacao(Publicacao publicacao){
    return json.encode(publicacao);
  }

}