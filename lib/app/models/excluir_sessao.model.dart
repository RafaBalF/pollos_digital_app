import 'package:pollos_digital/app/shared/convert.dart';

import 'abstract/from_json.abstract.dart';

class ExcluirSessaoModel extends FromJsonModel {
  int? codigoComanda;
  DateTime? data;

  ExcluirSessaoModel({
    this.codigoComanda,
    this.data,
  });

  ExcluirSessaoModel.createNew(ExcluirSessaoModel model) {
    codigoComanda = model.codigoComanda;
    data = model.data;
  }

  ExcluirSessaoModel.fromJson(Map<String, dynamic> json) {
    codigoComanda = convertInt(json['codigoComanda']);
    data = convertDateTime(json['data']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    return data;
  }

  @override
  fromJson(Map<String, dynamic> json) => ExcluirSessaoModel.fromJson(json);
}
