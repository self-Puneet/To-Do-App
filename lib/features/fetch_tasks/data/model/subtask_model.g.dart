// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subtask_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SubtaskModelAdapter extends TypeAdapter<SubtaskModel> {
  @override
  final int typeId = 1;

  @override
  SubtaskModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SubtaskModel(
      subtaskId: fields[0] as String,
      subtaskCreationDate: fields[1] as DateTime,
      subtaskDeadline: fields[2] as DateTime?,
      subtaskTitle: fields[3] as String,
      subtaskDescription: fields[4] as String?,
      subtaskStatus: fields[5] as TaskStatus,
    );
  }

  @override
  void write(BinaryWriter writer, SubtaskModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.subtaskId)
      ..writeByte(1)
      ..write(obj.subtaskCreationDate)
      ..writeByte(2)
      ..write(obj.subtaskDeadline)
      ..writeByte(3)
      ..write(obj.subtaskTitle)
      ..writeByte(4)
      ..write(obj.subtaskDescription)
      ..writeByte(5)
      ..write(obj.subtaskStatus);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SubtaskModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
