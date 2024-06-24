import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newflutter_crud_task/core/model/item_model.dart';
import 'package:newflutter_crud_task/core/routes_constant.dart';

class ItemsAddController extends GetxController{

   TextEditingController nameController = TextEditingController();
   TextEditingController percentageController = TextEditingController();
   TextEditingController passoutYearController = TextEditingController();
   TextEditingController cityController = TextEditingController();

  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  final formKey = GlobalKey<FormState>();

  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your name';
    }
    return null;
  }

  String? validatePercentage(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your percentage';
    }
    if (double.tryParse(value) == null || double.parse(value) < 0 || double.parse(value) > 100) {
      return 'Please enter a valid percentage';
    }
    return null;
  }

  String? validatePassoutYear(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your passout year';
    }
    if (int.tryParse(value) == null || int.parse(value) < 1900 || int.parse(value) > DateTime.now().year) {
      return 'Please enter a valid year';
    }
    return null;
  }

  String? validateCity(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your city';
    }
    return null;
  }



  Future<void> addData(ItemModel itemModel) async {
    await firebaseFirestore.collection('items').add(itemModel.toMap());
    Get.snackbar('Success', 'Item Add Form submitted successfully');
    Get.toNamed(RoutesConstant.home);
  }



}