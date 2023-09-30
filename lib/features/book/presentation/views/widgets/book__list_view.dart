import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studytome/core/utils/show_message.dart';
import 'package:studytome/features/book/data/cubit/book_cubit.dart';
import 'package:studytome/features/book/data/model/book_model.dart';
import 'package:studytome/features/book/presentation/views/widgets/book_listview_body.dart';
import 'package:studytome/generated/l10n.dart';

class BookListView extends StatelessWidget {
  const BookListView({super.key, required this.booksList});
  final List<BookModel> booksList;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BookCubit, BookState>(
      listener: (context, state) {
        if (state is AddBookSuccess) {
          Navigator.pop(context);
          ShowMessage.show(context, msg: S.of(context).addSuccess);
        } else if (state is AddBookFailure) {
          Navigator.pop(context);
          ShowMessage.show(context, msg: S.of(context).addSuccess);
        }
        if (state is EditBookSuccess) {
          Navigator.pop(context);
          ShowMessage.show(context, msg: S.of(context).editSuccess);
        }
        if (state is UnSelectedBook) {
          ShowMessage.show(context, msg: S.of(context).usSelectedBook);
        }
      },
      builder: (context, state) {
        if (state is BookSearch) {
          return BookListViewBody(
            booksList: state.booksList,
          );
        } else {
          return BookListViewBody(
            booksList: booksList,
          );
        }
      },
    );
  }
}
