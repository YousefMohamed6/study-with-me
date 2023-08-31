import 'package:hive_flutter/adapters.dart';
part 'image_model.g.dart';

@HiveType(typeId: 2)
class ImageModel extends HiveObject {
  @HiveField(0)
  final String imagePath;
  @HiveField(1)
  String imageName;
  ImageModel({required this.imagePath, required this.imageName});
}
