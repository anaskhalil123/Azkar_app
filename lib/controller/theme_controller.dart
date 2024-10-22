import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeController extends GetxController {
  // late bool isDarkMode;
  final box = GetStorage();
  // late bool switchValue;

  @override
  void onInit() {
    super.onInit();
    // print(' is darkmode is ${Get.isDarkMode} , so value now is $switchValue');
    //get theme from storage
    // isDarkMode = box.read('isDarkTheme') ?? false;

    // change theme as it from the Storage
    // Get.changeTheme(isDarkMode? Constants.darkTheme : Constants.lightTheme);
  }

  ThemeMode getSavedMode() {
    if (box.read('isDarkTheme') == null) {
      print('return system mode');
      return ThemeMode.system;
    } else if (box.read('isDarkTheme') == true) {
      print('return dark mode');
      return ThemeMode.dark;
    } else if (box.read('isDarkTheme') == false) {
      print('return light mode');
      return ThemeMode.light;
    }
      print('return nothing mode');
    return ThemeMode.light;
  }

  void changeValue() {
    box.write('isDarkTheme', !Get.isDarkMode);
    // switchValue = !switchValue;
    update();
  }
}
