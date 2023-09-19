import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studytome/core/helper_widgets/custom_appbar.dart';
import 'package:studytome/features/home/data/cubit/home_cubit.dart';
import 'package:studytome/features/note/data/note_cubit/note_cubit.dart';
import 'package:studytome/features/note/presentation/views/widgets/note_list_view.dart';

class NoteViewBody extends StatelessWidget {
  const NoteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          BlocBuilder<NoteCubit, NoteState>(
            builder: (context, state) {
              return CustomAppBar(
                title: 'Note',
                isTapSearch: BlocProvider.of<HomeCubit>(context).isTapSearch,
              );
            },
          ),
          const SizedBox(height: 16),
          NoteListView(
            notesList: BlocProvider.of<NoteCubit>(context).notesList,
          ),
        ],
      ),
    );
  }
}
