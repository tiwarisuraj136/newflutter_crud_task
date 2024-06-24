import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newflutter_crud_task/features/imgUpload/controller/img_upload_controller.dart';
// import 'package:path/path.dart';

class ImgUploadPage extends GetView<ImageUploadController>{
  const ImgUploadPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          const SizedBox(
            height: 32,
          ),
          Center(
            child: GestureDetector(
              onTap: () {
                showPicker(controller);
              },
              child: Obx(() {
                return CircleAvatar(
                  radius: 55,
                  backgroundColor: const Color(0xffFDCF09),
                  child: controller.photo.value != null
                      ? ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.file(
                      controller.photo.value!,
                      width: 100,
                      height: 100,
                      fit: BoxFit.fitHeight,
                    ),
                  )
                      : Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(50)),
                    width: 100,
                    height: 100,
                    child: Icon(
                      Icons.camera_alt,
                      color: Colors.grey[800],
                    ),
                  ),
                );
              }),
            ),
          )
        ],
      ),
    );



  }
  void showPicker(controller) {
    print('controllerhello i amhere e line 59');
    print(controller.toString());
    print('controllerhello i am here line 61');
      Get.bottomSheet(
        SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Gallery'),
                onTap: () {
                  controller.imgFromGallery();
                  Get.back();  // Close the bottom sheet
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_camera),
                title: const Text('Camera'),
                onTap: () {
                  controller.imgFromCamera();
                  Get.back();  // Close the bottom sheet
                },
              ),
            ],
          ),
        ),
      );

  }
}