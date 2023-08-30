import 'package:flutter_bloc/flutter_bloc.dart';


part 'book_state.dart';

class BookCubit extends Cubit<BookState> {
  BookCubit() : super(BookInitial());
}
