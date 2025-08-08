import "package:flutter_bloc/flutter_bloc.dart";
import "package:todo_app/core/errors/failure.dart";
import "package:todo_app/features/fetch_tasks/domain/entities/task_entity.dart";
import "package:todo_app/features/fetch_tasks/domain/usecases/pinned_tasks_usecase.dart";
import "package:todo_app/features/fetch_tasks/domain/usecases/status_task_usecase.dart";
import "package:todo_app/features/fetch_tasks/domain/usecases/task_usecase.dart";
import "package:todo_app/features/fetch_tasks/presentation/bloc/fetch_task_events.dart";
import "package:todo_app/features/fetch_tasks/presentation/bloc/fetch_task_state.dart";
import "package:dartz/dartz.dart";

class FetchTaskBlock extends Bloc<FetchTaskEvents, FetchTaskState> {
  // take all the usecases as attributes
  final GetAllTasksUsecase getAllTasksUsecase;
  final GetPinnedTasksUsecase getPinnedTasksUsecase;
  final GetTaskByStatusUsecase getTaskByStatusUsecase;

  FetchTaskBlock({
    required this.getAllTasksUsecase,
    required this.getPinnedTasksUsecase,
    required this.getTaskByStatusUsecase,
  }) : super(EmptyFetchTaskState()) {
    // handlers of each event - function to be executed when a perticular event happens
    on<FetchAllTaskEventsImpl>(_onFetchAllTasks);
    on<FetchPinnedTaskEventsImpl>(_onFetchPinnedTasks);
    on<FetchStatusTaskEventsImpl>(_onFetchStatusTasks);
  }

  // attributes - event on which the function is to be executed + emitter of required state
  Future<void> _onFetchAllTasks(
    FetchAllTaskEventsImpl event,
    Emitter<FetchTaskState> emit,
  ) async {
    // emit(State()) - for emitting a state at a time
    emit(LoadingFetchTaskState());

    final Either<Failure, List<TaskEntity>> taskList = await getAllTasksUsecase(
      event.username,
    );

    // The argument type 'void Function(dynamic Function(dynamic))' can't be assigned to the parameter type 'dynamic Function(Failure)'. dartargument_type_not_assignable
    // {required List<TaskEntity> taskEntityList} Type: List<TaskEntity>
    // this is the error.

    taskList.fold(
      (failure) => emit(ErroredFetchTaskState(errorMessage: "hehe")),
      (taskList) => emit(LoadedFetchTaskState(taskEntityList: taskList)),
    );
  }

  Future<void> _onFetchPinnedTasks(
    FetchPinnedTaskEventsImpl event,
    Emitter<FetchTaskState> emit,
  ) async {
    emit(LoadingFetchTaskState());

    final pinnedTaskList = await getPinnedTasksUsecase(event.username);

    pinnedTaskList.fold(
      (fialure) => emit(ErroredFetchTaskState(errorMessage: "sfsdfsdf")),
      (taskList) => emit(LoadedFetchTaskState(taskEntityList: taskList)),
    );
  }

  Future<void> _onFetchStatusTasks(
    FetchStatusTaskEventsImpl event,
    Emitter<FetchTaskState> emit,
  ) async {
    emit(LoadingFetchTaskState());

    final taskList = await getTaskByStatusUsecase(
      GetTaskByStatusParams(
        username: event.username,
        taskStatus: event.taskStatus,
      ),
    );

    taskList.fold(
      (failure) => emit(ErroredFetchTaskState(errorMessage: "sfsdf")),
      (taskList) => emit(LoadedFetchTaskState(taskEntityList: taskList)),
    );
  }
}
