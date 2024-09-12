import 'abstract/from_json.abstract.dart';

class StringResponseModel extends FromJsonModel {
  String? value;

  StringResponseModel({
    this.value,
  });

  StringResponseModel.fromJson(Map<String, dynamic> json) {
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    return data;
  }

  @override
  fromJson(Map<String, dynamic> json) => StringResponseModel.fromJson(json);
}
