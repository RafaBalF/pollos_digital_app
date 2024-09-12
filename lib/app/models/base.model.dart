import 'package:pollos_digital/app/models/abstract/from_json.abstract.dart';
import 'package:pollos_digital/app/shared/convert.dart';

class BaseModel<T extends FromJsonModel> {
  bool success = false;
  int? statusCode;
  String message = "Erro ao tentar executar essa ação";
  T? data;
  List<T>? list;

  BaseModel();

  BaseModel.errorMessage(this.message) {
    success = false;
  }

  BaseModel.networkError() {
    success = false;
    message = "Erro de conexão";
  }

  BaseModel.fromJson(
    Map<String, dynamic> json, {
    T? tipo,
    bool isList = false,
  }) {
    success = json['success'];

    statusCode = convertInt(json['statusCode']);

    if (json['message'] != null) {
      message = json['message'];
    }

    if (isList) {
      if (tipo != null && json['data'] != null) {
        var l = json['data'] as List<dynamic>;
        list = <T>[];
        for (var element in l) {
          if (element != null) {
            list!.add(tipo.fromJson(element));
          }
        }
      }
    } else {
      if (tipo != null && json['data'] != null) {
        var a = tipo.fromJson(json['data']);
        data = a;
      }
    }
  }
}
