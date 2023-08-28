import 'package:flutter/material.dart';
import 'package:noteapp/views/widgets/custom_appbar.dart';

class ToDoView extends StatelessWidget {
  const ToDoView({super.key});
  static String id = 'ToDoView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          CustomAppBar(
            title: 'ToDo',
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}