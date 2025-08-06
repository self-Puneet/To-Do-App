// import "package:flutter_bloc/flutter_bloc.dart";
// import "package:todo_app/core/errors/failure.dart";
// import "package:todo_app/features/fetch_tasks/domain/entities/task_entity.dart";
// import "package:todo_app/features/fetch_tasks/domain/usecases/pinned_tasks_usecase.dart";
// import "package:todo_app/features/fetch_tasks/domain/usecases/status_task_usecase.dart";
// import "package:todo_app/features/fetch_tasks/domain/usecases/task_usecase.dart";
// import "package:todo_app/features/fetch_tasks/presentation/bloc/display_task_events.dart";
// import "package:todo_app/features/fetch_tasks/presentation/bloc/display_task_state.dart";

// class FetchTaskBlock extends Bloc<FetchTaskEvents, FetchTaskState> {
//   // take all the usecases as attributes
//   final GetAllTasksUsecase getAllTasksUsecase;
//   final GetPinnedTasksUsecase getPinnedTasksUsecase;
//   final GetTaskByStatusUsecase getTaskByStatusUsecase;

//   FetchTaskBlock({required this.getAllTasksUsecase, required this.getPinnedTasksUsecase, required this.getTaskByStatusUsecase}):super(EmptyFetchTaskState()) {
//     // handlers of each event - function to be executed when a perticular event happens
//     on<AllFetchTaskEventsImpl>(_onFetchAllTasks);
//     // on<PinnedFetchTaskEventsImpl>();
//   };

//   // attributes - event on which the function is to be executed + emitter of required state
//   Future<void> _onFetchAllTasks(AllFetchTaskEventsImpl event, Emitter<FetchTaskState> emit)  {
//     // emit(State()) - for emitting a state at a time
//     emit(LoadingFetchTaskState());

//     final taskList = getAllTasksUsecase;

//     taskList.fold(
//     (Right(taskList)) =>   emit(ErroredFetchTaskState(errorMessage: "hehe")),
//       () =>
//     );

    

//   }
  

// }
