import 'abstract/from_json.abstract.dart';

class EstabelecimentoModel extends FromJsonModel {
  int? id;
  String? nome;
  String? foto;

  EstabelecimentoModel({
    this.id,
    this.nome,
    this.foto,
  });

  EstabelecimentoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    foto = json['foto'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    return data;
  }

  @override
  fromJson(Map<String, dynamic> json) => EstabelecimentoModel.fromJson(json);
}
