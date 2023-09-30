import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studytome/core/helper_widgets/custom_appbar.dart';
import 'package:studytome/features/book/data/cubit/book_cubit.dart';
import 'package:studytome/features/book/presentation/views/widgets/book__list_view.dart';
import 'package:studytome/features/home/data/cubit/home_cubit.dart';
import 'package:studytome/generated/l10n.dart';

class BookViewBody extends StatelessWidget {
  const BookViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          BlocBuilder<BookCubit, BookState>(
            builder: (context, state) {
              return CustomAppBar(
                onChanged: (input) {
                  BlocProvider.of<BookCubit>(context).searchBook(input: input);
                },
                title: S.of(context).book,
                //onpress SearchIcon show SearchView
                isTapSearch: BlocProvider.of<HomeCubit>(context).isTapSearch,
              );
            },
          ),
          BookListView(
            booksList: BlocProvider.of<BookCubit>(context).booksList,
          ),
        ],
      ),
    );
  }
}
