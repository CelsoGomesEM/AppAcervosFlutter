import 'package:meta/meta.dart';

class Discente {

  final int id;
  final String nome;
  final String email;

  Discente({@required this.id, @required this.nome, @required this.email});

  @override
  String toString() {
    // TODO: implement toString
    return super.toString();
  }

  @override
  // TODO: implement hashCode
  int get hashCode => super.hashCode;

}
