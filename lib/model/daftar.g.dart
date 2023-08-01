// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daftar.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DaftarAdapter extends TypeAdapter<Daftar> {
  @override
  final int typeId = 0;

  @override
  Daftar read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Daftar(
      fields[0] as String,
      fields[1] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Daftar obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.nama)
      ..writeByte(1)
      ..write(obj.nomor);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DaftarAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
