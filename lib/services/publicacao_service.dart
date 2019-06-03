import 'dart:convert';
import 'package:pocflutterapp/dominio/publicacao.dart';
import 'package:pocflutterapp/services/api_service.dart';

class PublicacaoService {

  Future<List<Publicacao>> obtenhaTodasPublicacoesDoRepositorio() async {

    var api = new ApiService();

    List<Publicacao> listaDePublicacoes = new List<Publicacao>();

    return listaDePublicacoes;
  }

  Future<List<Publicacao>> obtenhaPublicacoesDoUsuario(int idUsuario) async {

    var api = new ApiService();
    var result = await api.get("https://repositorioapi.herokuapp.com/api/publicacao/obtenhapublicacoespeloid?idUsuario=${idUsuario}");
    var map = json.decode(result);
    var resultado = ResultadoDoGet.fromJson(map);
    return resultado.results;
  }

  Future<void> registrePublicacao(Publicacao publicacao) async {

    var api = ApiService();

    var result = await api.post("https://repositorioapi.herokuapp.com/api/publicacao/registrarpublicacao", publicacao.toJson());

  }


}