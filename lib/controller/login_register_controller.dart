import 'dart:async';
import 'dart:developer';
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

  RxInt counter = 0.obs;
  RxBool isDisable = false.obs;

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
      counter.value++;
      if (counter.value == 3) {
        log("${isDisable.value}");
        log("this is working ");
        isDisable.value = true;
        log("${isDisable.value}");
        resetButton();
        update();
      }
      log("$counter ++++ this is the counder");
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

  resetButton() {
    resetFields();
    Timer.periodic(const Duration(minutes: 10), (Timer timer) {
      counter.value = 1;
      isDisable.value = false;
      Get.offAll(() => LoginPage())?.then((value) => timer.cancel());
    });
  }

  @override
  void onInit() {
    super.onInit();
  }
}
