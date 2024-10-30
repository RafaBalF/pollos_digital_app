import 'package:image_picker/image_picker.dart';
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
  ObservableList? experiencias = ObservableList<ExperienciaModel>.of([]);
  ObservableList? extras = ObservableList<ExtrasModel>.of([]);
  ObservableList? faq = ObservableList<FaqModel>.of([]);
  ObservableList? card = ObservableList<CardModel>.of([]);
  ObservableList? depoimentos = ObservableList<DepoimentoModel>.of([]);
  String? message;
  String? imagemModelo;

  ProjetoModel(
      {this.id,
      this.usuarioId,
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
      this.extras,
      this.faq,
      this.card,
      this.depoimentos,
      this.experiencias});

  ProjetoModel.createNew(ProjetoModel model) {
    nome = model.nome;
    email = model.email;
    telefone = model.telefone;
    descricao = model.descricao;
    habilidades = model.habilidades;
  }

  ProjetoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['usuario_id'] != null) usuarioId = int.parse(json['usuario_id']);
    modelo = json['modeloescolhido'];
    nome = json['nomepessoa'];
    nomePagina = json['nomearquivo'];
    urlAmigavel = json['urlamigavel'];
    email = json['email'];
    telefone = json['telefone'];
    descricao = json['descricao'];
    String? telefoneSomenteNumero = telefone?.replaceAll(RegExp(r'[^0-9]'), '');
    if (telefoneSomenteNumero != null) {
      linkContato = json['linkentrecontato'] ??
          'https://api.whatsapp.com/send/?phone=55$telefoneSomenteNumero';
    }
    missao = json['missao'];
    visao = json['visao'];
    valores = json['valores'];
    linkImage = json['linkdaimagem1'];
    imagemModelo = json['imagem_modelo'];
    if (json['habilidades'] != []) {
      for (var e in json['habilidades']) {
        habilidades!.add(e);
      }
    }
    if (json['extras'] != []) {
      for (var e in json['extras']) {
        extras!.add(ExtrasModel(
            descricao: e['descricao'],
            valor: double.tryParse(e['valor'].toString())?.toInt()));
      }
    }
    if (json['experiencias'] != []) {
      for (var e in json['experiencias']) {
        experiencias!.add(ExperienciaModel(
          cargo: e['cargo'],
          empresa: e['empresa'],
          dataDeInicio: e['data_inicio'] != null
              ? DateTime.parse(e['data_inicio'])
              : DateTime.now(),
          dataDeFim: e['data_fim'] != null
              ? DateTime.parse(e['data_fim'])
              : DateTime.now(),
          descricao: e['descricao'],
        ));
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
    json['experiencias'] = experiencias;
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
    descricao = json['descricao'];
    valor = json['valor'];
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

class FaqModel extends FromJsonModel {
  String? pergunta;
  String? resposta;

  FaqModel({
    this.pergunta,
    this.resposta,
  });

  FaqModel.fromJson(Map<String, dynamic> json) {
    final Map<String, dynamic> json = <String, dynamic>{};
    pergunta = json['pergunta'];
    resposta = json['resposta'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['pergunta'] = pergunta;
    json['resposta'] = resposta;
    return json;
  }

  @override
  fromJson(Map<String, dynamic> json) => FaqModel.fromJson(json);
}

class CardModel extends FromJsonModel {
  String? titulo;
  String? texto;

  CardModel({
    this.titulo,
    this.texto,
  });

  CardModel.fromJson(Map<String, dynamic> json) {
    final Map<String, dynamic> json = <String, dynamic>{};

    titulo = json['titulo'];
    texto = json['texto'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['titulo'] = titulo;
    json['texto'] = texto;
    return json;
  }

  @override
  fromJson(Map<String, dynamic> json) => CardModel.fromJson(json);
}

class DepoimentoModel extends FromJsonModel {
  XFile? image;
  String? linkImage;
  String? nome;
  String? depoimento;

  DepoimentoModel({
    this.image,
    this.nome,
    this.depoimento,
  });

  DepoimentoModel.fromJson(Map<String, dynamic> json) {
    final Map<String, dynamic> json = <String, dynamic>{};
    nome = json['nome'];
    depoimento = json['depoimento'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['nome'] = nome;
    json['depoimento'] = depoimento;
    return json;
  }

  @override
  fromJson(Map<String, dynamic> json) => DepoimentoModel.fromJson(json);
}

class ExperienciaModel extends FromJsonModel {
  String? cargo;
  String? empresa;
  DateTime? dataDeInicio;
  DateTime? dataDeFim;
  String? descricao;

  ExperienciaModel({
    this.cargo,
    this.empresa,
    this.dataDeInicio,
    this.dataDeFim,
    this.descricao,
  });

  ExperienciaModel.fromJson(Map<String, dynamic> json) {
    final Map<String, dynamic> json = <String, dynamic>{};
    cargo = json['cargo'];
    empresa = json['empresa'];
    dataDeInicio = json['dataDeInicio'];
    dataDeFim = json['dataDeFim'];
    descricao = json['descricao'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['cargo'] = cargo;
    json['empresa'] = empresa;
    json['data_inicio'] = dataDeInicio?.toIso8601String();
    json['data_fim'] = dataDeFim?.toIso8601String();
    json['descricao'] = descricao;
    return json;
  }

  @override
  fromJson(Map<String, dynamic> json) => ExperienciaModel.fromJson(json);
}
