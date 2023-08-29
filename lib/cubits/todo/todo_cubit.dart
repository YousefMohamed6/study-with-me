import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:noteapp/const/text.dart';
import 'package:noteapp/model/todo_model.dart';
import 'package:noteapp/views/widgets/todo_sheet.dart';

part 'todo_state.dart';

class ToDoCubit extends Cubit<ToDoState> {
  ToDoCubit() : super(TodoInitial());
  var taskCtrl = TextEditingController();
  List<ToDoModel> tasks = [];
  void showBottomSheet(context) {
    showModalBottomSheet(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      context: context,
      builder: (context) =>
          ToDoSheet(taskCtrl: taskCtrl, formKey: GlobalKey<FormState>()),
    );
  }

  void addTask() async {
    try {
      var taskBox = Hive.box<ToDoModel>(kToDoBox);
      var task = ToDoModel(isComplete: false, taskNames: taskCtrl.text);
      await taskBox.add(task);
      emit(AddTaskSuccess());
    } on Exception {
      emit(AddTaskFailed('Faild'));
    }
  }
}
