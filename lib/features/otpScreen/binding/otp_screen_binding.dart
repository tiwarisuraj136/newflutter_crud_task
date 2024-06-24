import 'package:get/get.dart';
import 'package:newflutter_crud_task/features/otpScreen/controller/otp_screen_controller.dart';

class OtpScreenBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(OtpScreenController());
  }

}