import 'abstract/from_json.abstract.dart';

class AvailableSchedulesModel extends FromJsonModel {
  DateTime? day;
  int? sessionCode;
  int? duration;
  List<DateTime>? schedules;
  DateTime? selectedDate;

  AvailableSchedulesModel({
    this.day,
    this.sessionCode,
    this.duration,
    this.schedules,
    this.selectedDate,
  });

  AvailableSchedulesModel.createNew(AvailableSchedulesModel model) {
    day = model.day;
    sessionCode = model.sessionCode;
    duration = model.duration;
    schedules = model.schedules;
    selectedDate = model.selectedDate;
  }

  AvailableSchedulesModel.fromJson(Map<String, dynamic> json) {
    day = json['day'];
    sessionCode = json['sessionCode'];
    duration = json['duration'];
    schedules = json['schedules'];
    selectedDate = json['selectedDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    return data;
  }

  @override
  fromJson(Map<String, dynamic> json) => AvailableSchedulesModel.fromJson(json);
}
