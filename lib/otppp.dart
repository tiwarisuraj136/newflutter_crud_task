import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'auth.dart';

class PhoneAuth extends StatelessWidget {
  const PhoneAuth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text(
          "OTP Page",
          style: TextStyle(color: Colors.white, fontSize: 24, fontStyle: FontStyle.italic),
        ),
        centerTitle: true,
      ),
      body: PhoneAuthBody(),
    );
  }
}

class PhoneAuthController extends GetxController {
  var start = 30.obs;
  var wait = false.obs;
  var buttonName = "Send".obs;
  TextEditingController phoneController = TextEditingController();
  AuthClass authClass = AuthClass();
  var verificationIdFinal = "".obs;
  var smsCode = "".obs;

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    Timer.periodic(oneSec, (timer) {
      if (start.value == 0) {
        timer.cancel();
        wait.value = false;
      } else {
        start.value--;
      }
    });
  }

  void setData(String verificationId) {
    verificationIdFinal.value = verificationId;
    startTimer();
  }
}

class PhoneAuthBody extends StatelessWidget {
  final PhoneAuthController controller = Get.put(PhoneAuthController());

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/sea-2755908.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 120),
            textField(),
            SizedBox(height: 30),
            Container(
              width: MediaQuery.of(context).size.width - 30,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 1,
                      color: Colors.grey,
                      margin: EdgeInsets.symmetric(horizontal: 12),
                    ),
                  ),
                  Text(
                    "Please Enter 6 Digit OTP",
                    style: TextStyle(fontSize: 16, color: Colors.white, fontStyle: FontStyle.italic),
                  ),
                  Expanded(
                    child: Container(
                      height: 1,
                      color: Colors.red,
                      margin: EdgeInsets.symmetric(horizontal: 12),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            otpField(),
            SizedBox(height: 40),
            Obx(() => RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Send OTP Again In ",
                    style: TextStyle(fontSize: 16, color: Colors.yellowAccent, fontStyle: FontStyle.italic),
                  ),
                  TextSpan(
                    text: "00:${controller.start.value}",
                    style: TextStyle(fontSize: 16, color: Colors.purpleAccent, fontStyle: FontStyle.italic),
                  ),
                  TextSpan(
                    text: " sec ",
                    style: TextStyle(fontSize: 16, color: Colors.yellowAccent, fontStyle: FontStyle.italic),
                  ),
                ],
              ),
            )),
            SizedBox(height: 150),
            InkWell(
              onTap: () {
                controller.authClass.signInWithPhoneNumber(
                    controller.verificationIdFinal.value, controller.smsCode.value);
              },
              child: Container(
                height: 60,
                width: MediaQuery.of(context).size.width - 60,
                decoration: BoxDecoration(
                  color: Color(0xFF4A148C),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: Text(
                    "Submit",
                    style: TextStyle(
                      fontSize: 17,
                      color: Color(0xFFE53935),
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget otpField() {
    return OTPTextField(
      margin: const EdgeInsets.all(10.0),
      length: 6,
      // width: MediaQuery.of(context).size.width,
      fieldWidth: 40,
      otpFieldStyle: OtpFieldStyle(
        backgroundColor: Colors.indigo,
        borderColor: Colors.white,
      ),
      style: TextStyle(fontSize: 17, color: Colors.white, fontStyle: FontStyle.italic),
      textFieldAlignment: MainAxisAlignment.spaceAround,
      fieldStyle: FieldStyle.underline,
      onCompleted: (pin) {
        print("Completed: " + pin);
        controller.smsCode.value = pin;
      },
    );
  }

  Widget textField() {
    return Container(
      // width: MediaQuery.of(context).size.width - 40,
      height: 60,
      decoration: BoxDecoration(
        color: Color(0xFF4A148C),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextFormField(
        controller: controller.phoneController,
        style: TextStyle(color: Colors.white, fontSize: 17, fontStyle: FontStyle.italic),
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Enter your phone Number",
          hintStyle: TextStyle(color: Colors.white54, fontSize: 17, fontStyle: FontStyle.italic),
          contentPadding: const EdgeInsets.symmetric(vertical: 19, horizontal: 8),
          prefixIcon: Padding(
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 15),
            child: Text(
              " (+91) ",
              style: TextStyle(color: Colors.white, fontSize: 17, fontStyle: FontStyle.italic),
            ),
          ),
          suffixIcon: Obx(() => InkWell(
            onTap: controller.wait.value
                ? null
                : () async {
              controller.start.value = 30;
              controller.wait.value = true;
              controller.buttonName.value = "Resend";
              await controller.authClass.verifyPhoneNumber(
                  "+91 ${controller.phoneController.text}", controller.setData);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
              child: Text(
                controller.buttonName.value,
                style: TextStyle(
                  color: controller.wait.value ? Colors.grey : Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          )),
        ),
      ),
    );
  }
}
