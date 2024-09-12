import 'package:pollos_digital/app/shared/convert.dart';

import 'abstract/from_json.abstract.dart';

class FranquiaModel extends FromJsonModel {
  int? codigoFranquia;
  String? nomeFranquia;
  String? cnpjFranquia;
  String? endereco;
  String? bairro;
  String? complemento;
  String? cep;
  String? cidade;
  String? uf;
  String? telefone;
  String? email;
  DateTime? dataInauguracao;
  bool? unidadeAberta;
  bool? gerarNotaFiscal;
  bool? integradoSalesForce;
  bool? integradoAgendaNova;
  bool? integradoAgendamentoApp;
  double? latitude;
  double? longitude;
  int? codigoRegional;
  String? nomeRegional;
  int? codigoTipoPropriedadeFranquia;
  String? galaxPayId;
  String? galaxPayHash;
  int? codigoPais;
  int? codigoEmpresa;
  int? numeroContaGalaxPay;
  bool? celCoinV2;
  String? unidade;

  FranquiaModel({
    this.codigoFranquia,
    this.nomeFranquia,
    this.cnpjFranquia,
    this.endereco,
    this.bairro,
    this.complemento,
    this.cep,
    this.cidade,
    this.uf,
    this.telefone,
    this.email,
    this.dataInauguracao,
    this.unidadeAberta,
    this.gerarNotaFiscal,
    this.integradoSalesForce,
    this.integradoAgendaNova,
    this.integradoAgendamentoApp,
    this.latitude,
    this.longitude,
    this.codigoRegional,
    this.nomeRegional,
    this.codigoTipoPropriedadeFranquia,
    this.galaxPayId,
    this.galaxPayHash,
    this.codigoPais,
    this.codigoEmpresa,
    this.numeroContaGalaxPay,
    this.celCoinV2,
    this.unidade,
  });

  FranquiaModel.fromJson(Map<String, dynamic> json) {
    codigoFranquia = convertInt(json['codigoFranquia']);
    nomeFranquia = json['nomeFranquia'];
    cnpjFranquia = json['cnpjFranquia'];
    endereco = json['endereco'];
    bairro = json['bairro'];
    complemento = json['complemento'];
    cep = json['cep'];
    cidade = json['cidade'];
    uf = json['uf'];
    telefone = json['telefone'];
    email = json['email'];
    dataInauguracao = convertDateTime(json['dataInauguracao']);
    unidadeAberta = (json['unidadeAberta'] == "S");
    gerarNotaFiscal = convertBool(json['gerarNotaFiscal']);
    integradoSalesForce = convertBool(json['integradoSalesForce']);
    integradoAgendaNova = convertBool(json['integradoAgendaNova']);
    integradoAgendamentoApp = convertBool(json['integradoAgendamentoApp']);
    latitude = json['latitude'];
    longitude = json['longitude'];
    codigoRegional = convertInt(json['codigoRegional']);
    nomeRegional = json['nomeRegional'];
    codigoTipoPropriedadeFranquia =
        convertInt(json['codigoTipoPropriedadeFranquia']);
    galaxPayId = json['galaxPayId'];
    galaxPayHash = json['galaxPayHash'];
    codigoPais = convertInt(json['codigoPais']);
    codigoEmpresa = convertInt(json['codigoEmpresa']);
    numeroContaGalaxPay = json['numeroContaGalaxPay'];
    celCoinV2 = convertBool(json['celCoinV2']);
    unidade = json['unidade'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    return data;
  }

  @override
  fromJson(Map<String, dynamic> json) => FranquiaModel.fromJson(json);
}
