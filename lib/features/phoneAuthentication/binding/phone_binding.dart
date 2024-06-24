import 'package:get/get.dart';
import 'package:newflutter_crud_task/features/phoneAuthentication/controller/phone_controller.dart';

class PhoneBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(PhoneController());
  }

}