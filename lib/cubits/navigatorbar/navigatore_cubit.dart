import 'package:flutter_bloc/flutter_bloc.dart';

part 'navigatore_state.dart';

class NavigationBarCubit extends Cubit<NavigationBarState> {
  NavigationBarCubit() : super(Book());
  int _currentIndex = 0;
  get currentIndex => _currentIndex;
  void changeIndex(int select) {
    _currentIndex = select;
    if (select == 0) {
      emit(Book());
    } else if (select == 1) {
      emit(File());
    } else if (select == 2) {
      emit(Note());
    } else if (select == 3) {
      emit(ToDo());
    } else {
      emit(Youtube());
    }
  }

  void refresh() {
    emit(AddColors());
  }
}
