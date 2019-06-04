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
    var result = await api.get("https://repositorioapi.herokuapp.com/api/publicacao/obtenhapublicacoespeloid?idUsuario=${idUsuario}");
    var map = json.decode(result);
    var resultado = ResultadoDoGet.fromJson(map);
    return resultado.results;
  }

  void registrePublicacao(Publicacao publicacao) async{

    try{
      var body = MapeieJsonPublicacao(publicacao);
      var api = ApiService();
      await api.post("https://repositorioapi.herokuapp.com/api/publicacao/registrarpublicacao", body);

    }catch(erro){

    }
  }

  String MapeieJsonPublicacao(Publicacao publicacao){
    return json.encode(publicacao);
  }

}