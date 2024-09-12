import 'abstract/from_json.abstract.dart';

class EmptyResponseModel extends FromJsonModel {
  String? value;

  EmptyResponseModel({
    this.value,
  });

  EmptyResponseModel.fromJson(Map<String, dynamic> json);

  Map<String, dynamic> toJson() => <String, dynamic>{};

  @override
  fromJson(Map<String, dynamic> json) => EmptyResponseModel.fromJson(json);
}
