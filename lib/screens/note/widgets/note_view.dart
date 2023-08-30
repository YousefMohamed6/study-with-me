import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteapp/helper_widgets/vertical_sizebox.dart';
import 'package:noteapp/screens/note/note_cubit/note_cubit.dart';
import 'package:noteapp/screens/note/widgets/note_list_view.dart';
import 'package:noteapp/helper/helper_widgets/custom_appbar.dart';

class NoteView extends StatelessWidget {
  const NoteView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const VerticalSizedBox(16),
          CustomAppBar(
            title: 'Notes',
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          const VerticalSizedBox(16),
          Expanded(
            child: ListViewNotes(
              notes: BlocProvider.of<NoteCubit>(context).notes,
            ),
          ),
        ],
      ),
    );
  }
}
