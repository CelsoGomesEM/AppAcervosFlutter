import 'package:meta/meta.dart';

class DiscenteModel {

  final int id;
  final String nome;
  final String email;

  DiscenteModel({@required this.id, @required this.nome, @required this.email});

  @override
  String toString() {
    // TODO: implement toString
    return super.toString();
  }

  @override
  // TODO: implement hashCode
  int get hashCode => super.hashCode;

}
