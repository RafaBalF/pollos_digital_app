import 'package:pollos_digital/app/models/evento_sessao.model.dart';
import 'package:pollos_digital/app/shared/convert.dart';

import 'abstract/from_json.abstract.dart';

class SessaoModel extends FromJsonModel {
  int? codigoTratamento;
  int? codigoComanda;
  int? codigoItemComposicao;
  int? codigoComandaItem;
  String? nomeTratamento;
  List<EventoSessaoModel>? eventos;

  SessaoModel({
    this.codigoTratamento,
    this.codigoComanda,
    this.codigoItemComposicao,
    this.codigoComandaItem,
    this.nomeTratamento,
    this.eventos,
  });

  SessaoModel.createNew(SessaoModel model) {
    codigoTratamento = model.codigoTratamento;
    codigoComanda = model.codigoComanda;
    codigoItemComposicao = model.codigoItemComposicao;
    codigoComandaItem = model.codigoComandaItem;
    nomeTratamento = model.nomeTratamento;
    eventos = model.eventos;
  }

  SessaoModel.fromJson(Map<String, dynamic> json) {
    codigoTratamento = convertInt(json['codigoTratamento']);
    codigoComanda = convertInt(json['codigoComanda']);
    codigoItemComposicao = convertInt(json['codigoItemComposicao']);
    codigoComandaItem = convertInt(json['codigoComandaItem']);
    nomeTratamento = json['nomeTratamento'];

    eventos = [];
    if (json['eventos'] != null) {
      for (var area in json['eventos']) {
        var m = EventoSessaoModel.fromJson(area);
        eventos!.add(m);
      }
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    return data;
  }

  @override
  fromJson(Map<String, dynamic> json) => SessaoModel.fromJson(json);
}
