import 'package:pollos_digital/app/models/item_contrato.model.dart';
import 'package:pollos_digital/app/shared/convert.dart';

import 'abstract/from_json.abstract.dart';

class ContratoModel extends FromJsonModel {
  int? codigoComanda;
  DateTime? dataEmissao;
  double? valorTotal;
  String? status;
  String? linkContrato;
  String? linkAditivo;
  String? linkTermoCiencia;
  List<ItemContratoModel>? itens;

  ContratoModel({
    this.codigoComanda,
    this.dataEmissao,
    this.valorTotal,
    this.status,
    this.linkContrato,
    this.linkAditivo,
    this.linkTermoCiencia,
    this.itens,
  });

  ContratoModel.fromJson(Map<String, dynamic> json) {
    codigoComanda = convertInt(json['codigoComanda']);
    dataEmissao = convertDateTime(json['dataEmissao']);
    valorTotal = convertDouble(json['valorTotal']);
    status = json['status'];
    linkContrato = json['linkContrato'];
    linkAditivo = json['linkAditivo'];
    linkTermoCiencia = json['linkTermoCiencia'];

    itens = [];
    if (json['itens'] != null) {
      for (var i in json['itens']) {
        itens!.add(ItemContratoModel.fromJson(i));
      }
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    return data;
  }

  @override
  fromJson(Map<String, dynamic> json) => ContratoModel.fromJson(json);
}
