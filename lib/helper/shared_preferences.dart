import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

class DetailsStoring {
  static SharedPreferences? preferences;

  static Future init() async {
    preferences = await SharedPreferences.getInstance();
  }

  static Future setId(id) async {
    await preferences!.setString("id", id);
  }

  static Future getId() async {
    return preferences!.getString("id");
  }

  static Future setName(name) async {
    log("+++++++++++++++++++++++++++ set id function $name");
    await preferences!.setString("name", name);
  }

  static Future getName() async {
    return preferences?.getString("name");
  }

  static Future setEmail(email) async {
    log("+++++++++++++++++++++++++++ set id function $email");
    await preferences?.setString("email", email);
  }

  static Future getEmail() async {
    return preferences?.getString("email");
  }

  static Future setPassword(password) async {
    log("+++++++++++++++++++++++++++ set id function $password");
    await preferences?.setString("password", password);
  }

  static Future getPassword() async {
    return preferences?.getString("password");
  }

  static Future setAddress(address) async {
    log("+++++++++++++++++++++++++++ set id function $address");
    await preferences?.setString("address", address);
  }

  static Future getAddress() async {
    return preferences?.getString("address");
  }
}
