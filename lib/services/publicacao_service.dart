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

  void registrePublicacao(Map<String, dynamic> dadosPublicacao, VoidCallback onSucess, VoidCallback onFail) async{

    try{

      var body = mapeieDadosPublicacao(dadosPublicacao);
      var api = ApiService();
      await api.post("https://repositorioapi.herokuapp.com/api/publicacao/registrarpublicacao", body);

      onSucess();
    }catch(erro){
      Future.delayed(Duration(seconds: 5)).then((_){
        onFail();
      });
    }
  }

  String mapeieDadosPublicacao(Map<String, dynamic> dadosPublicacao){

    var publicacao = new Publicacao();
    publicacao.titulo = dadosPublicacao['titulo'];
    publicacao.subtitulo = dadosPublicacao['subtitulo'];
    publicacao.palavrachave = dadosPublicacao['palavrachave'];
    publicacao.autores = dadosPublicacao['autores'];
    publicacao.resumo = dadosPublicacao['resumo'];
    publicacao.documento = dadosPublicacao['documento'];
    publicacao.discenteid = dadosPublicacao['discenteid'];
    return json.encode(publicacao);
  }

}