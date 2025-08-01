// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TaskModelAdapter extends TypeAdapter<TaskModel> {
  @override
  final int typeId = 2;

  @override
  TaskModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TaskModel(
      id: fields[0] as String,
      creationDate: fields[1] as DateTime,
      deadline: fields[2] as DateTime?,
      taskTitle: fields[3] as String,
      taskDescription: fields[4] as String?,
      taskStatus: fields[5] as TaskStatus?,
      pinned: fields[6] as bool,
      subtasks: (fields[7] as List).cast<SubtaskModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, TaskModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.creationDate)
      ..writeByte(2)
      ..write(obj.deadline)
      ..writeByte(3)
      ..write(obj.taskTitle)
      ..writeByte(4)
      ..write(obj.taskDescription)
      ..writeByte(5)
      ..write(obj.taskStatus)
      ..writeByte(6)
      ..write(obj.pinned)
      ..writeByte(7)
      ..write(obj.subtasks);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaskModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
