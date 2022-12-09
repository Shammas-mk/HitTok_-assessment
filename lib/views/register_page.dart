import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_8/controller/login_register_controller.dart';
import 'package:task_8/views/login_page.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    LoginRegisterController loginRegisterController =
        Get.put(LoginRegisterController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      backgroundColor: Colors.green[200],
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: SizedBox(
            child: Form(
              autovalidateMode: AutovalidateMode.always,
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 80),
                  const Text(
                    "Register with Creadentials",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 50),
                  TextFormField(
                    controller: loginRegisterController.name,
                    decoration: InputDecoration(
                      hintText: 'Name',
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(color: Colors.blue)),
                      contentPadding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                    ),
                    cursorColor: Colors.white,
                    style: const TextStyle(color: Colors.white),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter a Name';
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(height: 30),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: loginRegisterController.registerEmail,
                    decoration: InputDecoration(
                      hintText: 'Email',
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(color: Colors.blue)),
                      contentPadding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                    ),
                    cursorColor: Colors.white,
                    style: const TextStyle(color: Colors.white),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter a valid Email';
                      } else if (!value.contains('@')) {
                        return 'Not an email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 30),
                  TextFormField(
                    obscureText: true,
                    controller: loginRegisterController.registerPassword,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(color: Colors.blue)),
                      contentPadding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                    ),
                    cursorColor: Colors.white,
                    style: const TextStyle(color: Colors.white),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter a valid Password';
                      } else if (value.length < 8) {
                        return 'Required 8 characters';
                      }

                      return null;
                    },
                  ),
                  const SizedBox(height: 30),
                  TextFormField(
                    controller: loginRegisterController.address,
                    maxLines: 3,
                    decoration: InputDecoration(
                      hintText: 'Address',
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(color: Colors.blue)),
                      contentPadding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                    ),
                    cursorColor: Colors.white,
                    style: const TextStyle(color: Colors.white),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter a value Address';
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            await loginRegisterController.registerDetails();
                            await loginRegisterController.getData();
                            Get.off(() => LoginPage());
                          }
                        },
                        child: const Text("Register")),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
