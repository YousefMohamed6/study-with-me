import 'package:flutter/widgets.dart';
import 'package:noteapp/screens/image/model/image_model.dart';
import 'package:noteapp/screens/image/widgets/image_item.dart';

class ImageListView extends StatelessWidget {
  const ImageListView({super.key, required this.images});
  final List<ImageModel> images;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      clipBehavior: Clip.hardEdge,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1,
        crossAxisSpacing: 1,
        mainAxisSpacing: 1,
      ),
      padding: EdgeInsets.zero,
      itemCount: images.length,
      itemBuilder: (context, index) => ImageItem(
        image: images[index],
      ),
    );
  }
}
