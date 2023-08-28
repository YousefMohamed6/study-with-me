import 'package:flutter_bloc/flutter_bloc.dart';

part 'todo_state.dart';

class ToDoCubit extends Cubit<TodoState> {
  ToDoCubit() : super(TodoInitial());
}
