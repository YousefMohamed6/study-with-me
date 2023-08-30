import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:noteapp/const/text.dart';
import 'package:noteapp/helper/helper_widgets/custom_text_button.dart';
import 'package:noteapp/helper_widgets/custom_text.dart';
import 'package:noteapp/screens/todo/todo_model/todo_model.dart';

part 'todo_state.dart';

class ToDoCubit extends Cubit<ToDoState> {
  ToDoCubit() : super(TodoInitial());
  var taskCtrl = TextEditingController();
  List<TaskModel> tasks = [];
  void showBottomSheet(context, {required Widget builder}) {
    showModalBottomSheet(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        context: context,
        builder: (context) => builder);
  }

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

  void deleteTask(TaskModel tast) {
    tast.delete();
    fetchTasks();
  }

  showAlertDialog(BuildContext context, TaskModel task) {
    Widget cancelButton = CustomTextButton(
      text: 'Cancel',
      onPressed: () {
        Navigator.pop(context);
      },
    );
    Widget continueButton = CustomTextButton(
      text: "Ok",
      onPressed: () {
        deleteTask(task);
        Navigator.pop(context);
      },
    );
    AlertDialog alert = AlertDialog(
      title: const CustomText(text: "Alert"),
      content: const CustomText(text: "Would you like to delete it"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  void editTask(TaskModel task) {
    deleteTask(task);
    addTask(
      TaskModel(
        isComplete: !task.isComplete,
        taskNames: task.taskNames,
      ),
    );
    fetchTasks();
  }
}
