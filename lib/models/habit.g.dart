// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'habit.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HabitAdapter extends TypeAdapter<Habit> {
  @override
  final int typeId = 2;

  @override
  Habit read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Habit(
      id: fields[0] as String,
      title: fields[1] as String,
      description: fields[2] as String,
      experience: fields[3] as int,
      scheduleType: fields[4] as String,
      daysOfWeek: (fields[5] as List?)?.cast<int>(),
      daysOfMonth: (fields[6] as List?)?.cast<int>(),
      intervalDays: fields[7] as int?,
      createdDate: fields[8] as DateTime,
      completionCount: fields[9] as int,
      minCompletionCount: fields[10] as int,
      karmaLevel: fields[11] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Habit obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.experience)
      ..writeByte(4)
      ..write(obj.scheduleType)
      ..writeByte(5)
      ..write(obj.daysOfWeek)
      ..writeByte(6)
      ..write(obj.daysOfMonth)
      ..writeByte(7)
      ..write(obj.intervalDays)
      ..writeByte(8)
      ..write(obj.createdDate)
      ..writeByte(9)
      ..write(obj.completionCount)
      ..writeByte(10)
      ..write(obj.minCompletionCount)
      ..writeByte(11)
      ..write(obj.karmaLevel);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HabitAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
