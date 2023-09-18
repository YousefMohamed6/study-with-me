import 'package:flutter/material.dart';
import 'package:studytome/core/helper_widgets/custom_form_field.dart';

class SearchFormField extends StatelessWidget {
  const SearchFormField({super.key, required this.onChanged});
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomFormField(
        autovalidateMode: AutovalidateMode.disabled,
        hintText: 'Search',
        suffixIcon: const Icon(Icons.search),
        onChanged: onChanged,
      ),
    );
  }
}
