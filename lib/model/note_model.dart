import 'package:hive/hive.dart';
part 'note_model.g.dart';
//flutter packages pub run build_runner build 
//flutter dart run build_runner build 
@HiveType(typeId: 0)
class NoteModel extends HiveObject {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String contant;
  @HiveField(2)
  final String date;
  @HiveField(3)
  final int color;

  NoteModel({
    required this.color,
    required this.title,
    required this.contant,
    required this.date,
  });
  factory NoteModel.fromUsser(Map data) {
    return NoteModel(
      color: data['color'],
      contant: data['contant'],
      title: data['title'],
      date: data['date'],
    );
  }
}
