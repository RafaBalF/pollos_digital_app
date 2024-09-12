import 'package:pollos_digital/app/models/abstract/from_json.abstract.dart';

class DadosPessoaisModel extends FromJsonModel {
  String? nome;
  String? email;
  String? cpf;
  String? celular;

  DadosPessoaisModel({
    this.nome,
    this.email,
    this.cpf,
    this.celular,
  });

  DadosPessoaisModel.createNew(DadosPessoaisModel model) {
    nome = model.nome;
    email = model.email;
    cpf = model.cpf;
    celular = model.celular;
  }

  DadosPessoaisModel.fromJson(Map<String, dynamic> json) {
    nome = json['nome'];
    email = json['email'];
    cpf = json['cpf'];
    celular = json['celular'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['nome'] = nome;
    json['email'] = email;
    json['cpf'] = cpf;
    json['celular'] = celular;
    return json;
  }

  @override
  fromJson(Map<String, dynamic> json) => DadosPessoaisModel.fromJson(json);
}
