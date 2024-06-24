import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormAddController extends GetxController{

  final TextEditingController contentController = TextEditingController();
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

/*
  Future<void> addData(HrmModel hrmModel) async {
    await firebaseFirestore
        .collection('todos')
        .add(hrmModel.toMap());
    Get.snackbar('successful', 'add form successful');
    Get.toNamed(RoutesConstant.home);
  }*/



}