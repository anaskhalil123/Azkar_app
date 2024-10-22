// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theker.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ThekerAdapter extends TypeAdapter<Theker> {
  @override
  final int typeId = 0;

  @override
  Theker read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Theker(
      theker_text: fields[0] as String,
      theker_number: fields[1] as int,
      theker_reward: fields[2] as String,
      theker_guide: fields[3] as String,
      theker_header: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Theker obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.theker_text)
      ..writeByte(1)
      ..write(obj.theker_number)
      ..writeByte(2)
      ..write(obj.theker_reward)
      ..writeByte(3)
      ..write(obj.theker_guide)
      ..writeByte(4)
      ..write(obj.theker_header);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ThekerAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
