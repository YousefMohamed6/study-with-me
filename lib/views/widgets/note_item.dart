import 'package:flutter/material.dart';
import 'package:noteapp/views/widgets/edit_view.dart';
import 'package:noteapp/views/widgets/custom_icon_button.dart';
import 'package:noteapp/views/widgets/custom_text.dart';

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
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, EditNote.id);
      },                                                                                                                                                                                                                                                       
      child: Container(
        padding: const EdgeInsets.only(
            top: 24.0, bottom: 24.0, left: 24.0, right: 16),
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
      ),
    );
  }
}
