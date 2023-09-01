import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteapp/helper_widgets/custom_text.dart';
import 'package:noteapp/screens/home/cubit/home_cubit.dart';

class CustombottomBar extends StatelessWidget {
  const CustombottomBar({super.key, required this.currentIndex});
  final int currentIndex;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.shifting,
      iconSize: 24,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey.shade50,
      currentIndex: currentIndex,
      onTap: (select) {
        BlocProvider.of<HomeCubit>(context).changeIndex(select);
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
              text: 'Image',
              color: Colors.white,
            ),
          ),
          label: '',
          icon: Icon(
            Icons.image,
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
            Icons.note_alt,
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
            Icons.checklist,
          ),
        ),
        BottomNavigationBarItem(
          activeIcon: Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: CustomText(
              text: 'Youtube',
              color: Colors.white,
            ),
          ),
          label: '',
          icon: Icon(
            Icons.video_collection_outlined,
          ),
        ),  BottomNavigationBarItem(
          activeIcon: Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: CustomText(
              text: 'Contact Us',
              color: Colors.white,
            ),
          ),
          label: '',
          icon: Icon(
            Icons.support_agent_outlined ,
          ),
        ),
      ],
    );
  }
}
