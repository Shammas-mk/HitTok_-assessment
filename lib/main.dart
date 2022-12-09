import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_8/controller/login_register_controller.dart';
import 'package:task_8/helper/shared_preferences.dart';
import 'package:task_8/views/home_page.dart';
import 'package:task_8/views/login_page.dart';

LoginRegisterController loginRegisterController =
    Get.put(LoginRegisterController());

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DetailsStoring.init();
  loginRegisterController.getData();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: loginRegisterController.isUserLogged == "NotLogged"
          ? LoginPage()
          : const HomePage(),
    );
  }
}
