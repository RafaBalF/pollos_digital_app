import 'package:pollos_digital/app/models/abstract/from_json.abstract.dart';

class ProjetoModeloModel extends FromJsonModel {
  int? id;
  String? nome;
  String? descricao;
  String? modeloUrl;
  String? imgUrl;
  String? status;
  bool? selected = false;

  ProjetoModeloModel({
    this.id,
    this.nome,
    this.descricao,
    this.imgUrl,
    this.modeloUrl,
    this.status,
    this.selected,
  });

  ProjetoModeloModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    descricao = json['descricao'];
    modeloUrl = json['url'];
    imgUrl = json['img'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['nome'] = nome;
    json['descricao'] = descricao;
    json['url'] = modeloUrl;
    json['img'] = imgUrl;
    json['status'] = status;
    return json;
  }

  @override
  fromJson(Map<String, dynamic> json) => ProjetoModeloModel.fromJson(json);
}
