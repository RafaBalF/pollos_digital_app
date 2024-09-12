import 'abstract/from_json.abstract.dart';

class ItemContratoModel extends FromJsonModel {
  String? categoriaItem;
  String? tipoItem;
  String? item;

  ItemContratoModel({
    this.categoriaItem,
    this.tipoItem,
    this.item,
  });

  ItemContratoModel.fromJson(Map<String, dynamic> json) {
    categoriaItem = json['categoriaItem'];
    tipoItem = json['tipoItem'];
    item = json['item'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    return data;
  }

  @override
  fromJson(Map<String, dynamic> json) => ItemContratoModel.fromJson(json);
}
