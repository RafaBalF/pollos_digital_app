import 'package:mobx/mobx.dart';
import 'package:pollos_digital/app/models/abstract/from_json.abstract.dart';

class CurriculoModel extends FromJsonModel {
  String? nome;
  String? email;
  String? telefone;
  String? resumo;
  ObservableList? habilidades = ObservableList<String>.of([]);
  String? message;

  CurriculoModel({
    this.nome,
    this.email,
    this.telefone,
    this.resumo,
    this.habilidades,
  });

  CurriculoModel.createNew(CurriculoModel model) {
    nome = model.nome;
    email = model.email;
    telefone = model.telefone;
    resumo = model.resumo;
    habilidades = model.habilidades;
  }

  CurriculoModel.fromJson(Map<String, dynamic> json) {
    nome = json['nome'];
    email = json['email'];
    telefone = json['telefone'];
    resumo = json['resumo'];
    habilidades = json['habilidades'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['nome'] = nome;
    json['email'] = email;
    json['telefone'] = telefone;
    json['resumo'] = resumo;
    json['habilidades'] = habilidades;
    return json;
  }

  @override
  fromJson(Map<String, dynamic> json) => CurriculoModel.fromJson(json);
}
