import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newflutter_crud_task/core/get_pages.dart';
import 'package:newflutter_crud_task/core/routes_constant.dart';
import 'package:newflutter_crud_task/firebase_options.dart';
import 'package:newflutter_crud_task/otppp.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
// home: PhoneAuth(),
//         initialRoute: RoutesConstant.phone,
        initialRoute: RoutesConstant.imgupload,
        getPages :getpages
    );
  }
}


