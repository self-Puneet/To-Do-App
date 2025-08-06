import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:todo_app/features/fetch_tasks/domain/entities/task_entity.dart';

@immutable
abstract class FetchTaskState extends Equatable {
  @override
  List<Object> get props => [];
}

class ErroredFetchTaskState extends FetchTaskState {
  final String errorMessage;

  ErroredFetchTaskState({required this.errorMessage});
}

class LoadedFetchTaskState extends FetchTaskState {
  final List<TaskEntity> taskEntityList;

  LoadedFetchTaskState({required this.taskEntityList});
}

class LoadingFetchTaskState extends FetchTaskState {}

class EmptyFetchTaskState extends FetchTaskState {}
