import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:studytome/core/helper_widgets/custom_icon_button.dart';

class ShareButton extends StatelessWidget {
  const ShareButton({super.key, required this.filePath});
  final String filePath;
  @override
  Widget build(BuildContext context) {
    return CustomIconButton(
      icon: const Icon(Icons.share),
      onPressed: () async {
        await Share.shareXFiles(
          [XFile(filePath)],
        );
      },
    );
  }
}
