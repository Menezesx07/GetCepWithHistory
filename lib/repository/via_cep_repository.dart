import 'dart:convert';
import 'package:dio/dio.dart';
import '../model/cep_back4app_model.dart';
import '../model/via_cep_model.dart';
import 'back4app_repository.dart';


class ViaCepRepository {

  Future<ViaCepModel> getCep(String cep) async {

    var dio = Dio();
    var cepInfo = ViaCepModel();

    //consulta na api do Via CEp
    var res = await dio.get("https://viacep.com.br/ws/$cep/json/");

    //preparando resposta para validação
    cepInfo = ViaCepModel.fromJson(res.data);

    //essa variavel vai ser usada como consulta no ?where do back4app
    var vanillaJson = res;


    //fazendo uma validação para ver se o cep existe
    //se "uf" retornar vazio, é pq não foi encontrado nada
    //caso for encontrado algo, é feito a busca no back4app
    if(cepInfo.uf != null) {

      //é passado o json para fazer a busca no back4app
      getCepB4App(cepInfo, vanillaJson);

    }
    //vai retornar as viariaveis baseada no construtor do via model
    //não precisa usar o jsonDecode pois o dio já faz isso
    //apenas precisa converter de json para String dentro do model
    return ViaCepModel.fromJson(res.data);
  }

  //função criada para não atrasar a entrega da resposta do cep,
  //visto que não precisa ser sincrono com a resposta na tela
  //pois caso não, a tela só iria ser carregada depois da validação do back4app
  //e fazendo o processo de comparar e salvar
  getCepB4App(ViaCepModel viaCepModelPayload , Object vanillaJson) async {

    CepBack4AppRepository b4appRepository = CepBack4AppRepository();

    b4appRepository.verifyCepExistsAtBack4App(viaCepModelPayload, vanillaJson);
  }

}