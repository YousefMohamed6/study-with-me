import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studytome/core/helper_widgets/custom_appbar.dart';
import 'package:studytome/core/utils/show_message.dart';
import 'package:studytome/features/image/data/cubit/image_cubit.dart';
import 'package:studytome/features/image/presentation/views/widgets/image_list_view.dart';

class ImagesView extends StatelessWidget {
  const ImagesView({super.key});
  static String id = 'Files';
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ImageCubit, ImageState>(
      listener: (context, state) {
        if (state is PickImageSuccess) {
          ShowMessage.show(context, msg: 'Pick image Success');
        } else if (state is PickImageFailure) {
          ShowMessage.show(context, msg: 'Pick image faild');
          Navigator.pop(context);
        } else if (state is AddImageSuccess) {
          ShowMessage.show(context, msg: 'Add image Success');
          Navigator.pop(context);
        } else if (state is AddImageFailure) {
          ShowMessage.show(context, msg: 'faild ,try again');
          Navigator.pop(context);
        } else if (state is EditImageSuccess) {
          ShowMessage.show(context, msg: 'Edit image Success');
          Navigator.pop(context);
        } else if (state is EditImageFailure) {
          ShowMessage.show(context, msg: 'faild ,try again');
          Navigator.pop(context);
        }
      },
      builder: (context, state) => Scaffold(
        body: Column(
          children: [
            const SizedBox(height: 16),
            CustomAppBar(
              title: 'Picture',
              icon: const Icon(Icons.search),
              onPressed: () {},
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ImageListView(
                images: BlocProvider.of<ImageCubit>(context).images,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
