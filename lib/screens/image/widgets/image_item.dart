import 'package:flutter/widgets.dart';
import 'package:noteapp/helper_widgets/custom_text.dart';

class ImageItem extends StatelessWidget {
  const ImageItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/avater.png',
            width: 200,
            height: 100,
            fit: BoxFit.contain,
          ),
          const CustomText(text: 'Avater'),
        ],
      ),
    );
  }
}
