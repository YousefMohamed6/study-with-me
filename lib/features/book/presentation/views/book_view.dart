import 'package:flutter/material.dart';
import 'package:studytome/features/book/presentation/views/widgets/book_view_body.dart';

class BookView extends StatelessWidget {
  const BookView({super.key});
  static String id = 'BookView';
  @override
  Widget build(BuildContext context) {
    return const BookViewBody();
  }
}
