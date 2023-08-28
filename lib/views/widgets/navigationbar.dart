import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteapp/cubits/navigatorbar/navigatore_cubit.dart';
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
        BlocProvider.of<NavigationBarCubit>(context).chengeIndex(select);
      },
      items: const [
        BottomNavigationBarItem(
          activeIcon: Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: CustomText(
              text: 'Book',
              color: Colors.white,
            ),
          ),
          label: '',
          icon: Icon(
            Icons.menu_book,
          ),
        ),
        BottomNavigationBarItem(
          activeIcon: Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: CustomText(
              text: 'Files',
              color: Colors.white,
            ),
          ),
          label: '',
          icon: Icon(
            Icons.file_open,
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
