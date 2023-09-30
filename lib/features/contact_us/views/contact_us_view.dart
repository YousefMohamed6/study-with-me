import 'package:flutter/material.dart';
import 'package:studytome/core/const/images.dart';
import 'package:studytome/core/helper_widgets/avatar.dart';
import 'package:studytome/features/contact_us/views/widgets/language_button.dart';
import 'package:studytome/features/contact_us/views/widgets/owner_accounts.dart';
import 'package:studytome/features/contact_us/views/widgets/owner_data.dart';

class ContactUsView extends StatelessWidget {
  const ContactUsView({super.key});
  static String id = "ContactUsView";
  @override
  Widget build(context) {
    return ListView(
      children: const [
        SizedBox(height: 16),
        LanguageButton(),
        SizedBox(height: 72),
        Avatar(image: kOwnerLogo),
        SizedBox(height: 56),
        OwnerData(),
        SizedBox(height: 32),
        OwnerAccounts(),
      ],
    );
  }
}
