part of 'todo_cubit.dart';

sealed class ToDoState {}

final class TodoInitial extends ToDoState {}

final class AddTaskSuccess extends ToDoState {}

final class AddTaskFailed extends ToDoState {
  final String errMessage;

  AddTaskFailed(this.errMessage);
}
