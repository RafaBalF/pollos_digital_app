import 'package:pollos_digital/app/models/abstract/from_json.abstract.dart';

class DadosPessoaisModel extends FromJsonModel {
  String? nome;
  String? email;
  String? cpf;
  String? celular;
  String? id;

  DadosPessoaisModel({
    this.nome,
    this.email,
    this.cpf,
    this.celular,
    this.id,
  });

  DadosPessoaisModel.createNew(DadosPessoaisModel model) {
    nome = model.nome;
    email = model.email;
    cpf = model.cpf;
    celular = model.celular;
    id = model.id;
  }

  DadosPessoaisModel.fromJson(Map<String, dynamic> json) {
    nome = json['nome'];
    email = json['email'];
    cpf = json['cpf'];
    celular = json['celular'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['nome'] = nome;
    json['email'] = email;
    json['cpf'] = cpf;
    json['celular'] = celular;
    json['id'] = id;
    return json;
  }

  @override
  fromJson(Map<String, dynamic> json) => DadosPessoaisModel.fromJson(json);
}
