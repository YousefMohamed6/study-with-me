import 'package:flutter/material.dart';
import 'package:studytome/core/const/text.dart';
import 'package:studytome/core/helper_widgets/custom_text.dart';
import 'package:studytome/features/contact_us/views/widgets/custom_row.dart';
import 'package:studytome/features/contact_us/views/widgets/url_lancher.dart';
import 'package:studytome/generated/l10n.dart';

class OwnerData extends StatelessWidget {
  const OwnerData({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomText(
          text: S.of(context).name,
          textAlign: TextAlign.center,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        const SizedBox(height: 16),
        CustomText(
          text: S.of(context).jop,
          textAlign: TextAlign.center,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
        const SizedBox(height: 5),
        CustomRow(
          mainAxisAlignment: MainAxisAlignment.center,
          text: S.of(context).phone,
          textButton: kPhone,
          onPressed: () async {
            await urlLauncher(url: 'tel:$kPhone');
          },
        ),
        CustomRow(
          mainAxisAlignment: MainAxisAlignment.center,
          text: S.of(context).email,
          textButton: kEmail,
          onPressed: () async {
            await urlLauncher(url: 'mailto:$kEmail?subject=$kEmailSubject');
          },
        ),
      ],
    );
  }
}
