import 'abstract/from_json.abstract.dart';

class AplicadorModel extends FromJsonModel {
  int? id;
  String? nome;
  int? atendimentos;
  String? foto;

  AplicadorModel({
    this.id,
    this.nome,
    this.atendimentos,
    this.foto,
  });

  AplicadorModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    atendimentos = json['atendimentos'];
    foto = json['foto'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    return data;
  }

  @override
  fromJson(Map<String, dynamic> json) => AplicadorModel.fromJson(json);
}
