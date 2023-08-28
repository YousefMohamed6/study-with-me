import 'package:flutter/material.dart';
import 'package:noteapp/model/note_model.dart';
import 'package:noteapp/views/widgets/note_item.dart';

class ListViewNotes extends StatelessWidget {
  const ListViewNotes({super.key, required this.list});
  final List<NoteModel> list;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: list.length,
        itemBuilder: (context, index) => NoteItem(
          color: Colors.lightGreen,
          title: list[index].title,
          content: list[index].content,
          time: list[index].date,
        ),
      ),
    );
  }
}
