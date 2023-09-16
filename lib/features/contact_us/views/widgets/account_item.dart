import 'package:flutter/material.dart';
import 'package:studytome/core/helper_widgets/asset_image.dart';
import 'package:studytome/core/helper_widgets/custom_icon_button.dart';
import 'package:studytome/features/contact_us/views/widgets/url_lancher.dart';

class AccountItem extends StatelessWidget {
  const AccountItem(
      {super.key, required this.accountUrl, required this.accountLogo});
  final String accountUrl;
  final String accountLogo;
  @override
  Widget build(BuildContext context) {
    return CustomIconButton(
      icon: CustomAssetImage(imagePath: accountLogo),
      iconSize: 50,
      onPressed: () async {
        await urlLauncher(url: accountUrl);
      },
    );
  }
}
