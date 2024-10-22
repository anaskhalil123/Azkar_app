import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:second_copy_for_azkar_application/controller/theme_controller.dart';
import 'package:second_copy_for_azkar_application/model/hive_card.dart';
import 'package:second_copy_for_azkar_application/model/theker.dart';
import 'package:second_copy_for_azkar_application/model/thekerheader.dart';
import 'package:second_copy_for_azkar_application/statics/statics.dart';
import 'package:second_copy_for_azkar_application/view/home_screen.dart';
import 'package:second_copy_for_azkar_application/view/settings_screen.dart';
import 'package:second_copy_for_azkar_application/view/taspeeh_screen.dart';
import 'package:second_copy_for_azkar_application/view/thekers_screen.dart';

void main() async {
  // Get.put(ThemeController());
  await Hive.initFlutter(); // Initialize Hive
  await GetStorage.init(); // Initialize GetStorage
  Hive.registerAdapter(ThekerAdapter());
  Hive.registerAdapter(ThekerHeaderAdapter());

  /// create the models
  await Hive.openBox<Theker>('thekers');
  await Hive.openBox<ThekerHeader>('thekerheaders');

  // add data
  addThekers();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
  final ThemeController themeController = Get.put<ThemeController>(ThemeController());

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'أذكار الصباح والمساء',
      initialRoute: '/',
      theme: Constants.lightTheme,
      darkTheme: Constants.darkTheme,
      themeMode: themeController.getSavedMode(),
      getPages: [
        GetPage(name: '/', page: () => HomeScreen()),
        GetPage(name: '/thekers', page: () => ThekersScreen()),
        GetPage(name: '/settings', page: () => SettingsScreen()),
        GetPage(name: '/taspeeh', page: () => TaspeehScreen()),
      ],
    );
  }
}
