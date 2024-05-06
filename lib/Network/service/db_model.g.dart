// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HivedbModelAdapter extends TypeAdapter<HivedbModel> {
  @override
  final int typeId = 0;

  @override
  HivedbModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HivedbModel()..name = fields[0] as String;
  }

  @override
  void write(BinaryWriter writer, HivedbModel obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HivedbModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
