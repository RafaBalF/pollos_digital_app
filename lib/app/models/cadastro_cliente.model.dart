import 'abstract/from_json.abstract.dart';

class CadastroClienteModel extends FromJsonModel {
  int? codigo;
  int? codigoUnidade;
  String? nomeUnidade;
  String? statusLead;

  CadastroClienteModel({
    this.codigo,
    this.codigoUnidade,
    this.nomeUnidade,
    this.statusLead,
  });

  CadastroClienteModel.fromJson(Map<String, dynamic> json) {
    codigo = json['codigo'];
    codigoUnidade = json['codigoUnidade'];
    nomeUnidade = json['nomeUnidade'];
    statusLead = json['statusLead'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    return data;
  }

  @override
  fromJson(Map<String, dynamic> json) => CadastroClienteModel.fromJson(json);
}
