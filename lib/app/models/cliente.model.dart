import 'package:pollos_digital/app/models/cadastro_cliente.model.dart';

import 'abstract/from_json.abstract.dart';

class ClienteModel extends FromJsonModel {
  String? nome;
  String? cpf;
  String? dataNascimento;
  String? cep;
  List<CadastroClienteModel>? cadastros;

  ClienteModel({
    this.nome,
    this.cpf,
    this.dataNascimento,
    this.cep,
    this.cadastros,
  });

  ClienteModel.fromJson(Map<String, dynamic> json) {
    nome = json['nome'];
    cpf = json['cpf'];
    dataNascimento = json['dataNascimento'];
    cep = json['cep'];

    cadastros = [];
    if (json['cadastros'] != null) {
      for (var i in json['cadastros']) {
        cadastros!.add(CadastroClienteModel.fromJson(i));
      }
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    return data;
  }

  @override
  fromJson(Map<String, dynamic> json) => ClienteModel.fromJson(json);
}
