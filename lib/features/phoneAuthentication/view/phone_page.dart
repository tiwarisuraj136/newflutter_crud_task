import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newflutter_crud_task/core/routes_constant.dart';
import 'package:newflutter_crud_task/features/phoneAuthentication/controller/phone_controller.dart';

class PhonePage extends GetView<PhoneController>{
  const PhonePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Phone Authentication"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            controller: controller.phoneNumController,
            decoration: const InputDecoration(
                labelText: "Phone Number"
            ),

          ),
          const SizedBox(height: 15,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(onPressed: () async{
                try{
                await FirebaseAuth.instance.verifyPhoneNumber(
                  verificationCompleted : (PhoneAuthCredential credential){},
                  verificationFailed: (FirebaseAuthException ex){
                    print("hello this is exception${ex}");
                  },
                  codeSent: (String verificationid, int? resendtoken){
                    Get.toNamed(RoutesConstant.otp, arguments: verificationid);
                  },

                   codeAutoRetrievalTimeout: (String verificationid){},
                    phoneNumber:'+91${controller.phoneNumController.text.toString()}',

                );
                }on FirebaseException catch(e){
                  print("this is error : $e");
                }

              }, child: const Text("verify Number")),
              const SizedBox(height: 10,),
              ElevatedButton(onPressed: () async{
                  Get.toNamed(RoutesConstant.home);
              }, child: const Text("Home Page")),
            ],
          ),
        ],
      ),
    );
  }

}