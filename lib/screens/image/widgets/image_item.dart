import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:noteapp/helper_widgets/custom_text.dart';

class ImageItem extends StatelessWidget {
  const ImageItem({super.key, required this.file});
  final File file;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.file(
            file,
            width: 200,
            height: 100,
            fit: BoxFit.contain,
          ),
          CustomText(text: file.path),
        ],
      ),
    );
  }
}
