import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studytome/core/helper_widgets/custom_appbar.dart';
import 'package:studytome/features/note/data/note_cubit/note_cubit.dart';
import 'package:studytome/features/note/presentation/views/widgets/note_list_view.dart';

class NoteView extends StatelessWidget {
  const NoteView({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 16),
        CustomAppBar(
          title: 'Note',
          icon: const Icon(Icons.search),
          onPressed: () {},
        ),
        const SizedBox(height: 16),
        Expanded(
          child: NoteListView(
            notes: BlocProvider.of<NoteCubit>(context).notes,
          ),
        ),
      ],
    );
  }
}
