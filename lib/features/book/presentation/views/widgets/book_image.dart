import 'package:flutter/material.dart';
import 'package:studytome/core/const/images.dart';

class BookImage extends StatelessWidget {
  const BookImage({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white.withOpacity(0.05),
        image: const DecorationImage(
          image: AssetImage(kPdfLogo),
          fit: BoxFit.fill,
        ),
      ),
      child: child,
    );
  }
}
