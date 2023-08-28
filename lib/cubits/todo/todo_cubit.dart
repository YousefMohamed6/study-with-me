import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteapp/views/widgets/todo_sheet.dart';

part 'todo_state.dart';

class ToDoCubit extends Cubit<ToDoState> {
  ToDoCubit() : super(TodoInitial());
  var taskCtrl = TextEditingController();
  GlobalKey<FormState>? formkey;
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
}
