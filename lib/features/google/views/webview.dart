import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studytome/core/helper_widgets/custom_text.dart';
import 'package:studytome/features/google/views/widgets/webview_body.dart';
import 'package:studytome/features/home/data/cubit/home_cubit.dart';

class WebViewApp extends StatefulWidget {
  const WebViewApp({super.key, required this.url});
  final String url;

  @override
  State<WebViewApp> createState() => _WebViewAppState();
}

class _WebViewAppState extends State<WebViewApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            BlocProvider.of<HomeCubit>(context).changeIndex(0);
          },
        ),
        centerTitle: true,
        title: const CustomText(text: 'google'),
      ),
      body: WebViewBody(
        url: widget.url,
      ),
    );
  }
}
