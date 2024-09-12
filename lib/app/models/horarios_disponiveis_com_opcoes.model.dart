import 'package:pollos_digital/app/shared/convert.dart';

import 'abstract/from_json.abstract.dart';

class HorariosDisponiveisComOpcoesModel extends FromJsonModel {
  int? codigoUnidade;
  int? codigoColaborador;
  List<DateTime>? horarios;
  int? tempoSessao;

  HorariosDisponiveisComOpcoesModel({
    this.codigoUnidade,
    this.codigoColaborador,
    this.horarios,
    this.tempoSessao,
  });

  HorariosDisponiveisComOpcoesModel.fromJson(Map<String, dynamic> json) {
    codigoUnidade = convertInt(json["codigoUnidade"]);
    codigoColaborador = convertInt(json["codigoColaborador"]);
    tempoSessao = convertInt(json["tempoSessao"]);

    horarios = [];
    if (json['horarios'] != null) {
      for (var i in json['horarios']) {
        final horario = convertDateTime(i);

        if (horario != null) horarios!.add(horario);
      }
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    return data;
  }

  @override
  fromJson(Map<String, dynamic> json) =>
      HorariosDisponiveisComOpcoesModel.fromJson(json);
}
