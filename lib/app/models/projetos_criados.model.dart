// import 'package:pollos_digital/app/models/abstract/from_json.abstract.dart';

// class ProjetosCriadosModel extends FromJsonModel {
//   String? id;
//   String? nomeProjeto;
//   String? urlamigavel;
//   String? criadoEm;
//   String? message;

//   ProjetosCriadosModel({
//     this.id,
//     this.nomeProjeto,
//     this.urlamigavel,
//     this.criadoEm,
//     this.message,
//   });

//   ProjetosCriadosModel.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     nomeProjeto = json['nomepessoa'];
//     urlamigavel = json['urlamigavel'];
//     criadoEm = json['criado_em'];
//     message = json["mensagem"];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> json = <String, dynamic>{};
//     json['id'] = id;
//     json['nomeProjeto'] = nomeProjeto;
//     json['url'] = urlamigavel;
//     json['criado_em'] = criadoEm;
//     json['message'] = message;
//     return json;
//   }

//   @override
//   fromJson(Map<String, dynamic> json) => ProjetosCriadosModel.fromJson(json);
// }
