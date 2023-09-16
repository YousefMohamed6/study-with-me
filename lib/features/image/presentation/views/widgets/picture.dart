import 'dart:io';

import 'package:flutter/material.dart';

class Picture extends StatelessWidget {
  const Picture({super.key, required this.child, required this.imagePath});
  final Widget child;
  final String imagePath;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white.withOpacity(0.05),
        image: DecorationImage(
          image: FileImage(
            File(imagePath),
          ),
          fit: BoxFit.fill,
        ),
      ),
      child: child,
    );
  }
}
