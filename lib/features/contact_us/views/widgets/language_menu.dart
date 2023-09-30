import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studytome/features/contact_us/views/widgets/language_text.dart';
import 'package:studytome/features/home/data/cubit/home_cubit.dart';
import 'package:studytome/generated/l10n.dart';

class LanguageMenu extends StatelessWidget {
  const LanguageMenu({super.key});
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: (context) => [
        PopupMenuItem(
          value: 'ar',
          child: Text(S.of(context).ar),
        ),
        PopupMenuItem(
          value: 'en',
          child: Text(S.of(context).en),
        ),
      ],
      onSelected: (value) {
        BlocProvider.of<HomeCubit>(context).changeLanguage();
      },
      child: const LanguageText(),
    );
  }
}
