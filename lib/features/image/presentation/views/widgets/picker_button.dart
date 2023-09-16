import 'package:flutter/material.dart';

class PickerButton extends StatelessWidget {
  const PickerButton({super.key, required this.onpressed, required this.icon});
  final VoidCallback onpressed;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onpressed,
      icon: Icon(
        icon,
        size: 40,
      ),
    );
  }
}
