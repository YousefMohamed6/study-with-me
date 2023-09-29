import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studytome/core/helper_widgets/custom_appbar.dart';
import 'package:studytome/features/home/data/cubit/home_cubit.dart';
import 'package:studytome/features/image/data/cubit/image_cubit.dart';
import 'package:studytome/features/image/presentation/views/widgets/image_list_view.dart';

class ImageViewBody extends StatelessWidget {
  const ImageViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          BlocBuilder<ImageCubit, ImageState>(
            builder: (context, state) {
              return CustomAppBar(
                 onChanged: (input){
                  BlocProvider.of<ImageCubit>(context).searchImage(input: input);
                 },
                title: 'Picture',
                isTapSearch: BlocProvider.of<HomeCubit>(context).isTapSearch,
              );
            },
          ),
          const SizedBox(height: 16),
          ImageListView(
            imagesList: BlocProvider.of<ImageCubit>(context).imagesList,
          ),
        ],
      ),
    );
  }
}
