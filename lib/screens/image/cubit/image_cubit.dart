import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:image_picker/image_picker.dart';
import 'package:noteapp/const/text.dart';
import 'package:noteapp/screens/image/model/image_model.dart';

part 'image_state.dart';

class ImageCubit extends Cubit<ImageState> {
  ImageCubit() : super(ImageInitial());
  final imageCtrl = TextEditingController();
  String? imagePath;
  List<ImageModel> images = [];
  void pickerCamera() async {
    try {
      var image = await ImagePicker().pickImage(source: ImageSource.camera);
      imagePath = image!.path;
      emit(PickSuccess());
    } catch (e) {
      emit(PickFailure());
    }
  }

  void pickerGallery() async {
    try {
      var image = await ImagePicker().pickImage(source: ImageSource.gallery);
      imagePath = image!.path;
      emit(PickSuccess());
    } catch (e) {
      emit(PickFailure());
    }
  }

  void addImage(ImageModel image) {
    try {
      var imageBox = Hive.box<ImageModel>(kImageBox);
      imageBox.add(image);
      fetchImages();
      emit(AddImageSuccess());
    } on Exception {
      emit(AddImageFailure());
    }
  }

  void deleteImage(ImageModel image) {
    try {
      image.delete();
      fetchImages();
      emit(DeleteImageSuccess());
    } on Exception {
      emit(DeleteImageFailure());
    }
  }

  void editImage(ImageModel image) {
    try {
      image.imageName = imageCtrl.text;
      image.imagePath = imagePath!;
      image.save();
      emit(EditImageSuccess());
      fetchImages();
    } on Exception {
      emit(EditImageFailure());
    }
  }

  void fetchImages() {
    images.clear();
    var imageBox = Hive.box<ImageModel>(kImageBox);
    images.addAll(imageBox.values.toList());
    emit(ImageInitial());
  }
}
