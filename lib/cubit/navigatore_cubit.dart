import 'package:flutter_bloc/flutter_bloc.dart';

part 'navigatore_state.dart';

class NavigatoreCubit extends Cubit<NavigatoreState> {
  NavigatoreCubit() : super(NavigatoreInitial());
  int _currentIndex = 0;
  get currentIndex => _currentIndex;
  void chengeIndex(int select) {
    _currentIndex = select;
    emit(NavigatoreInitial());
  }
}
