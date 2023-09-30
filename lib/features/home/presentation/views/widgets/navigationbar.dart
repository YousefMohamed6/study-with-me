import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studytome/core/helper_widgets/custom_text.dart';
import 'package:studytome/features/home/data/cubit/home_cubit.dart';
import 'package:studytome/generated/l10n.dart';

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
      items: [
        BottomNavigationBarItem(
          activeIcon: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: CustomText(
              text: S.of(context).book,
            ),
          ),
          label: '',
          icon: const Icon(
            Icons.menu_book,
          ),
        ),
        BottomNavigationBarItem(
          activeIcon: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: CustomText(
              text: S.of(context).picture,
            ),
          ),
          label: '',
          icon: const Icon(
            Icons.image,
          ),
        ),
        BottomNavigationBarItem(
          activeIcon: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: CustomText(
              text: S.of(context).note,
            ),
          ),
          label: '',
          icon: const Icon(
            Icons.note_alt,
          ),
        ),
        BottomNavigationBarItem(
          activeIcon: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: CustomText(
              text: S.of(context).todo,
            ),
          ),
          label: '',
          icon: const Icon(
            Icons.checklist,
          ),
        ),
        const BottomNavigationBarItem(
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
            padding: const EdgeInsets.only(top: 8.0),
            child: CustomText(
              text: S.of(context).contactUs,
            ),
          ),
          label: '',
          icon: const Icon(
            Icons.support_agent_outlined,
          ),
        ),
      ],
    );
  }
}
