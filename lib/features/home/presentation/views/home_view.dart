import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studytome/core/const/links.dart';
import 'package:studytome/features/book/presentation/views/widgets/show_book__view.dart';
import 'package:studytome/features/google/views/webview.dart';
import 'package:studytome/features/home/data/cubit/home_cubit.dart';
import 'package:studytome/features/home/presentation/views/widgets/navigation_view.dart';
import 'package:studytome/features/image/presentation/views/show_image_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is ShowBook) {
          return ShowBookView(book: state.book);
        } else if (state is ShowImage) {
          return ShowImageView(image: state.image);
        } else if (state is Google) {
          return const WebViewApp(url: kWebViewUrl);
        } else {
          return NavigationView(state: state);
        }
      },
    );
  }
}
