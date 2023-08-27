import 'package:flutter/material.dart';
import 'package:noteapp/views/screens/sheet_note.dart';

class ButtomSheet {
  static var titleCtrl = TextEditingController();
  static var contentCtrl = TextEditingController();
  static Future<Widget> build(BuildContext context) async {
    return await showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      isScrollControlled: true,
      context: context,
      builder: (context) => SheetNote(
        titController: titleCtrl,
        subController: contentCtrl,
      ),
    );
  }
}
