import 'package:flutter/material.dart';
import 'package:studytome/features/image/data/model/image_model.dart';
import 'package:studytome/features/image/presentation/views/widgets/image_item.dart';

class ImageListViewBody extends StatelessWidget {
  const ImageListViewBody({super.key, required this.imagesList});
  final List<ImageModel> imagesList;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1,
          crossAxisSpacing: 1,
          mainAxisSpacing: 1,
        ),
        padding: EdgeInsets.zero,
        itemCount: imagesList.length,
        itemBuilder: (context, index) => ImageItem(
          image: imagesList[index],
        ),
      ),
    );
  }
}
