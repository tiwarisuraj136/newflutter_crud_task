import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newflutter_crud_task/core/routes_constant.dart';
import 'package:newflutter_crud_task/features/otpScreen/controller/otp_screen_controller.dart';

class OtpScreenView extends GetView<OtpScreenController>{
  const OtpScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    final String verificationid = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        title: const Text("OTP Screen"),
      ),
      body: Column(
        children: [
          TextFormField(
            controller: controller.otpController,
            decoration: const InputDecoration(
                labelText: "OTP"
            ),
          ),
          const SizedBox(height: 10,),
          ElevatedButton(
              onPressed: () async{
            try{
              AuthCredential credential = await PhoneAuthProvider.credential(
                  verificationId:verificationid,
                  smsCode: controller.otpController.text.toString());
              FirebaseAuth.instance.signInWithCredential(credential).then((value){
              Get.toNamed(RoutesConstant.home);
              });
            }catch(ex){
              log(ex.toString());
            }

          }, child: const Text("verify otp"))
        ],
      ),

    );
  }

}