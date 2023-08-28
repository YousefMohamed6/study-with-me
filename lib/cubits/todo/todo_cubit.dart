import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'todo_state.dart';

class ToDoCubit extends Cubit<TodoState> {
  ToDoCubit() : super(TodoInitial());
}
