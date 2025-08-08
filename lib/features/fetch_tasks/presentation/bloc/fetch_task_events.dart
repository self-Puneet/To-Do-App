import 'package:equatable/equatable.dart';
import 'package:todo_app/core/enums/task_status.dart';

abstract class FetchTaskEvents extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchPinnedTaskEventsImpl extends FetchTaskEvents {
  final String username;

  FetchPinnedTaskEventsImpl({required this.username});

  @override
  List<Object> get props => [username];
}

class FetchAllTaskEventsImpl extends FetchTaskEvents {
  final String username;

  FetchAllTaskEventsImpl({required this.username});

  @override
  List<Object> get props => [username];
}

class FetchStatusTaskEventsImpl extends FetchTaskEvents {
  final String username;
  final TaskStatus taskStatus;

  FetchStatusTaskEventsImpl({
    required this.taskStatus,
    required this.username,
  });

  @override
  List<Object> get props => [username, taskStatus];
}

class FetchSubTaskEventsImpl extends FetchTaskEvents {
  final String username;

  FetchSubTaskEventsImpl({required this.username});

  @override
  List<Object> get props => [username];
}
