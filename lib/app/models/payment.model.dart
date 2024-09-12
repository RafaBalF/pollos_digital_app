import 'abstract/from_json.abstract.dart';

class PaymentModel extends FromJsonModel {
  int? id;
  String? parcela;
  DateTime? date;
  double? price;
  double? oldPrice;
  int? statusCode;
  // 0 => pago
  // 1 => atrasado
  // 2 => aberto
  double? discount;

  PaymentModel({
    this.id,
    this.parcela,
    this.date,
    this.price,
    this.oldPrice,
    this.statusCode,
    this.discount,
  });

  PaymentModel.createNew(PaymentModel model) {
    id = model.id;
    parcela = model.parcela;
    price = model.price;
    oldPrice = model.oldPrice;
    date = model.date;
    statusCode = model.statusCode;
    discount = model.discount;
  }

  PaymentModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    parcela = json['parcela'];
    price = json['price'];
    oldPrice = json['oldPrice'];
    date = json['date'];
    statusCode = json['statusCode'];
    discount = json['discount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    return data;
  }

  @override
  fromJson(Map<String, dynamic> json) => PaymentModel.fromJson(json);
}
