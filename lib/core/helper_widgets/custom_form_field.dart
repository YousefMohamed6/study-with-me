import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField({
    super.key,
    this.textInputType,
    this.lablelText,
    this.hintText,
    this.controller,
    this.onFieldSubmitted,
    this.onChanged,
    this.autovalidateMode,
    this.maxLine,
    this.suffixIcon,
  });
  final TextInputType? textInputType;
  final String? lablelText;
  final String? hintText;
  final TextEditingController? controller;
  final void Function(String)? onFieldSubmitted;
  final void Function(String)? onChanged;
  final AutovalidateMode? autovalidateMode;
  final int? maxLine;
  final Widget? suffixIcon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: TextFormField(
        maxLines: maxLine,
        autovalidateMode:
            autovalidateMode ?? AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          border: textFeildBorder(),
          enabledBorder: textFeildBorder(),
          focusedBorder: textFeildBorder(),
          labelText: lablelText,
          labelStyle: const TextStyle(fontSize: 16, color: Colors.white),
          hintText: hintText,
          hintStyle: const TextStyle(fontSize: 16, color: Colors.white),
          suffixIcon: suffixIcon,
        ),
        enabled: true,
        keyboardType: textInputType,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Empaty";
          }
          return null;
        },
        onFieldSubmitted: onFieldSubmitted,
        onChanged: onChanged,
        controller: controller,
        style: const TextStyle(color: Colors.white),
        cursorColor: Colors.white,
      ),
    );
  }
}

OutlineInputBorder textFeildBorder() {
  return const OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white),
    borderRadius: BorderRadius.all(
      Radius.circular(8),
    ),
  );
}
