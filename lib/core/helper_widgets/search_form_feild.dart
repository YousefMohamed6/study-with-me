import 'package:flutter/material.dart';
import 'package:studytome/generated/l10n.dart';

class SearchFormField extends StatelessWidget {
  const SearchFormField({super.key, required this.onChanged});
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextFormField(
        decoration: InputDecoration(
          hintText: S.of(context).search,
          hintStyle: const TextStyle(fontSize: 16, color: Colors.white),
          suffixIcon: const Icon(Icons.search),
        ),
        style: const TextStyle(color: Colors.white),
        onChanged: onChanged,
      ),
    );
  }
}
