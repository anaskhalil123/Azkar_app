// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'thekerheader.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ThekerHeaderAdapter extends TypeAdapter<ThekerHeader> {
  @override
  final int typeId = 1;

  @override
  ThekerHeader read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ThekerHeader(
      text: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ThekerHeader obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.text);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ThekerHeaderAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
