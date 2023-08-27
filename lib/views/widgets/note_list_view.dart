import 'package:flutter/material.dart';
import 'package:noteapp/views/widgets/note_item.dart';

class ListViewNotes extends StatelessWidget {
  const ListViewNotes({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: 10,
        itemBuilder: (context, index) => const NoteItem(
          color: Colors.lightGreen,
          title: 'flutter Tibs',
          content: 'my name is yousef iam flutter devolper',
          time: '2023-8-26',
        ),
      ),
    );
  }
}
