part of 'image_cubit.dart';

abstract class ImageState {}

class ImageInitial extends ImageState {}

class AddImageSuccess extends ImageState {}

class AddImageFailure extends ImageState {}

class UnSelectedImage extends ImageState {}

class DeleteImageSuccess extends ImageState {}

class DeleteImageFailure extends ImageState {}

class EditImageSuccess extends ImageState {}

class EditImageFailure extends ImageState {}

class PickImageSuccess extends ImageState {}

class PickImageFailure extends ImageState {}

class ImageSearch extends ImageState {
  final List<ImageModel> imagesList;

  ImageSearch({required this.imagesList});
}
