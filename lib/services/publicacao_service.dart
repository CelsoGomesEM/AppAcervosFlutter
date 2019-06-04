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

  Future<bool> registrePublicacao(Publicacao publicacao) async{

    bool registrou;

    try{

      var body = MapeieJsonPublicacao(publicacao);
      var api = ApiService();
      await api.post("http://192.168.1.8/RepositorioAcervosAPI/api/publicacao/registrarpublicacao", body);

      registrou = true;
    }catch(erro){
        registrou = false;
    }

    return registrou;
  }

  String MapeieJsonPublicacao(Publicacao publicacao){
    return json.encode(publicacao);
  }

  /*String mapeieDadosPublicacao(Map<String, dynamic> dadosPublicacao){

    var publicacao = new Publicacao();
    publicacao.titulo = dadosPublicacao['titulo'];
    publicacao.subtitulo = dadosPublicacao['subtitulo'];
    publicacao.palavrachave = dadosPublicacao['palavrachave'];
    publicacao.autores = dadosPublicacao['autores'];
    publicacao.resumo = dadosPublicacao['resumo'];
    publicacao.documento = dadosPublicacao['documento'];
    publicacao.discenteid = dadosPublicacao['discenteid'];
    return json.encode(publicacao);
  }*/

}