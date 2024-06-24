import 'package:get/get.dart';
import 'package:newflutter_crud_task/core/routes_constant.dart';
import 'package:newflutter_crud_task/features/Items/binding/items_add_binding.dart';
import 'package:newflutter_crud_task/features/Items/view/items_add_page.dart';
import 'package:newflutter_crud_task/features/home/home/home_page_binding.dart';
import 'package:newflutter_crud_task/features/home/home/home_page_view.dart';
import 'package:newflutter_crud_task/features/imgUpload/binding/img_upload_binding.dart';
import 'package:newflutter_crud_task/features/imgUpload/view/img_upload_page.dart';
import 'package:newflutter_crud_task/features/otpScreen/binding/otp_screen_binding.dart';
import 'package:newflutter_crud_task/features/otpScreen/view/otp_screen_view.dart';
import 'package:newflutter_crud_task/features/phoneAuthentication/binding/phone_binding.dart';
import 'package:newflutter_crud_task/features/phoneAuthentication/view/phone_page.dart';

List<GetPage> getpages = [
  /*GetPage(
      name: RoutesConstant.addForm,
      page: () => const FormAddPage(),
    binding: FormAddBinding(),
  ),*/
  GetPage(
    name: RoutesConstant.phone,
    page: () => const PhonePage(),
    binding: PhoneBinding(),
  ),
  GetPage(
    name: RoutesConstant.otp,
    page: () => const OtpScreenView(),
    binding: OtpScreenBinding(),
  ),
  GetPage(
   name: RoutesConstant.home,
    page: () => const HomePageView(),
    binding: HomePageBinding(),
  ),

  GetPage(
    name: RoutesConstant.item,
    page: () => const ItemsAddPage(),
    binding: ItemsAddBinding(),
  ),

  GetPage(
    name: RoutesConstant.imgupload,
    page: () => const ImgUploadPage(),
    binding: ImageUploadBinding(),
  ),

 /* GetPage(
      name: RoutesConstant.splash,
      page: () => splashScreenView(),
      binding: splashBinding(),
  ),

  GetPage(
      name: RoutesConstant.signUp,
      page: () => signUpPageView(),
      binding: signUpBinding(),
  ),

  GetPage(
      name: RoutesConstant.profile,
      page: () => profilePageView(),
      binding: profilePageBinding(),
  ),

  GetPage(
    name: RoutesConstant.dashBoard,
    page: () => dashboardView(),
    binding: dashboardBinding(),
  ),*/

];