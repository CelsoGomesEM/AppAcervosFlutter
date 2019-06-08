import 'dart:convert';
import 'dart:ui';
import 'package:pocflutterapp/dominio/publicacao.dart';
import 'package:pocflutterapp/services/api_service.dart';
import 'dart:async';


class PublicacaoService {

  Future<List<Publicacao>> obtenhaTodasPublicacoesDoRepositorio() async {

    var api = new ApiService();

    List<Publicacao> listaDePublicacoes = new List<Publicacao>();

    return listaDePublicacoes;
  }

  Future<List<Publicacao>> obtenhaPublicacoesDoUsuario(int idUsuario) async {

    var api = new ApiService();
    var result = await api.get("http://192.168.1.4/RepositorioAcervosAPI/api/publicacao/obtenhapublicacoespeloid?idUsuario=${idUsuario}");
    var map = json.decode(result);
    var resultado = ResultadoDoGet.fromJson(map);
    return resultado.results;
  }

  Future<int> registrePublicacao(Publicacao publicacao) async{

    var body = MapeieJsonPublicacao(publicacao);
    var api = ApiService();
    var response = await api.post("http://192.168.1.4/RepositorioAcervosAPI/api/publicacao/registrarpublicacao", body);
    var map = json.decode(response);
    return map['result']['id'];
  }

  void deletePublicacao(Publicacao publicacao) async{

    var body = MapeieJsonPublicacao(publicacao);
    var api = ApiService();
    await api.post("http://192.168.1.4/RepositorioAcervosAPI/api/publicacao/deletepublicacaopeloid", body);
  }

  String MapeieJsonPublicacao(Publicacao publicacao){
    return json.encode(publicacao);
  }

}