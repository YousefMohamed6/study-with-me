import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studytome/core/utils/show_message.dart';
import 'package:studytome/features/book/data/cubit/book_cubit.dart';
import 'package:studytome/features/book/data/model/book_model.dart';
import 'package:studytome/features/book/presentation/views/widgets/book_listview_body.dart';

class BookListView extends StatelessWidget {
  const BookListView({super.key, required this.booksList});
  final List<BookModel> booksList;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BookCubit, BookState>(
      listener: (context, state) {
        if (state is AddBookSuccess) {
          Navigator.pop(context);
          ShowMessage.show(context, msg: 'Add Success');
        } else if (state is AddBookFailure) {
          Navigator.pop(context);
          ShowMessage.show(context, msg: 'Faild,try again');
        }
        if (state is EditBookSuccess) {
          Navigator.pop(context);
          ShowMessage.show(context, msg: 'Edit Success');
        } else if (state is EditBookFailure) {
          Navigator.pop(context);
          ShowMessage.show(context, msg: 'Faild,try again');
        }
        if (state is UnSelectedBook) {
          ShowMessage.show(context, msg: 'Please Select Book');
        }
      },
      builder: (context, state) => BookListViewBody(
        booksList: booksList,
      ),
    );
  }
}
