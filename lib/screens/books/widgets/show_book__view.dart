import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:noteapp/helper/show_message.dart';
import 'package:noteapp/helper_widgets/custom_text.dart';
import 'package:noteapp/screens/books/model/book_model.dart';
import 'package:noteapp/screens/home/cubit/home_cubit.dart';

class ShowPDFView extends StatefulWidget {
  final BookModel book;

  const ShowPDFView({
    Key? key,
    required this.book,
  }) : super(key: key);

  @override
  ShowPDFViewState createState() => ShowPDFViewState();
}

class ShowPDFViewState extends State<ShowPDFView> with WidgetsBindingObserver {
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
        leading: BackButton(
          color: Colors.white,
          onPressed: () {
            BlocProvider.of<HomeCubit>(context).changeIndex(0);
          },
        ),
        title: CustomText(text: widget.book.name),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {},
          ),
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
          errorMessage.isEmpty
              ? !isReady
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Container()
              : Center(
                  child: CustomText(text: errorMessage),
                ),
        ],
      ),
    );
  }
}
