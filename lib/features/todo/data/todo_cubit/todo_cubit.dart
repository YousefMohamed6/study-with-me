import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:studytome/core/const/text.dart';
import 'package:studytome/features/todo/data/todo_model/todo_model.dart';

part 'todo_state.dart';

class ToDoCubit extends Cubit<ToDoState> {
  ToDoCubit() : super(TodoInitial());
  var taskCtrl = TextEditingController();
  List<ToDoModel> taskList = [];

  void fetchTasks() {
    taskList.clear();
    var taskBox = Hive.box<ToDoModel>(kToDoBox);
    taskList.addAll(taskBox.values.toList());
    emit(TodoInitial());
  }

  void addTask({required int color}) async {
    var task = ToDoModel(
      isComplete: false,
      taskName: taskCtrl.text,
      color: color,
    );
    try {
      var taskBox = Hive.box<ToDoModel>(kToDoBox);
      await taskBox.add(task);
      fetchTasks();
      emit(AddTaskSuccess());
      taskCtrl.clear();
    } catch (_) {
      emit(AddTaskFailed('Faild'));
    }
  }

  void editTaskName({required ToDoModel task, required int color}) async {
    try {
      task.taskName = taskCtrl.text;
      task.color = color;
      await task.save();
      fetchTasks();
      emit(EditTaskSuccess());
      taskCtrl.clear();
    } catch (_) {
      emit(EditTaskFailed('Failed edit'));
      fetchTasks();
    }
  }

  void editTaskState({required ToDoModel task}) async {
    task.isComplete = !task.isComplete;
    await task.save();
    fetchTasks();
    taskCtrl.clear();
  }

  void deleteTask({required ToDoModel task}) async {
    await task.delete();
    fetchTasks();
  }
}
