import 'package:flutter/material.dart';
import 'package:studytome/core/const/images.dart';
import 'package:studytome/core/const/links.dart';
import 'package:studytome/features/contact_us/views/widgets/account_item.dart';

class OwnerAccounts extends StatelessWidget {
  const OwnerAccounts({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        AccountItem(
          accountUrl: kFaceBookUrl,
          accountLogo: kFacebookLogo,
        ),
        AccountItem(
          accountUrl: kYoutubeUrl,
          accountLogo: kYoutubeLogo,
          iconSize: 60,
        ),
        AccountItem(
          accountUrl: kLinkedinUrl,
          accountLogo: kLinkedinLogo,
        ),
        AccountItem(
          accountUrl: kGithubUrl,
          accountLogo: kGithubLogo,
        ),
      ],
    );
  }
}
