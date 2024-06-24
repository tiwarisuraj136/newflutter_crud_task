import 'package:get/get.dart';
import 'package:newflutter_crud_task/features/home/home/home_page_controller.dart';

class HomePageBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
    // TODO: implement dependencies
  }

}