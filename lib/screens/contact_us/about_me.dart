import 'package:flutter/material.dart';
import 'package:noteapp/const/images.dart';
import 'package:noteapp/const/links.dart';
import 'package:noteapp/const/text.dart';
import 'package:noteapp/helper_widgets/asset_image.dart';
import 'package:noteapp/helper_widgets/avatar.dart';
import 'package:noteapp/helper_widgets/custom_icon_button.dart';
import 'package:noteapp/screens/contact_us/custom_row.dart';
import 'package:noteapp/helper_widgets/custom_text.dart';
import 'package:noteapp/screens/contact_us/url_lancher.dart';
import 'package:noteapp/helper_widgets/vertical_sizebox.dart';

class AboutMeView extends StatelessWidget {
  const AboutMeView({super.key});
  static String id = "HomePage";
  @override
  Widget build(context) {
    return ListView(
      children: [
        const VerticalSizedBox(84),
        const Avatar(image: kAppLogo),
        const VerticalSizedBox(56),
        const CustomText(
          text: kTeacherName,
          textAlign: TextAlign.center,
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        const VerticalSizedBox(16),
        const CustomText(
          text: kTeacherJob,
          textAlign: TextAlign.center,
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        const VerticalSizedBox(5),
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
        const VerticalSizedBox(32),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomIconButton(
              icon: const CustomAssetImage(imagePath: kFacebookLogo),
              iconSize: 60,
              onPressed: () async {
                await urlLauncher(url: kFaceBookUrl);
              },
            ),
            CustomIconButton(
              icon: const CustomAssetImage(imagePath: kYoutubeLogo),
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
