import 'package:hive/hive.dart';

import 'abstract/from_json.abstract.dart';

part 'credit_card.model.g.dart';

@HiveType(typeId: 1)
class CreditCardModel extends FromJsonModel {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? numero;
  @HiveField(2)
  String? nome;
  @HiveField(3)
  String? dataVencimento;
  @HiveField(4)
  String? cvv;

  CreditCardModel({
    this.id,
    this.numero,
    this.nome,
    this.dataVencimento,
    this.cvv,
  });

  CreditCardModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    numero = json['numero'];
    nome = json['nome'];
    dataVencimento = json['dataVencimento'];
    cvv = json['cvv'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};

    json['id'] = id;
    json['numero'] = numero;
    json['nome'] = nome;
    json['dataVencimento'] = dataVencimento;
    json['cvv'] = cvv;

    return json;
  }

  @override
  fromJson(Map<String, dynamic> json) => CreditCardModel.fromJson(json);
}
