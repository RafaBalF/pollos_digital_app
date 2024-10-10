import 'package:mobx/mobx.dart';
import 'package:pollos_digital/app/models/abstract/from_json.abstract.dart';

class ProjetoModel extends FromJsonModel {
  int? modelo;
  String? nome;
  String? nomePagina;
  String? email;
  String? telefone;
  String? descricao;
  String? linkContato;
  String? missao;
  String? visao;
  String? valores;
  String? linkImage;
  ObservableList? habilidades = ObservableList<String>.of([]);
  ObservableList? extras = ObservableList<ExtrasModel>.of([]);
  String? message;

  ProjetoModel(
      {this.modelo,
      this.nome,
      this.nomePagina,
      this.email,
      this.telefone,
      this.descricao,
      this.linkContato,
      this.missao,
      this.visao,
      this.valores,
      this.linkImage,
      this.habilidades,
      this.extras});

  ProjetoModel.createNew(ProjetoModel model) {
    nome = model.nome;
    email = model.email;
    telefone = model.telefone;
    descricao = model.descricao;
    habilidades = model.habilidades;
  }

  ProjetoModel.fromJson(Map<String, dynamic> json) {
    modelo = json['modelo'];
    nome = json['nomepessoa'];
    nomePagina = json['nomearquivo'];
    email = json['email'];
    telefone = json['telefone'];
    descricao = json['descricao'];
    linkContato = json['linkcontato'];
    missao = json['missao'];
    visao = json['visao'];
    valores = json['valores'];
    linkImage = json['linkimage'];
    for (var e in json['habilidades']) {
      habilidades!.add(e);
    }
    for (var e in json['extras']) {
      extras!.add(ExtrasModel(descricao: e['descricao'], valor: e['valor']));
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['modelo'] = modelo;
    json['nomepessoa'] = nome;
    json['nomearquivo'] = nomePagina;
    json['email'] = email;
    json['telefone'] = telefone;
    json['descricao'] = descricao;
    json['linkentrecontato'] = linkContato;
    json['missao'] = missao;
    json['visao'] = visao;
    json['valores'] = valores;
    json['linkdaimagem1'] = linkImage;
    json['habilidades'] = habilidades;
    json['extras'] = extras;
    return json;
  }

  @override
  fromJson(Map<String, dynamic> json) => ProjetoModel.fromJson(json);
}

class ExtrasModel extends FromJsonModel {
  String? descricao;
  int? valor;

  ExtrasModel({
    this.descricao,
    this.valor,
  });

  ExtrasModel.fromJson(Map<String, dynamic> json) {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['descricao'] = descricao;
    json['valor'] = valor;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['descricao'] = descricao;
    json['valor'] = valor;
    return json;
  }

  @override
  fromJson(Map<String, dynamic> json) => ExtrasModel.fromJson(json);
}
