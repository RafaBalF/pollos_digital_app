import 'package:pollos_digital/app/shared/convert.dart';

import 'abstract/from_json.abstract.dart';

class IndicadoModel extends FromJsonModel {
  String? name;
  String? email;
  String? phone;
  DateTime? indicadoEm;

  IndicadoModel({
    this.name,
    this.email,
    this.phone,
    this.indicadoEm,
  });

  IndicadoModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];

    if (json['indicadoEm'] != null) {
      indicadoEm = convertDateTime(json['indicadoEm']);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['indicadoEm'] = indicadoEm;

    return data;
  }

  @override
  fromJson(Map<String, dynamic> json) => IndicadoModel.fromJson(json);
}
