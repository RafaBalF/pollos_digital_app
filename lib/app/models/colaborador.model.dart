import 'abstract/from_json.abstract.dart';

class ColaboradorModel extends FromJsonModel {
  int? codigoColaborador;
  int? codigoFranquia;
  String? nomeColaborador;

  ColaboradorModel({
    this.codigoColaborador,
    this.codigoFranquia,
    this.nomeColaborador,
  });

  ColaboradorModel.fromJson(Map<String, dynamic> json) {
    codigoColaborador = json['codigoColaborador'];
    codigoFranquia = json['codigoFranquia'];
    nomeColaborador = json['nomeColaborador'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    return data;
  }

  @override
  fromJson(Map<String, dynamic> json) => ColaboradorModel.fromJson(json);
}
