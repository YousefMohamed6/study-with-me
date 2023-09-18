import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studytome/core/helper_widgets/app_bar_title.dart';
import 'package:studytome/core/helper_widgets/search_icon.dart';
import 'package:studytome/features/home/data/cubit/home_cubit.dart';

class IntialAppBarView extends StatelessWidget {
  const IntialAppBarView({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppBarTitle(title: title),
        SearchIcon(
          onPressed: () {
            BlocProvider.of<HomeCubit>(context).showSearchView();
          },
        ),
      ],
    );
  }
}
