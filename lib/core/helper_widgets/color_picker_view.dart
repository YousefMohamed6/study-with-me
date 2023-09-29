import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studytome/features/home/data/cubit/home_cubit.dart';

class ColorPickerView extends StatefulWidget {
  const ColorPickerView({super.key, required this.colors});
  final List<int> colors;

  @override
  State<ColorPickerView> createState() => _ColorPickerViewState();
}

class _ColorPickerViewState extends State<ColorPickerView> {
  bool isSelect = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: SizedBox(
        height: 40,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: widget.colors.length,
          itemBuilder: (context, index) => GestureDetector(
            onTap: () {
              BlocProvider.of<HomeCubit>(context).color = widget.colors[index];
              setState(() {
                isSelect = true;
              });
            },
            child: CircleAvatar(
              radius: 55,
              backgroundColor: Color(
                widget.colors[index],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
