import 'package:hive/hive.dart';

import 'abstract/from_json.abstract.dart';

part 'auth.model.g.dart';

@HiveType(typeId: 0)
class AuthModel extends FromJsonModel {
  @HiveField(0)
  String? token;
  @HiveField(1)
  String? nome;
  @HiveField(2)
  String? cpf;
  @HiveField(3)
  String? celular;
  @HiveField(4)
  String? email;
  @HiveField(5)
  String? senha;
  @HiveField(6)
  String? tokenPush;

  AuthModel.cpf({this.cpf});

  AuthModel({
    this.token,
    this.nome,
    this.cpf,
    this.celular,
    this.email,
    this.senha,
    this.tokenPush,
  });

  AuthModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    nome = json['cliente']['nome'];
    cpf = json['cliente']['cpf'];
    celular = json['cliente']['telefoneCelular'];
    email = json['cliente']['email'];
    senha = json['cliente']['senha'];
    tokenPush = json['cliente']['tokenPush'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    return data;
  }

  @override
  fromJson(Map<String, dynamic> json) => AuthModel.fromJson(json);
}
