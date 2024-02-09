import 'package:flutter/material.dart';
import 'package:studytome/core/helper_widgets/asset_image.dart';
import 'package:studytome/features/contact_us/views/widgets/url_lancher.dart';

class AccountItem extends StatelessWidget {
  const AccountItem(
      {super.key,
      required this.accountUrl,
      required this.accountLogo,
      this.iconSize,
      this.width,
      this.height});
  final String accountUrl;
  final String accountLogo;
  final double? iconSize;
  final double? width;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: CustomAssetImage(
        imagePath: accountLogo,
        width: width,
        height: height,
      ),
      iconSize: iconSize ?? 50,
      onPressed: () async {
        await urlLauncher(url: accountUrl);
      },
    );
  }
}
