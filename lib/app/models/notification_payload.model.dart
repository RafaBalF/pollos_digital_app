import 'package:pollos_digital/app/shared/convert.dart';

import 'abstract/from_json.abstract.dart';

class NotificationPayloadModel extends FromJsonModel {
  String? type;
  String? uuid;
  int? companyId;
  String? sid;

  NotificationPayloadModel({
    this.type,
    this.uuid,
  });

  NotificationPayloadModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    uuid = json['uuid'];
    companyId = convertInt(json['company_id']);
    sid = json['sid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['uuid'] = uuid;
    data['company_id'] = companyId;
    data['sid'] = sid;
    return data;
  }

  @override
  fromJson(Map<String, dynamic> json) =>
      NotificationPayloadModel.fromJson(json);
}
