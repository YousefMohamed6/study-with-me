import 'package:flutter/material.dart';
import 'package:studytome/features/book/data/model/book_model.dart';
import 'package:studytome/features/book/presentation/views/widgets/book__item.dart';

class BookListViewBody extends StatelessWidget {
  const BookListViewBody({super.key, required this.booksList});
  final List<BookModel> booksList;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        clipBehavior: Clip.antiAlias,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1,
          crossAxisSpacing: 1,
          mainAxisSpacing: 1,
        ),
        padding: EdgeInsets.zero,
        itemCount: booksList.length,
        itemBuilder: (context, index) => BookItem(
          book: booksList[index],
        ),
      ),
    );
  }
}
