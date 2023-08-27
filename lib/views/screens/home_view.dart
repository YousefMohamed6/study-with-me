import 'package:flutter/material.dart';
import 'package:noteapp/views/screens/sheet_note.dart';
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
          var contentCtrl = TextEditingController();
          var titleCtrl = TextEditingController();
          showModalBottomSheet(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            isScrollControlled: true,
            context: context,
            builder: (context) => SheetNote(
              titleCtrl: titleCtrl,
              contentCtrl: contentCtrl,
            ),
          );
        },
      ),
      body: Column(
        children: [
          CustomAppBar(
            title: 'Notes',
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          const VerticalSizedBox(8),   
          const ListViewNotes(),
        ],
      ),
    );
  }
}
