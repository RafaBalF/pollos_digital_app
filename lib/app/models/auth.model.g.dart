// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth.model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AuthModelAdapter extends TypeAdapter<AuthModel> {
  @override
  final int typeId = 0;

  @override
  AuthModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AuthModel(
      token: fields[0] as String?,
      nome: fields[1] as String?,
      cpf: fields[2] as String?,
      celular: fields[3] as String?,
      email: fields[4] as String?,
      senha: fields[5] as String?,
      tokenPush: fields[6] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, AuthModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.token)
      ..writeByte(1)
      ..write(obj.nome)
      ..writeByte(2)
      ..write(obj.cpf)
      ..writeByte(3)
      ..write(obj.celular)
      ..writeByte(4)
      ..write(obj.email)
      ..writeByte(5)
      ..write(obj.senha)
      ..writeByte(6)
      ..write(obj.tokenPush);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AuthModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
