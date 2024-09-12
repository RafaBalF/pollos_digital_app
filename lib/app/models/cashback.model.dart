import 'package:pollos_digital/app/shared/convert.dart';

import 'abstract/from_json.abstract.dart';

class CashbackModel extends FromJsonModel {
  String? nomeCliente;
  String? cpfCliente;
  double? valorRecebido;
  double? valorConsumido;
  double? saldo;

  CashbackModel({
    this.nomeCliente,
    this.cpfCliente,
    this.valorRecebido,
    this.valorConsumido,
    this.saldo,
  });

  CashbackModel.fromJson(Map<String, dynamic> json) {
    nomeCliente = json['nomeCliente'];
    cpfCliente = json['cpfCliente'];
    valorRecebido = convertDouble(json['valorRecebido']);
    valorConsumido = convertDouble(json['valorConsumido']);
    saldo = convertDouble(json['saldo']);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{};

  @override
  fromJson(Map<String, dynamic> json) => CashbackModel.fromJson(json);
}
