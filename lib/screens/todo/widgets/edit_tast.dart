import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteapp/helper/show_message.dart';
import 'package:noteapp/helper_widgets/custom_button.dart';
import 'package:noteapp/helper_widgets/custom_form_field.dart';
import 'package:noteapp/helper_widgets/custom_text.dart';
import 'package:noteapp/helper_widgets/vertical_sizebox.dart';
import 'package:noteapp/screens/home/cubit/home_cubit.dart';
import 'package:noteapp/screens/todo/todo_cubit/todo_cubit.dart';
import 'package:noteapp/screens/todo/todo_model/todo_model.dart';

class EditTask extends StatelessWidget {
  const EditTask(
      {super.key,
      required this.taskCtrl,
      required this.formKey,
      required this.task});
  final TextEditingController taskCtrl;
  final GlobalKey<FormState> formKey;
  final TaskModel task;
  @override
  Widget build(BuildContext context) {
    return BlocListener<ToDoCubit, ToDoState>(
      listener: (context, state) {
        if (state is AddTaskSuccess) {
          ShowMessage.show(context, msg: 'Success');
          Navigator.pop(context);
        }
        if (state is AddTaskFailed) {
          ShowMessage.show(context, msg: state.errMessage);
          Navigator.pop(context);
        }
      },
      child: Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Form(
              key: formKey,
              child: CustomFormField(
                controller: taskCtrl..text = task.taskNames,
                hintText: 'Enter your Task',
                maxLine: 1,
              ),
            ),
            const VerticalSizedBox(8),
            BlocProvider.of<HomeCubit>(context).colorPicker(),
            const VerticalSizedBox(8),
            CustomButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  BlocProvider.of<ToDoCubit>(context).editTaskName(task: task);
                  Navigator.pop(context);
                  ShowMessage.show(context, msg: 'Edit Success');
                }
              },
              color: Colors.white,
              child: const CustomText(
                text: 'Save',
                color: Colors.black,
              ),
            ),
            const VerticalSizedBox(16),
          ],
        ),
      ),
    );
  }
}
