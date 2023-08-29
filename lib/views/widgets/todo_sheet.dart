import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteapp/cubits/todo/todo_cubit.dart';
import 'package:noteapp/helper/show_message.dart';
import 'package:noteapp/views/widgets/custom_button.dart';
import 'package:noteapp/views/widgets/custom_form_field.dart';
import 'package:noteapp/views/widgets/custom_text.dart';
import 'package:noteapp/views/widgets/vertical_sizebox.dart';

class ToDoSheet extends StatelessWidget {
  const ToDoSheet({super.key, required this.taskCtrl, required this.formKey});
  final TextEditingController taskCtrl;
  final GlobalKey<FormState> formKey;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ToDoCubit, ToDoState>(
      listener: (context, state) {
        if (state is AddTaskSuccess) {
          ShowMessage.show(context, msg: 'Success');
          Navigator.pop(context);
        }
        if (state is AddTaskFailed) {
          ShowMessage.show(context, msg: state.errMessage);
        }
      },
      builder: (context, state) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Form(
                key: formKey,
                child: CustomFormField(
                  controller: taskCtrl,
                  hintText: 'Enter your Task',
                  maxLine: 1,
                ),
              ),
              const VerticalSizedBox(16),
              CustomButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
<<<<<<< HEAD
                       formKey.currentState!.save();
=======
>>>>>>> dc1833ce2324b726344686853a23dcdc368addf7
                    BlocProvider.of<ToDoCubit>(context).addTask();
                  }
                },
                color: Colors.white,
                child: const CustomText(
                  text: 'add',
                  color: Colors.black,
                ),
              ),
              const VerticalSizedBox(16),
            ],
          ),
        );
      },
    );
  }
}
