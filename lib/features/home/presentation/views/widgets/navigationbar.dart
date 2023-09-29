import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studytome/core/helper_widgets/custom_text.dart';
import 'package:studytome/features/home/data/cubit/home_cubit.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({super.key, required this.currentIndex});
  final int currentIndex;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.shifting,
      iconSize: 24,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.white,
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
              text: 'Picture',
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
              text: 'google',
            ),
          ),
          label: '',
          icon: Icon(
            Icons.search_outlined,
          ),
        ),
        BottomNavigationBarItem(
          activeIcon: Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: CustomText(
              text: 'Contact Us',
            ),
          ),
          label: '',
          icon: Icon(
            Icons.support_agent_outlined,
          ),
        ),
      ],
    );
  }
}
