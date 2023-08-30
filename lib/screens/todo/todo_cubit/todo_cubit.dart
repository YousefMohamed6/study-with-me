import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:noteapp/const/text.dart';
import 'package:noteapp/screens/todo/todo_model/todo_model.dart';

part 'todo_state.dart';

class ToDoCubit extends Cubit<ToDoState> {
  ToDoCubit() : super(TodoInitial());
  var taskCtrl = TextEditingController();
  List<TaskModel> tasks = [];

  void fetchTasks() {
    tasks.clear();
    var taskBox = Hive.box<TaskModel>(kToDoBox);
    tasks.addAll(taskBox.values.toList());
    emit(TodoInitial());
  }

  void addTask(TaskModel task) async {
    try {
      var taskBox = Hive.box<TaskModel>(kToDoBox);
      await taskBox.add(task);
      emit(AddTaskSuccess());
      fetchTasks();
    } on Exception {
      emit(AddTaskFailed('Faild'));
    }
  }

  void editTask({required TaskModel task}) {
    task.taskNames = taskCtrl.text;
    task.save();
    fetchTasks();
  }

  void deleteTask({required TaskModel task}) {
    task.delete();
    fetchTasks();
  }
}
