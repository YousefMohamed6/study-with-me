import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studytome/core/utils/show_message.dart';
import 'package:studytome/features/image/data/cubit/image_cubit.dart';
import 'package:studytome/features/image/data/model/image_model.dart';
import 'package:studytome/features/image/presentation/views/widgets/image_list_view_body.dart';

class ImageListView extends StatelessWidget {
  const ImageListView({super.key, required this.imagesList});
  final List<ImageModel> imagesList;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ImageCubit, ImageState>(
      listener: (context, state) {
        if (state is PickImageSuccess) {
          ShowMessage.show(context, msg: 'Select Image Success');
        } else if (state is PickImageFailure) {
          Navigator.pop(context);
          ShowMessage.show(context, msg: 'Select Image Failed');
        }
        if (state is AddImageSuccess) {
          Navigator.pop(context);
          ShowMessage.show(context, msg: 'Add Success');
        } else if (state is AddImageFailure) {
          Navigator.pop(context);
          ShowMessage.show(context, msg: 'Failed,try again');
        }
        if (state is EditImageSuccess) {
          Navigator.pop(context);
          ShowMessage.show(context, msg: 'Edit Success');
        } else if (state is EditImageFailure) {
          Navigator.pop(context);
          ShowMessage.show(context, msg: 'Failed,try again');
        }
        if (state is UnSelectedImage) {
          ShowMessage.show(context, msg: 'Please Select Image');
        }
      },
      builder: (context, state) => ImageListViewBody(
        imagesList: imagesList,
      ),
    );
  }
}
