import 'package:flutter/material.dart';
import 'package:noteapp/views/widgets/bottom_shhet.dart';
import 'package:noteapp/views/widgets/custom_appbar.dart';
import 'package:noteapp/views/widgets/note_list_view.dart';
import 'package:noteapp/views/widgets/vertical_sizebox.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          ButtomSheet.build(context);
        },
      ),
      body: const Column(
        children: [
          CustomAppBar(
            title: 'Notes',
            icon: Icon(Icons.delete),
          ),
          VerticalSizedBox(8),
          ListViewNotes(),
        ],
      ),
    );
  }
}
