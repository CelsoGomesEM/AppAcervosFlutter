import 'package:meta/meta.dart';

class PublicacaoModel {

  final int id;
  final String titulo;
  final String subtitulo;

  PublicacaoModel({@required this.id, @required this.titulo, @required this.subtitulo});

  @override
  String toString() {
    // TODO: implement toString
    return "${this.titulo.toUpperCase()}";
  }

  @override
  // TODO: implement hashCode
  int get hashCode => super.hashCode;

}