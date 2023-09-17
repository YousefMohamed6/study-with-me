import 'package:flutter/material.dart';

class ToDoBackground extends StatelessWidget {
  const ToDoBackground({super.key, required this.color, required this.child});
  final int color;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          const EdgeInsets.only(top: 24.0, bottom: 24.0, left: 24.0, right: 16),
      margin: const EdgeInsets.only(bottom: 8, right: 8, left: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Color(color),
      ),
      child: child,
    );
  }
}
