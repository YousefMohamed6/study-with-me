import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studytome/features/contact_us/views/widgets/language_menu.dart';
import 'package:studytome/features/home/data/cubit/home_cubit.dart';

class LanguageButton extends StatelessWidget {
  const LanguageButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return const Padding(
          padding: EdgeInsets.only(right: 16.0),
          child: Align(
            alignment: Alignment.topRight,
            child: LanguageMenu(),
          ),
        );
      },
    );
  }
}
