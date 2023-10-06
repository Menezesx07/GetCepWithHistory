
//lembrar de renomear corretamente a classe e o construtor
//com nomes bem distintos para evitar de procurar um "s" por 3 horas
import 'package:viacepback4app/model/via_cep_model.dart';

class CepBack4AppModel {
  //results vem do retorno do Json do back4app
  //all conteudo vem dentro do objeto "results"
  List<CepItemInfo> results = [];

  CepBack4AppModel(this.results);

  CepBack4AppModel.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = <CepItemInfo>[];
      json['results'].forEach((v) {
        results.add(CepItemInfo.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson(ViaCepModel viaCepModel) {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['results'] = results.map((v) => v.toJson()).toList();
      return data;
  }
}

class CepItemInfo {
  String? objectId;
  String? cep;
  String? logradouro;
  String? complemento;
  String? bairro;
  String? localidade;
  String? uf;
  String? ibge;
  String? ddd;
  String? siafi;
  String? createdAt;
  String? updatedAt;
  String? gia;

  CepItemInfo(
      {this.objectId,
        this.cep,
        this.logradouro,
        this.complemento,
        this.bairro,
        this.localidade,
        this.uf,
        this.ibge,
        this.ddd,
        this.siafi,
        this.createdAt,
        this.updatedAt,
        this.gia});

  CepItemInfo.fromJson(Map<String, dynamic> json) {
    objectId = json['objectId'];
    cep = json['cep'];
    logradouro = json['logradouro'];
    complemento = json['complemento'];
    bairro = json['bairro'];
    localidade = json['localidade'];
    uf = json['uf'];
    ibge = json['ibge'];
    ddd = json['ddd'];
    siafi = json['siafi'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    gia = json['gia'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['objectId'] = objectId;
    data['cep'] = cep;
    data['logradouro'] = logradouro;
    data['complemento'] = complemento;
    data['bairro'] = bairro;
    data['localidade'] = localidade;
    data['uf'] = uf;
    data['ibge'] = ibge;
    data['ddd'] = ddd;
    data['siafi'] = siafi;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['gia'] = gia;
    return data;
  }
}