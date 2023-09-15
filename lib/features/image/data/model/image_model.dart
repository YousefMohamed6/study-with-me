import 'package:hive_flutter/adapters.dart';
part 'image_model.g.dart';

@HiveType(typeId: 2)
class ImageModel extends HiveObject {
  @HiveField(0)
  String path;
  @HiveField(1)
  String name;
  ImageModel({required this.path, required this.name});
}
