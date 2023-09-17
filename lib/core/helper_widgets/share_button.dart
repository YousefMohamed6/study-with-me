import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class ShareButton extends StatelessWidget {
  const ShareButton({super.key, required this.filePath});
  final String filePath;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.share),
      onPressed: () async {
        await Share.shareXFiles(
          [
            XFile(filePath),
          ],
        );
      },
    );
  }
}
