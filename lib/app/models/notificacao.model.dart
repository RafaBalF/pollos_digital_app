import 'package:pollos_digital/app/shared/convert.dart';

import 'abstract/from_json.abstract.dart';

class NotificacaoModel extends FromJsonModel {
  int? codigo;
  int? codigoCliente;
  int? codigoNotificacao;
  String? tituloNotificacao;
  String? mensagemNotificacao;
  bool? lido;
  DateTime? dataEnvio;
  String? notificacao;
  String? cliente;
  bool? statusEnvio;
  String? descricao;
  DateTime? dataInsert;
  DateTime? dataUpdate;
  DateTime? dataDelete;
  bool? ativo;

  NotificacaoModel({
    this.codigo,
    this.codigoCliente,
    this.codigoNotificacao,
    this.tituloNotificacao,
    this.mensagemNotificacao,
    this.lido,
    this.dataEnvio,
    this.notificacao,
    this.cliente,
    this.statusEnvio,
    this.descricao,
    this.dataInsert,
    this.dataUpdate,
    this.dataDelete,
    this.ativo,
  });

  NotificacaoModel.createNew(NotificacaoModel model) {
    codigo = model.codigo;
    codigoCliente = model.codigoCliente;
    codigoNotificacao = model.codigoNotificacao;
    tituloNotificacao = model.tituloNotificacao;
    mensagemNotificacao = model.mensagemNotificacao;
    lido = model.lido;
    dataEnvio = model.dataEnvio;
    notificacao = model.notificacao;
    cliente = model.cliente;
    statusEnvio = model.statusEnvio;
    descricao = model.descricao;
    dataInsert = model.dataInsert;
    dataUpdate = model.dataUpdate;
    dataDelete = model.dataDelete;
    ativo = model.ativo;
  }

  NotificacaoModel.fromJson(Map<String, dynamic> json) {
    codigo = convertInt(json["codigo"]);
    codigoCliente = convertInt(json["codigoCliente"]);
    codigoNotificacao = convertInt(json["codigoNotificacao"]);
    tituloNotificacao = json["tituloNotificacao"];
    mensagemNotificacao = json["mensagemNotificacao"];
    lido = convertBool(json["lido"], returnNull: false);
    dataEnvio = convertDateTime(json["dataEnvio"]);
    notificacao = json["notificacao"];
    cliente = json["cliente"];
    statusEnvio = convertBool(json["statusEnvio"]);
    descricao = json["descricao"];
    dataInsert = convertDateTime(json["dataInsert"]);
    dataUpdate = convertDateTime(json["dataUpdate"]);
    dataDelete = convertDateTime(json["dataDelete"]);
    ativo = convertBool(json["ativo"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    return data;
  }

  @override
  fromJson(Map<String, dynamic> json) => NotificacaoModel.fromJson(json);
}
