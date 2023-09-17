import 'package:hive/hive.dart';
part 'todo_model.g.dart';

@HiveType(typeId: 1)
class ToDoModel extends HiveObject {
  @HiveField(0)
  bool isComplete;
  @HiveField(1)
  String taskName;
  @HiveField(2)
  int color;
  ToDoModel({
    required this.isComplete,
    required this.taskName,
    required this.color,
  });
}
