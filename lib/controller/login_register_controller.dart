import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_8/helper/shared_preferences.dart';
import 'package:task_8/views/home_page.dart';
import 'package:task_8/views/login_page.dart';

class LoginRegisterController extends GetxController {
  TextEditingController name = TextEditingController();
  TextEditingController registerEmail = TextEditingController();
  TextEditingController registerPassword = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController address = TextEditingController();

  String isUserLogged = 'NotLogged';
  var userEmail;
  var userAddress;
  var userName;

  registerDetails() async {
    await DetailsStoring.setName(name.text);
    await DetailsStoring.setEmail(registerEmail.text);
    await DetailsStoring.setPassword(registerPassword.text);
    await DetailsStoring.setAddress(address.text);
    await DetailsStoring.setId('NotLogged');

    update();
  }

  loginDetails() async {
    final checkEmail = await DetailsStoring.getEmail();
    final checkPassword = await DetailsStoring.getPassword();
    if (checkEmail == email.text && checkPassword == password.text) {
      await DetailsStoring.setId('logged');
      update();
      Get.offAll(() => const HomePage());
    } else {
      Get.snackbar(
        "Error",
        "Entered Invalid Credentials",
        snackPosition: SnackPosition.BOTTOM,
        icon: const Icon(Icons.error),
        shouldIconPulse: true,
        backgroundColor: Colors.white,
        margin: const EdgeInsets.all(10),
      );
    }
    update();
  }

  logout() async {
    await DetailsStoring.setId('NotLogged');
    resetFields();
    Get.offAll(() => LoginPage());
  }

  getData() async {
    userEmail = await DetailsStoring.getEmail();
    userAddress = await DetailsStoring.getAddress();
    userName = await DetailsStoring.getName();
    isUserLogged = await DetailsStoring.getId();
    update();
  }

  resetFields() {
    email.clear();
    name.clear();
    password.clear();
    registerEmail.clear();
    registerPassword.clear();
    address.clear();
  }

  @override
  void onInit() {
    super.onInit();
  }
}
