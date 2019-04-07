import 'dart:async';
import 'package:scoped_model/scoped_model.dart';


//Model objeto que via guardar os estados de alguma coisa vai guardar os estados do login do meu APP e ter todas funções que vao modificar o estado e vai influenciando na tela
class SessaoUsuarioModel extends Model{

  //Usuario Atual

  bool estaCarregando = false;

  //Criar conta do usuario
  void CriarConta(){

  }

  //Login Usuario
  void RealizarLogin() async{

    estaCarregando =  true;
    notifyListeners();

    await Future.delayed(Duration(seconds: 3));

    estaCarregando = false;
    notifyListeners();

  }

  //Recuperar Senha
  void RecuperarSenha(){

  }

  //Verificar se usuário está logado
  void UsuarioEstaLogado(){

  }

}