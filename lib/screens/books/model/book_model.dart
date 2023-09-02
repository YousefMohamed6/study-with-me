import 'package:hive_flutter/adapters.dart';
part 'book_model.g.dart';

@HiveType(typeId: 3)
class BookModel extends HiveObject{
  @HiveField(0)
  String name;
  @HiveField(1)
  String path;
  BookModel({required this.name, required this.path});
}
