import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studytome/core/helper_widgets/custom_back_button.dart';
import 'package:studytome/core/helper_widgets/search_form_feild.dart';
import 'package:studytome/features/home/data/cubit/home_cubit.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomBackButton(onPressed: () {
          BlocProvider.of<HomeCubit>(context).showInitialAppBar();
        }),
        SearchFormField(onChanged: (input) {}),
      ],
    );
  }
}
