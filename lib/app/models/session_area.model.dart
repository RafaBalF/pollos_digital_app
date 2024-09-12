import 'abstract/from_json.abstract.dart';

class SessionAreaModel extends FromJsonModel {
  String? name;
  int? duration;

  SessionAreaModel({
    this.name,
    this.duration,
  });

  SessionAreaModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    duration = json['duration'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    return data;
  }

  @override
  fromJson(Map<String, dynamic> json) => SessionAreaModel.fromJson(json);
}
