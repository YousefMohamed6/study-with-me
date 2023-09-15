import 'package:flutter/widgets.dart';
import 'package:studytome/features/image/data/model/image_model.dart';
import 'package:studytome/features/image/presentation/views/widgets/image_item.dart';

class ImageListView extends StatelessWidget {
  const ImageListView({super.key, required this.images});
  final List<ImageModel> images;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      clipBehavior: Clip.antiAlias,
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
