import 'package:flutter/material.dart';
import 'package:studytome/core/const/images.dart';
import 'package:studytome/core/const/links.dart';
import 'package:studytome/core/const/text.dart';
import 'package:studytome/core/helper_widgets/asset_image.dart';
import 'package:studytome/core/helper_widgets/avatar.dart';
import 'package:studytome/core/helper_widgets/custom_icon_button.dart';
import 'package:studytome/core/helper_widgets/custom_text.dart';
import 'package:studytome/features/contact_us/views/widgets/custom_row.dart';
import 'package:studytome/features/contact_us/views/widgets/url_lancher.dart';

class AboutMeView extends StatelessWidget {
  const AboutMeView({super.key});
  static String id = "HomePage";
  @override
  Widget build(context) {
    return ListView(
      children: [
        const SizedBox(height: 84),
        const Avatar(image: kAppLogo),
        const SizedBox(height: 56),
        const CustomText(
          text: kTeacherName,
          textAlign: TextAlign.center,
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        const SizedBox(height: 16),
        const CustomText(
          text: kTeacherJob,
          textAlign: TextAlign.center,
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        const SizedBox(height: 5),
        CustomRow(
          mainAxisAlignment: MainAxisAlignment.center,
          text: "Phone Number : ",
          textButton: kPhone,
          onPressed: () async {
            await urlLauncher(url: 'tel:$kPhone');
          },
        ),
        CustomRow(
          mainAxisAlignment: MainAxisAlignment.center,
          text: "Email Address : ",
          textButton: kEmail,
          onPressed: () async {
            await urlLauncher(url: 'mailto:$kEmail?subject=$kEmailSubject');
          },
        ),
        const SizedBox(height: 32),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomIconButton(
              icon: const CustomAssetImage(imagePath: kFacebookLogo),
              iconSize: 50,
              onPressed: () async {
                await urlLauncher(url: kFaceBookUrl);
              },
            ),
            CustomIconButton(
              icon: const CustomAssetImage(
                imagePath: kYoutubeLogo,
                height: 60,
              ),
              iconSize: 60,
              onPressed: () async {
                await urlLauncher(url: kYoutubeUrl);
              },
            ),
            CustomIconButton(
              icon: const CustomAssetImage(imagePath: kLinkedinLogo),
              iconSize: 50,
              onPressed: () async {
                await urlLauncher(url: kLinkedinUrl);
              },
            ),
            CustomIconButton(
              icon: const CustomAssetImage(imagePath: kGithubLogo),
              iconSize: 50,
              onPressed: () async {
                await urlLauncher(url: kGithubUrl);
              },
            ),
          ],
        ),
      ],
    );
  }
}
