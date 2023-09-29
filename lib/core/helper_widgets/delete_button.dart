import 'package:flutter/material.dart';

class DeleteButton extends StatelessWidget {
  const DeleteButton({super.key, required this.onPressed, this.color});
  final VoidCallback onPressed;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(
        Icons.delete,
        size: 32,
        color: color ?? Colors.white,
      ),
    );
  }
}
