import 'package:flutter/material.dart';
import 'package:noteapp/model/note_model.dart';
import 'package:noteapp/views/widgets/todo_item.dart';

class ListViewToDo extends StatelessWidget {
  const ListViewToDo({super.key, required this.list});
  final List<NoteModel> list;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: 5,
        itemBuilder: (context, index) => const ToDoItem(
          title: "Learn Now",
          isComplete: true,
        ),
      ),
    );
  }
}
