import 'package:flutter/widgets.dart';
import 'package:noteapp/screens/books/model/book_model.dart';
import 'package:noteapp/screens/books/widgets/book__item.dart';

class BookListView extends StatelessWidget {
  const BookListView({super.key, required this.books});
  final List<BookModel> books;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      clipBehavior: Clip.antiAlias,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1,
        crossAxisSpacing: 1,
        mainAxisSpacing: 1,
      ),
      padding: EdgeInsets.zero,
      itemCount: books.length,
      itemBuilder: (context, index) => BookItem(
        book: books[index],
      ),
    );
  }
}
