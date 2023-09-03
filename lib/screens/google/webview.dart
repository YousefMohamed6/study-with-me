import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteapp/helper_widgets/custom_text.dart';
import 'package:noteapp/screens/home/cubit/home_cubit.dart';

class WebViewApp extends StatefulWidget {
  const WebViewApp({super.key, required this.url});
  final String url;

  @override
  State<WebViewApp> createState() => _WebViewAppState();
}

class _WebViewAppState extends State<WebViewApp> {
  @override
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
      body: WebViewApp(
        url: widget.url,
      ),
    );
  }
}
