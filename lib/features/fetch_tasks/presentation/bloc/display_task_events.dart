import 'package:equatable/equatable.dart';
import 'package:todo_app/core/enums/task_status.dart';

abstract class FetchTaskEvents extends Equatable {
  @override
  List<Object> get props => [];
}

class PinnedFetchTaskEventsImpl extends FetchTaskEvents {
  final String username;

  PinnedFetchTaskEventsImpl({required this.username});

  @override
  List<Object> get props => [username];
}

class AllFetchTaskEventsImpl extends FetchTaskEvents {
  final String username;

  AllFetchTaskEventsImpl({required this.username});

  @override
  List<Object> get props => [username];
}

class StatusFetchTaskEventsImpl extends FetchTaskEvents {
  final String username;
  final TaskStatus taskStatus;

  StatusFetchTaskEventsImpl({
    required this.taskStatus,
    required this.username,
  });

  @override
  List<Object> get props => [username];
}

class SubFetchTaskEventsImpl extends FetchTaskEvents {
  final String username;

  SubFetchTaskEventsImpl({required this.username});

  @override
  List<Object> get props => [username];
}
