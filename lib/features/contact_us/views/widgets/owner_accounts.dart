import 'package:flutter/material.dart';
import 'package:studytome/core/const/images.dart';
import 'package:studytome/core/const/links.dart';
import 'package:studytome/features/contact_us/views/widgets/account_item.dart';

class OwnerAccounts extends StatelessWidget {
  const OwnerAccounts({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        AccountItem(
          accountUrl: kFaceBookUrl,
          accountLogo: kFacebookLogo,
          height: MediaQuery.sizeOf(context).height * 0.085,
          width: MediaQuery.sizeOf(context).height * 0.085,
        ),
        AccountItem(
          accountUrl: kYoutubeUrl,
          accountLogo: kYoutubeLogo,
          height: MediaQuery.sizeOf(context).height * 0.060,
          width: MediaQuery.sizeOf(context).height * 0.060,
        ),
        AccountItem(
          accountUrl: kLinkedinUrl,
          accountLogo: kLinkedinLogo,
          height: MediaQuery.sizeOf(context).height * 0.060,
          width: MediaQuery.sizeOf(context).height * 0.060,
        ),
        AccountItem(
          accountUrl: kGithubUrl,
          accountLogo: kGithubLogo,
          height: MediaQuery.sizeOf(context).height * 0.060,
          width: MediaQuery.sizeOf(context).height * 0.060,
        ),
      ],
    );
  }
}
