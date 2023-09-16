import 'package:flutter/material.dart';
import 'package:studytome/core/const/images.dart';

class PdfImage extends StatelessWidget {
  const PdfImage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Image(
      image: AssetImage(kPdfLogo),
    );
  }
}
