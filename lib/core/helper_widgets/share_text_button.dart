import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:studytome/core/helper_widgets/custom_button.dart';
import 'package:studytome/core/utils/show_message.dart';

class ShareTextButton extends StatelessWidget {
  const ShareTextButton({super.key, required this.text, required this.subject});
  final String text;
  final String subject;
  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onPressed: () async {
        if (text.isNotEmpty) {
          await Share.shareWithResult(
            text,
            subject: subject,
          );
        } else {
          ShowMessage.show(context, msg: 'Empty Text');
        }
      },
      child: const Icon(
        Icons.share_outlined,
      ),
    );
  }
}
