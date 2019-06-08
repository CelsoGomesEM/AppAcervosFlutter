import 'dart:typed_data';

import 'package:meta/meta.dart';
import 'dart:convert' as convert;

class ResultadoDoGet {
  List<Publicacao> results;
  int codigo;
  String mensagem;

  ResultadoDoGet({this.results, this.codigo, this.mensagem});

  ResultadoDoGet.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      results = new List<Publicacao>();
      json['result'].forEach((v) {
        results.add(new Publicacao.fromJson(v));
      });
    }
    codigo = json['codigo'];
    mensagem = json['mensagem'];
  }
}

class Publicacao {

  int id;
  String titulo;
  String subtitulo;
  String resumo;
  String autores;
  String palavrachave;
  Uint8List documento;
  int discenteid;


  Publicacao({@required this.id, @required this.titulo, @required this.subtitulo});

  Publicacao.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    titulo = json['titulo'];
    subtitulo = json['subtitulo'];
    palavrachave = json['palavrachave'];
    resumo = json['resumo'];
    autores = json['autores'];
    discenteid = json['discenteid'];
    var documentoPdf = convert.base64Decode(json['documento']);
    documento = json['documento'] == null ? null : documentoPdf;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['titulo'] = this.titulo;
    data['subtitulo'] = this.subtitulo;
    data['resumo'] = this.resumo;
    data['autores'] = this.autores;
    data['documento'] = this.documento;
    data['palavrachave'] = this.palavrachave;
    data['discenteid'] = this.discenteid;
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