import 'package:flutter/material.dart';
import 'package:noteapp/views/widgets/custom_icon_button.dart';
import 'package:noteapp/views/widgets/custom_text.dart';

class ToDoItem extends StatelessWidget {
  const ToDoItem({super.key, required this.title, required this.isComplete});
  final String title;
  final bool isComplete;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          const EdgeInsets.only(top: 24.0, bottom: 24.0, left: 24.0, right: 16),
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white.withOpacity(0.05),
      ),
      child: ListTile(
        onTap: () {},
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        leading: CustomIconButton(
          icon: Icon(
            isComplete ? Icons.check_box : Icons.check_box_outline_blank,
          ),
          onPressed: () {},
        ),
        title: CustomText(
          text: title,
          fontWeight: FontWeight.bold,
          decoration: isComplete ? TextDecoration.lineThrough : null,
        ),
        trailing: CustomIconButton(
          icon: const Icon(Icons.delete),
          onPressed: () {},
        ),
      ),
    );
  }
}
