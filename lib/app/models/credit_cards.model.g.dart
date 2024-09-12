// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credit_cards.model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CreditCardsModelAdapter extends TypeAdapter<CreditCardsModel> {
  @override
  final int typeId = 2;

  @override
  CreditCardsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CreditCardsModel(
      cards: (fields[0] as List?)?.cast<CreditCardModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, CreditCardsModel obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.cards);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CreditCardsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
