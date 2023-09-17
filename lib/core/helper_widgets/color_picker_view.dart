import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studytome/features/home/data/cubit/home_cubit.dart';

class ColorPickerView extends StatelessWidget {
  const ColorPickerView({super.key, required this.colors});
  final List<int> colors;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: SizedBox(
        height: 40,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: const ScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          itemCount: colors.length,
          itemBuilder: (context, index) => MaterialButton(
            onPressed: () {
              BlocProvider.of<HomeCubit>(context).color = colors[index];
            },
            shape: const CircleBorder(),
            color: Color(colors[index]),
            child: const SizedBox(width: 16, height: 16),
          ),
        ),
      ),
    );
  }
}
