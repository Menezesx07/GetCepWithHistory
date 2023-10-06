
import 'package:dio/dio.dart';
import 'package:viacepback4app/model/cep_back4app_model.dart';
import 'package:viacepback4app/model/via_cep_model.dart';

class CepBack4AppRepository {

  var _dio = Dio();

  //criando a base do Rest com o url necessario
  //ao executar qualquer função com o _dio, ele vai cair nessa função
  //e anexar esses itens
  CepBack4AppRepository () {
    _dio = Dio();
    //passando os cabeçarios necessarios do back4app
    _dio.options.headers["X-Parse-Application-Id"] = "m6RFt3k9iFNP7dAuYLyeuJcc74wTc6Pvg9qO2M6K";
    _dio.options.headers["X-Parse-REST-API-Key"] = "KCeEt8RCQMew7vZdq55QyyB4gdbnCA0Ikeol3ihh";
    _dio.options.headers["Content-Type"] = "application/json";
    _dio.options.baseUrl = "https://parseapi.back4app.com/classes/";
  }

  Future<CepBack4AppModel> getAllCep() async {

    // contra barra para não da erro por conta das "" do check conflitar com as "" pra formar a string
    //lembrando que ele tá concatenando o "_dio.options.baseUrl" com a string "url"
    var url = "/cep/";

    //metodo Get do dio
    var res = await _dio.get(url);

    //lembrar de não confundir a model do via cep com a do Back4app
    return CepBack4AppModel.fromJson(res.data);
  }

  //vendo se o Cep já está cadastrado no back4app,
  //se já exiver, não faz nada, se não estiver, é salvo
  Future<void> verifyCepExistsAtBack4App (ViaCepModel viaCepModelPayload, Object vanillaJson) async {

    //passando o payload convertido a json e,
    //vendo se o cep existe no CepBack4App para ser salvo
    var url = "cep/?where=$vanillaJson";
    var res = await _dio.get(url);

    //resposta da consulta do Back4App
    var resBack4appConsult = CepBack4AppModel.fromJson(res.data);

    //se a lista retornar vazia, quer dizer que não existe nenhum cep cadastrado no back4app
    if(resBack4appConsult.results.isEmpty) {
      //passando o payload como parametro para salvar os dados
      SaveCep(viaCepModelPayload);
    }

  }


  Future<void> SaveCep(ViaCepModel viaCepModel) async {

    try {
      //metodo put do Dio\
      //passando o id do objeto que veio por parametro, acessando o id direto do construtor
      await _dio.post("cep/", data: viaCepModel.toJson());

    } catch (e) {
      //print(e);
    }
  }


}
