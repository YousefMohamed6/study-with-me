import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:image_picker/image_picker.dart';
import 'package:studytome/core/const/text.dart';
import 'package:studytome/features/image/data/model/image_model.dart';

part 'image_state.dart';

class ImageCubit extends Cubit<ImageState> {
  ImageCubit() : super(ImageInitial());
  final imageCtrl = TextEditingController();
  String? imagePath;
  List<ImageModel> imagesList = [];

  Future<void> pickFromCamera() async {
    try {
      var image = await ImagePicker().pickImage(source: ImageSource.camera);
      imagePath = image!.path;
      emit(PickImageSuccess());
    } catch (_) {
      emit(PickImageFailure());
    }
  }

  Future<void> pickFromGallery() async {
    try {
      var image = await ImagePicker().pickImage(source: ImageSource.gallery);
      imagePath = image!.path;
      emit(PickImageSuccess());
    } catch (_) {
      emit(PickImageFailure());
    }
  }

  void addImageToMemory() async {
    if (imagePath != null) {
      try {
        var imageBox = Hive.box<ImageModel>(kImageBox);
        var image = ImageModel(
          imagePath: imagePath!,
          imageName: imageCtrl.text,
        );
        await imageBox.add(image);
        fetchImagesFromMemory();
        emit(AddImageSuccess());
        imageCtrl.clear();
      } catch (_) {
        emit(AddImageFailure());
      }
    } else {
      emit(UnSelectedImage());
    }
  }

  void deleteImageFromMemory({required ImageModel image}) {
    image.delete();
    fetchImagesFromMemory();
  }

  void editImagePath({required ImageModel image}) {
    if (imagePath != null) {
      try {
        image.imageName = imageCtrl.text;
        image.imagePath = imagePath!;
        image.save();
        fetchImagesFromMemory();
        emit(EditImageSuccess());
        imageCtrl.clear();
        imagePath = null;
      } catch (_) {
        emit(EditImageFailure());
      }
    } else {
      emit(UnSelectedImage());
    }
  }

  void editImageName({required ImageModel image}) {
    try {
      image.imageName = imageCtrl.text;
      image.save();
      fetchImagesFromMemory();
      emit(EditImageSuccess());
      imageCtrl.clear();
    } catch (_) {
      emit(EditImageFailure());
    }
  }

  void fetchImagesFromMemory() {
    imagesList.clear();
    var imageBox = Hive.box<ImageModel>(kImageBox);
    imagesList.addAll(imageBox.values.toList());
    emit(ImageInitial());
  }
}
