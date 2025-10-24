// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PlayerAdapter extends TypeAdapter<Player> {
  @override
  final int typeId = 0;

  @override
  Player read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Player(
      id: fields[0] as String,
      goal: fields[1] as String,
      experience: fields[2] as int,
      level: fields[3] as int,
      createdDate: fields[4] as DateTime,
      curveExponent: fields[5] as double,
      experienceMultiplier: fields[6] as double,
      dayResetHour: fields[7] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Player obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.goal)
      ..writeByte(2)
      ..write(obj.experience)
      ..writeByte(3)
      ..write(obj.level)
      ..writeByte(4)
      ..write(obj.createdDate)
      ..writeByte(5)
      ..write(obj.curveExponent)
      ..writeByte(6)
      ..write(obj.experienceMultiplier)
      ..writeByte(7)
      ..write(obj.dayResetHour);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PlayerAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
