import 'package:hive/hive.dart';

import 'abstract/from_json.abstract.dart';

part 'auth.model.g.dart';

@HiveType(typeId: 0)
class AuthModel extends FromJsonModel {
  @HiveField(0)
  String? id;
  @HiveField(1)
  String? nome;
  @HiveField(2)
  String? email;
  @HiveField(3)
  String? criadoEm;
  String? cpf;
  bool sucesso = false;
  // @HiveField(4)
  // String? email;
  @HiveField(5)
  String? senha;
  // @HiveField(6)
  // String? tokenPush;
  String? mensagem;
  String? celular;

  AuthModel.cpf({this.cpf});

  AuthModel({
    this.id,
    this.nome,
    this.email,
    this.criadoEm,
    this.senha,
    this.celular,
  });

  AuthModel.fromJson(Map<String, dynamic> json) {
    sucesso = json['sucesso'];
    if (json['id'] != null) {
      id = json["id"].toString();
    }
    if (json["usuarios"] != null) {
      id = json["usuarios"][0]['id'];
      nome = json["usuarios"][0]['nome'];
      email = json["usuarios"][0]['email'];
      criadoEm = json["usuarios"][0]['criado_em'];
      celular = json["usuarios"][0]['celular'];
    } else {
      mensagem = json['mensagem'];
    }
    // email = json['cliente']['email'];
    // senha = json['cliente']['senha'];
    // tokenPush = json['cliente']['tokenPush'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    return data;
  }

  @override
  fromJson(Map<String, dynamic> json) => AuthModel.fromJson(json);
}
