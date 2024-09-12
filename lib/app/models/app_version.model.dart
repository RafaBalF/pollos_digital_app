import 'package:pollos_digital/app/shared/convert.dart';

import 'abstract/from_json.abstract.dart';

class AppVersionModel extends FromJsonModel {
  String? lastVersion;
  bool? forceUpdate;

  AppVersionModel({
    this.lastVersion,
    this.forceUpdate,
  });

  AppVersionModel.fromJson(Map<String, dynamic> json) {
    lastVersion = json['last_version'];
    forceUpdate = convertBool(json['force_update'], returnNull: false);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['last_version'] = lastVersion;
    data['force_update'] = forceUpdate;
    return data;
  }

  @override
  fromJson(Map<String, dynamic> json) => AppVersionModel.fromJson(json);
}
