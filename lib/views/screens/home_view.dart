import 'package:flutter/material.dart';
import 'package:noteapp/views/widgets/custom_icon_button.dart';
import 'package:noteapp/views/widgets/custom_text.dart';
import 'package:noteapp/views/widgets/vertical_sizebox.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ListView(
            children: [
              const CustomAppBar(),
              const VerticalSizedBox(8),
              ListView.builder(
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (context, index) => const NoteItem(
                  color: Colors.grey,
                  title: 'flutter Tibs',
                  subject: 'my name is yousef iam flutter devolper',
                  time: '2023-8-26',
                ),
              ),
            ],
          ),
          Positioned(
            right: 24,
            bottom: 32,
            child: FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, right: 24, left: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const CustomText(
            text: 'Notes',
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.grey.withOpacity(.05),
            ),
            child: CustomIconButton(
              icon: const Icon(
                Icons.search,
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}

class NoteItem extends StatelessWidget {
  const NoteItem({
    super.key,
    required this.color,
    required this.title,
    required this.subject,
    required this.time,
  });
  final Color color;
  final String title;
  final String subject;
  final String time;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 180,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: color,
            ),
          ),
          Positioned(
            left: (MediaQuery.of(context).size.width) / 10,
            top: 24,
            child: CustomText(
              text: title.toUpperCase(),
              fontWeight: FontWeight.bold,
            ),
          ),
          Positioned(
            left: (MediaQuery.of(context).size.width) / 10,
            top: 64,
            child: SizedBox(
              width: (MediaQuery.of(context).size.width) / 2,
              child: CustomText(
                text: subject,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            right: (MediaQuery.of(context).size.width) / 12,
            top: 32,
            child: CustomIconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {},
            ),
          ),
          Positioned(
            right: (MediaQuery.of(context).size.width) / 15,
            bottom: 24,
            child: CustomText(
              text: time,
            ),
          ),
        ],
      ),
    );
  }
}
