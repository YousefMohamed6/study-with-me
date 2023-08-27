import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteapp/cubit/navigatore_cubit.dart';
import 'package:noteapp/views/widgets/custom_text.dart';

class CustombottomBar extends StatelessWidget {
  const CustombottomBar({super.key, required this.currentIndex});
  final int currentIndex;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      iconSize: 24,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey.shade50,
      currentIndex: currentIndex,
      onTap: (select) {
        BlocProvider.of<NavigatoreCubit>(context).chengeIndex(select);
      },
      items: const [
        BottomNavigationBarItem(
          activeIcon: Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: CustomText(
              text: 'Home',
              color: Colors.white,
            ),
          ),
          label: '',
          icon: Icon(
            Icons.home,
          ),
        ),
        BottomNavigationBarItem(
          activeIcon: Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: CustomText(
              text: 'Pdf',
              color: Colors.white,
            ),
          ),
          label: '',
          icon: Icon(
            Icons.picture_as_pdf,
          ),
        ),
        BottomNavigationBarItem(
          activeIcon: Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: CustomText(
              text: 'Note',
              color: Colors.white,
            ),
          ),
          label: '',
          icon: Icon(
            Icons.note_add,
          ),
        ),
        BottomNavigationBarItem(
          activeIcon: Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: CustomText(
              text: 'ToDo',
              color: Colors.white,
            ),
          ),
          label: '',
          icon: Icon(
            Icons.import_export,
          ),
        ),
      ],
    );
  }
}
