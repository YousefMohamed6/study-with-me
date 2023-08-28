import 'package:hive/hive.dart';
part 'todo_model.g.dart';

@HiveType(typeId: 1)
class ToDoModel extends HiveObject {
  @HiveField(0)
  final bool isComplete;
  @HiveField(1)
  final String taskNames;

  ToDoModel({
    required this.isComplete,
    required this.taskNames,
  });
}
