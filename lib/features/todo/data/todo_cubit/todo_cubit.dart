import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:studytome/core/const/text.dart';
import 'package:studytome/features/todo/data/todo_model/todo_model.dart';

part 'todo_state.dart';

class ToDoCubit extends Cubit<ToDoState> {
  ToDoCubit() : super(TodoInitial());
  var taskCtrl = TextEditingController();
  List<TaskModel> taskList = [];

  void fetchTasks() {
    taskList.clear();
    var taskBox = Hive.box<TaskModel>(kToDoBox);
    taskList.addAll(taskBox.values.toList());
    emit(TodoInitial());
  }

  void addTask({required int color}) async {
    var task = TaskModel(
      isComplete: false,
      taskName: taskCtrl.text,
      color: color,
    );
    try {
      var taskBox = Hive.box<TaskModel>(kToDoBox);
      await taskBox.add(task);
      taskCtrl.clear();
      emit(AddTaskSuccess());
      fetchTasks();
    } on Exception {
      emit(AddTaskFailed('Faild'));
    }
  }

  void editTaskName({required TaskModel task, required int color}) {
    try {
      task.taskName = taskCtrl.text;
      task.color = color;
      task.save();
      taskCtrl.clear();
      emit(EditTaskSuccess());
      fetchTasks();
    } on Exception {
      emit(EditTaskFailed('Failed edit'));
      fetchTasks();
    }
  }

  void editTaskState({required TaskModel task}) {
    task.isComplete = !task.isComplete;
    task.save();
    fetchTasks();
  }

  void deleteTask({required TaskModel task}) {
    task.delete();
    fetchTasks();
  }
}
