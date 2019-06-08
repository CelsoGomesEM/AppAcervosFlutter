import 'package:flutter/cupertino.dart';
import 'package:pocflutterapp/dominio/publicacao.dart';
import 'package:pocflutterapp/models/sessao_usuario_model.dart';
import 'package:pocflutterapp/services/publicacao_service.dart';
import 'package:scoped_model/scoped_model.dart';

class MinhasPublicacoesModel extends Model{

  SessaoUsuarioModel usuarioLogado;
  List<Publicacao> publicacoesDoUsuario = [];

  MinhasPublicacoesModel(this.usuarioLogado){
    if(usuarioLogado.estaLogado()){
      carregueTodasPublicacoesDoUsuario();
    }
  }

  static MinhasPublicacoesModel of(BuildContext context) =>
      ScopedModel.of<MinhasPublicacoesModel>(context);

  void adicioneNovaPublicacao(Publicacao publicacao) async{

    var servicoPublicacao = new PublicacaoService();

    try{

      var resultado = await servicoPublicacao.registrePublicacao(publicacao);
      publicacao.id = resultado;
      publicacoesDoUsuario.add(publicacao);
      notifyListeners();

    }catch(erro){
      //Fazer Algo em caso de erro

    }
  }

  void removaPublicacao(Publicacao publicacao) async {

    var servicoPublicacao = new PublicacaoService();

    try{

     await servicoPublicacao.deletePublicacao(publicacao);
     publicacoesDoUsuario.remove(publicacao);
     notifyListeners();

    }catch(erro){
      //Fazer Algo em caso de erro
    }
  }

  void carregueTodasPublicacoesDoUsuario() async{

    var servicoDePublicacao = PublicacaoService();
    publicacoesDoUsuario = await servicoDePublicacao.obtenhaPublicacoesDoUsuario(usuarioLogado.discenteLogado.id);
    notifyListeners();
  }
}