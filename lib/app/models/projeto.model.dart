import 'package:mobx/mobx.dart';
import 'package:pollos_digital/app/models/abstract/from_json.abstract.dart';

class ProjetoModel extends FromJsonModel {
  String? id;
  int? usuarioId;
  String? urlAmigavel;
  String? modelo;
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
      {this.usuarioId,
      this.urlAmigavel,
      this.modelo,
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
    id = json['id'];
    usuarioId = int.parse(json['usuario_id']);
    modelo = json['modeloescolhido'];
    nome = json['nomepessoa'];
    nomePagina = json['nomearquivo'];
    urlAmigavel = json['urlamigavel'];
    email = json['email'];
    telefone = json['telefone'];
    descricao = json['descricao'];
    String? telefoneSomenteNumero = telefone?.replaceAll(RegExp(r'[^0-9]'), '');
    linkContato = json['linkentrecontato'] ??
        'https://api.whatsapp.com/send/?phone=55$telefoneSomenteNumero';
    missao = json['missao'];
    visao = json['visao'];
    valores = json['valores'];
    linkImage = json['linkdaimagem1'];
    if (json['habilidades'] != null) {
      for (var e in json['habilidades']) {
        habilidades!.add(e);
      }
    }
    if (json['extras'] != null) {
      for (var e in json['extras']) {
        extras!.add(ExtrasModel(descricao: e['descricao'], valor: e['valor']));
      }
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['usuario_id'] = usuarioId;
    json['urlamigavel'] = urlAmigavel;
    json['modeloescolhido'] = modelo;
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
