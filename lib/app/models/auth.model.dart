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
  bool? sucesso = false;
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
    this.mensagem,
    this.sucesso,
  });

  AuthModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    email = json['email'];
    celular = json['celular'];
    sucesso = true;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    return data;
  }

  @override
  fromJson(Map<String, dynamic> json) => AuthModel.fromJson(json);
}
