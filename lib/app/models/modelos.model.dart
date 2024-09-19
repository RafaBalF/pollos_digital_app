import 'package:pollos_digital/app/models/abstract/from_json.abstract.dart';

class CurriculoModeloModel extends FromJsonModel {
  String? asset;
  bool? selected;
  int? modelo;
  String? link;

  CurriculoModeloModel({
    this.asset,
    this.selected,
    this.modelo,
    this.link,
  });

  CurriculoModeloModel.createNew(CurriculoModeloModel model) {
    asset = model.asset;
    selected = model.selected;
    modelo = model.modelo;
    link = model.link;
  }

  CurriculoModeloModel.fromJson(Map<String, dynamic> json) {
    asset = json['asset'];
    selected = json['selected'];
    modelo = json['modelo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['asset'] = asset;
    json['selected'] = selected;
    json['modelo'] = modelo;
    return json;
  }

  @override
  fromJson(Map<String, dynamic> json) => CurriculoModeloModel.fromJson(json);
}
