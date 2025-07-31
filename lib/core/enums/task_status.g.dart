// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_status.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TaskStatusAdapter extends TypeAdapter<TaskStatus> {
  @override
  final int typeId = 0;

  @override
  TaskStatus read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return TaskStatus.completed;
      case 1:
        return TaskStatus.pending;
      case 2:
        return TaskStatus.delayed;
      case 3:
        return TaskStatus.lateSubmission;
      case 4:
        return TaskStatus.archived;
      default:
        return TaskStatus.completed;
    }
  }

  @override
  void write(BinaryWriter writer, TaskStatus obj) {
    switch (obj) {
      case TaskStatus.completed:
        writer.writeByte(0);
        break;
      case TaskStatus.pending:
        writer.writeByte(1);
        break;
      case TaskStatus.delayed:
        writer.writeByte(2);
        break;
      case TaskStatus.lateSubmission:
        writer.writeByte(3);
        break;
      case TaskStatus.archived:
        writer.writeByte(4);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaskStatusAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
