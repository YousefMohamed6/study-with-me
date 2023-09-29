import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.minWidth,
    this.height,
  });
  final VoidCallback onPressed;
  final Widget child;
  final double? minWidth;
  final double? height;
  @override
  Widget build(context) {
    return MaterialButton(
      onPressed: onPressed,
      height: height ?? 50,
      color: Colors.white.withOpacity(0.25),
      elevation: 0,
      child: child,
    );
  }
}
