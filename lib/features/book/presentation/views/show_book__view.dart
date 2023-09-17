import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:studytome/core/helper_widgets/custom_back_button.dart';
import 'package:studytome/core/helper_widgets/custom_text.dart';
import 'package:studytome/core/helper_widgets/share_button.dart';
import 'package:studytome/core/utils/show_message.dart';
import 'package:studytome/features/book/data/model/book_model.dart';
import 'package:studytome/features/home/data/cubit/home_cubit.dart';

class ShowBookView extends StatefulWidget {
  final BookModel book;

  const ShowBookView({Key? key, required this.book}) : super(key: key);

  @override
  ShowBookViewState createState() => ShowBookViewState();
}

class ShowBookViewState extends State<ShowBookView>
    with WidgetsBindingObserver {
  final Completer<PDFViewController> _controller =
      Completer<PDFViewController>();
  int? pages = 0;
  int? currentPage = 0;
  bool isReady = false;
  String errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CustomBackButton(
          onPressed: () {
            BlocProvider.of<HomeCubit>(context).changeIndex(0);
          },
        ),
        centerTitle: true,
        title: CustomText(text: widget.book.name),
        actions: [
          ShareButton(filePath: widget.book.path),
        ],
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PDFView(
            filePath: widget.book.path,
            enableSwipe: true,
            swipeHorizontal: false,
            autoSpacing: true,
            pageFling: true,
            pageSnap: true,
            defaultPage: currentPage!,
            fitPolicy: FitPolicy.BOTH,
            preventLinkNavigation: false,
            onRender: (pages) {
              setState(() {
                pages = pages;
                isReady = true;
              });
            },
            onError: (error) {
              setState(() {
                errorMessage = error.toString();
              });
              ShowMessage.show(context, msg: errorMessage);
            },
            onPageError: (page, error) {
              setState(() {
                errorMessage = '$page: ${error.toString()}';
              });
              ShowMessage.show(context, msg: errorMessage);
            },
            onViewCreated: (PDFViewController pdfViewController) {
              _controller.complete(pdfViewController);
            },
            onPageChanged: (int? page, int? total) {
              setState(() {
                currentPage = page;
              });
            },
          ),
          !isReady
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Center(
                  child: CustomText(
                    text: errorMessage,
                  ),
                ),
        ],
      ),
    );
  }
}
