import 'dart:typed_data';

import 'package:meta/meta.dart';
import 'dart:convert' as convert;

class ResultadoDoGet {

  List<PublicacaoModel> results;
  int codigo;
  String mensagem;

  ResultadoDoGet({this.results, this.codigo, this.mensagem});

  ResultadoDoGet.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      results = new List<PublicacaoModel>();
      json['result'].forEach((v) {
        results.add(new PublicacaoModel.fromJson(v));
      });
    }
    codigo = json['codigo'];
    mensagem = json['mensagem'];
  }
}

class PublicacaoModel {

  int id;
  String titulo;
  String subtitulo;
  String resumo;
  String autores;
  Uint8List documento;

  PublicacaoModel({@required this.id, @required this.titulo, @required this.subtitulo});

  PublicacaoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    titulo = json['titulo'];
    subtitulo = json['subtitulo'];
    resumo = json['resumo'];
    autores = json['autores'];
    //documento = json['documento'].cast<int>().toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['titulo'] = this.titulo;
    data['subtitulo'] = this.subtitulo;
    data['resumo'] = this.resumo;
    data['autores'] = this.autores;
    data['documento'] = this.documento;
    return data;
  }


@override
  String toString() {
    // TODO: implement toString
    return "${this.titulo.toUpperCase()}";
  }

  @override
  // TODO: implement hashCode
  int get hashCode => super.hashCode;

}