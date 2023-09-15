part of 'todo_cubit.dart';

abstract class ToDoState {}

class TodoInitial extends ToDoState {}

class AddTaskSuccess extends ToDoState {}

class AddTaskFailed extends ToDoState {
  final String errMessage;

  AddTaskFailed(this.errMessage);
}

class EditTaskSuccess extends ToDoState {}

class EditTaskFailed extends ToDoState {
  final String errMessage;

  EditTaskFailed(this.errMessage);
}
