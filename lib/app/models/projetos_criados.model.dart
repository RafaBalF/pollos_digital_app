import 'package:pollos_digital/app/models/abstract/from_json.abstract.dart';

class ProjetosCriadosModel extends FromJsonModel {
  int? id;
  String? nomeProjeto;
  String? url;
  String? criadoEm;
  String? message;

  ProjetosCriadosModel({
    this.id,
    this.nomeProjeto,
    this.url,
    this.criadoEm,
    this.message,
  });

  ProjetosCriadosModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nomeProjeto = json['nome_projeto'];
    url = json['url'];
    criadoEm = json['criado_em'];
    message = json["mensagem"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['nomeProjeto'] = nomeProjeto;
    json['url'] = url;
    json['criado_em'] = criadoEm;
    json['message'] = message;
    return json;
  }

  @override
  fromJson(Map<String, dynamic> json) => ProjetosCriadosModel.fromJson(json);
}
