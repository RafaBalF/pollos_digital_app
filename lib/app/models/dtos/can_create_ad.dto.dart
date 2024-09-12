import '../abstract/from_json.abstract.dart';

class CanCreateAdDto extends FromJsonModel {
  bool? isValidAddress;
  bool? isValidPhone;

  CanCreateAdDto({this.isValidAddress, this.isValidPhone});

  CanCreateAdDto.fromJson(Map<String, dynamic> json) {
    isValidAddress = json['is_valid_address'];
    isValidPhone = json['is_valid_phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['is_valid_address'] = isValidAddress;
    data['is_valid_phone'] = isValidPhone;
    return data;
  }

  @override
  fromJson(Map<String, dynamic> json) => CanCreateAdDto.fromJson(json);
}
