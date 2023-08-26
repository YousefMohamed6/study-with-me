import 'package:flutter/material.dart';
import 'package:noteapp/views/widgets/custom_button.dart';
import 'package:noteapp/views/widgets/custom_form_field.dart';
import 'package:noteapp/views/widgets/custom_icon_button.dart';
import 'package:noteapp/views/widgets/custom_text.dart';
import 'package:noteapp/views/widgets/vertical_sizebox.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          var tcontroller = TextEditingController();
          var contentCtrl = TextEditingController();
          showModalBottomSheet(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            isScrollControlled: true,
            context: context,
            builder: (context) => SheetNote(
              titController: tcontroller,
              subController: contentCtrl,
            ),
          );
        },
      ),
      body: const Column(
        children: [
          CustomAppBar(),
          VerticalSizedBox(8),
          ListViewNotes(),
        ],
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24, right: 24, left: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const CustomText(
            text: 'Notes',
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
          Container(
            margin: const EdgeInsets.only(top: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.grey.withOpacity(.05),
            ),
            child: CustomIconButton(
              icon: const Icon(
                Icons.search,
              ),
              iconSize: 32,
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}

class NoteItem extends StatelessWidget {
  const NoteItem({
    super.key,
    required this.color,
    required this.title,
    required this.content,
    required this.time,
  });
  final Color color;
  final String title;
  final String content;
  final String time;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          const EdgeInsets.only(top: 24.0, bottom: 24.0, left: 24.0, right: 16),
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: color,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ListTile(
            title: CustomText(
              text: title.toUpperCase(),
              fontWeight: FontWeight.bold,
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: CustomText(
                text: content,
                fontWeight: FontWeight.bold,
              ),
            ),
            trailing: CustomIconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {},
            ),
          ),
          CustomText(
            text: time,
          ),
        ],
      ),
    );
  }
}

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

class SheetNote extends StatelessWidget {
  const SheetNote(
      {super.key, required this.titController, required this.subController});
  final TextEditingController titController;
  final TextEditingController subController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomFormField(
            controller: titController,
            lablelText: 'Title',
          ),
          CustomFormField(
            controller: subController,
            lablelText: 'Content',
            maxLine: 10,
          ),
          const VerticalSizedBox(24),
          CustomButton(
            onPressed: () {
              Navigator.pop(context);
            },
            color: Colors.white,
            child: const CustomText(text: 'Save', color: Colors.black),
          ),
        ],
      ),
    );
  }
}
