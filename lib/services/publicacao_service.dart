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

    List<PublicacaoModel> listaDePublicacoes = new List<PublicacaoModel>();

    return listaDePublicacoes;
  }
}