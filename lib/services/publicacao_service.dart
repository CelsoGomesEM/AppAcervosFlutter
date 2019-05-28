import 'dart:convert';
import 'package:pocflutterapp/models/publicacao_model.dart';
import 'package:pocflutterapp/services/api_service.dart';


class PublicacaoService {
  Future<List<PublicacaoModel>> obtenhaTodasPublicacoesDoRepositorio() async {

    var api = new ApiService();

    List<PublicacaoModel> listaDePublicacoes = new List<PublicacaoModel>();

    return listaDePublicacoes;
  }

  Future<List<PublicacaoModel>> obtenhaPublicacoesDoUsuario(int idUsuario) async {

    var api = new ApiService();
    var result = await api.get("https://repositorioapi.herokuapp.com/api/publicacao/obtenhapublicacoespeloid?idUsuario=${idUsuario}");
    var map = json.decode(result);
    var resultado = ResultadoDoGet.fromJson(map);
    return resultado.results;
  }

  Future<void> registrePublicacao(PublicacaoModel publicacao) async {

    var api = ApiService();

    var result = await api.post("https://repositorioapi.herokuapp.com/api/publicacao/registrarpublicacao", publicacao.toJson());

    /*var map = json.decode(result);

    if (map['codigo'] == 0) {
      return DiscenteModel(
          id: map['result']['id'] as int,
          nome: map['result']['nome'] as String,
          email: map['result']['email'] as String
      );
    }

    throw Exception(map['Mensagem']);*/
  }
}