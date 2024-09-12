import 'package:pollos_digital/app/shared/convert.dart';

import 'abstract/from_json.abstract.dart';

class EventoSessaoModel extends FromJsonModel {
  int? codigoAgendamento;
  int? codigoEvento;
  String? status;
  DateTime? dataHoraIncio;
  DateTime? dataHoraFim;
  String? assunto;
  String? potencia;
  String? frequencia;
  String? evoluiuDia;
  int? tempoSessao;
  int? codigoItemComposicao;

  EventoSessaoModel({
    this.codigoAgendamento,
    this.codigoEvento,
    this.status,
    this.dataHoraIncio,
    this.dataHoraFim,
    this.assunto,
    this.potencia,
    this.frequencia,
    this.evoluiuDia,
    this.tempoSessao,
    this.codigoItemComposicao,
  });

  EventoSessaoModel.createNew(EventoSessaoModel model) {
    codigoAgendamento = model.codigoAgendamento;
    codigoEvento = model.codigoEvento;
    status = model.status;
    dataHoraIncio = model.dataHoraIncio;
    dataHoraFim = model.dataHoraFim;
    assunto = model.assunto;
    potencia = model.potencia;
    frequencia = model.frequencia;
    evoluiuDia = model.evoluiuDia;
    tempoSessao = model.tempoSessao;
    codigoItemComposicao = model.codigoItemComposicao;
  }

  EventoSessaoModel.fromJson(Map<String, dynamic> json) {
    codigoAgendamento = convertInt(json['codigoAgendamento']);
    codigoEvento = convertInt(json['codigoEvento']);
    status = json['status'];
    dataHoraIncio = convertDateTime(json['dataHoraIncio']);
    dataHoraFim = convertDateTime(json['dataHoraFim']);
    assunto = json['assunto'];
    potencia = json['potencia'];
    frequencia = json['frequencia'];
    evoluiuDia = json['evoluiuDia'];
    tempoSessao = convertInt(json['tempoSessao']);
    codigoItemComposicao = convertInt(json['codigoItemComposicao']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    return data;
  }

  @override
  fromJson(Map<String, dynamic> json) => EventoSessaoModel.fromJson(json);
}
