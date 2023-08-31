import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:noteapp/helper/helper_widgets/custom_text_button.dart';
import 'package:noteapp/helper_widgets/custom_text.dart';
import 'package:noteapp/screens/note/note_cubit/note_cubit.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(Book());
  int _currentIndex = 0;
  get currentIndex => _currentIndex;
  void changeIndex(int select) {
    _currentIndex = select;
    if (select == 0) {
      emit(Book());
    } else if (select == 1) {
      emit(Images());
    } else if (select == 2) {
      emit(Note());
    } else if (select == 3) {
      emit(ToDo());
    } else {
      emit(Youtube());
    }
  }

  showAlertDialog({
    required BuildContext context,
    required Function() ok,
  }) {
    Widget cancelButton = CustomTextButton(
      text: 'Cancel',
      onPressed: () {
        Navigator.pop(context);
      },
    );
    Widget continueButton = CustomTextButton(
      text: "Ok",
      onPressed: () {
        ok();
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

  void showBottomSheet({required Widget builder, required context}) async {
    await showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        isScrollControlled: true,
        context: context,
        builder: (context) => builder);
  }

  Widget colorPicker() {
    List<int> colors = [
      Colors.lightGreen.value,
      Colors.lightBlue.value,
      Colors.orange.shade300.value,
      Colors.red.shade300.value,
      Colors.grey.value,
    ];
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: SizedBox(
        height: 40,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: const ScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          itemCount: colors.length,
          itemBuilder: (context, index) => MaterialButton(
            onPressed: () {
              BlocProvider.of<NoteCubit>(context).color = colors[index];
            },
            shape: const CircleBorder(),
            color: Color(colors[index]),
            child: const SizedBox(width: 16, height: 16),
          ),
        ),
      ),
    );
  }
}
