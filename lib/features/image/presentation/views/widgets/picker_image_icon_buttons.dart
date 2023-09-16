import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studytome/features/image/data/cubit/image_cubit.dart';
import 'package:studytome/features/image/presentation/views/widgets/picker_button.dart';

class PickerImageIconButtons extends StatelessWidget {
  const PickerImageIconButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(width: 32),
        PickerButton(
          onpressed: () async {
            await BlocProvider.of<ImageCubit>(context).pickFromGallery();
          },
          icon: Icons.image,
        ),
        SizedBox(width: (MediaQuery.of(context).size.width) / 2),
        PickerButton(
          onpressed: () async {
            await BlocProvider.of<ImageCubit>(context).pickFromCamera();
          },
          icon: Icons.camera_alt_outlined,
        ),
        const SizedBox(width: 32),
      ],
    );
  }
}
