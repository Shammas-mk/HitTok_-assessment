import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_8/controller/login_register_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LoginRegisterController loginRegisterController =
        Get.put(LoginRegisterController());
    loginRegisterController.getData();
    return Scaffold(
      backgroundColor: Colors.grey[500],
      appBar: AppBar(
        title: const Text("Home"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              loginRegisterController.logout();
            },
          ),
        ],
      ),
      body: SizedBox(
        width: double.infinity,
        child: Card(
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Name : "),
                Text("${loginRegisterController.userName}"),
                const SizedBox(height: 30),
                const Text("Email :"),
                Text("${loginRegisterController.userEmail}"),
                const SizedBox(height: 30),
                const Text("Address :"),
                Text("${loginRegisterController.userAddress}"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
