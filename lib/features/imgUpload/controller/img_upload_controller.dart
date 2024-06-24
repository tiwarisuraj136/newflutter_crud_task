import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class ImageUploadController extends GetxController{
  var photo = Rx<File?>(null);
  final ImagePicker picker = ImagePicker();

  Future imgFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      photo.value = File(pickedFile.path);
      uploadFile();
    } else {
      Get.snackbar('Error', 'No image selected.');
    }
  }

  Future imgFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      photo.value = File(pickedFile.path);
      uploadFile();
    } else {
      Get.snackbar('Error', 'No image selected.');
    }
  }

  Future uploadFile() async {
    if (photo.value == null) return;
    final fileName = basename(photo.value!.path);
    final destination = 'files/$fileName';

    try {
      final ref = firebase_storage.FirebaseStorage.instance
          .ref(destination)
          .child('file/');
      await ref.putFile(photo.value!);
    } catch (e) {
      Get.snackbar('Error', 'An error occurred while uploading the file.');
    }
  }
}