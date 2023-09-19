import 'package:flutter/material.dart';

class SearchFormField extends StatelessWidget {
  const SearchFormField({super.key, required this.onChanged});
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextFormField(
        decoration: const InputDecoration(
          hintText: 'Search',
          hintStyle: TextStyle(fontSize: 16, color: Colors.white),
          suffixIcon: Icon(Icons.search),
        ),
        style: const TextStyle(color: Colors.white),
        onChanged: onChanged,
      ),
    );
  }
}
