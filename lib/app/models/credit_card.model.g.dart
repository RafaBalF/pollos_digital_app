// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credit_card.model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CreditCardModelAdapter extends TypeAdapter<CreditCardModel> {
  @override
  final int typeId = 1;

  @override
  CreditCardModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CreditCardModel(
      id: fields[0] as int?,
      numero: fields[1] as String?,
      nome: fields[2] as String?,
      dataVencimento: fields[3] as String?,
      cvv: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, CreditCardModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.numero)
      ..writeByte(2)
      ..write(obj.nome)
      ..writeByte(3)
      ..write(obj.dataVencimento)
      ..writeByte(4)
      ..write(obj.cvv);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CreditCardModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
