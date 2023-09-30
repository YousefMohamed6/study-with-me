import 'package:flutter/material.dart';
import 'package:studytome/generated/l10n.dart';

class LanguageText extends StatelessWidget {
  const LanguageText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          S.of(context).language,
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
        const Icon(
          Icons.keyboard_arrow_down_outlined,
        ),
      ],
    );
  }
}
