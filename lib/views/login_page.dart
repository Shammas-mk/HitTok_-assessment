import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_8/controller/login_register_controller.dart';
import 'package:task_8/views/register_page.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    LoginRegisterController loginRegisterController =
        Get.put(LoginRegisterController());

    return Scaffold(
      backgroundColor: Colors.green[200],
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Login with Creadentials",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: loginRegisterController.email,
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
                controller: loginRegisterController.password,
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
                  }
                  return null;
                },
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        loginRegisterController.loginDetails();
                      }
                    },
                    child: const Text("Login")),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("New user ?"),
                  TextButton(
                      onPressed: () {
                        loginRegisterController.resetFields();
                        Get.to(() => RegisterPage());
                      },
                      child: const Text("Sign Up"))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
