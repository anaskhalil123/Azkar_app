import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:second_copy_for_azkar_application/controller/theme_controller.dart';
import 'package:second_copy_for_azkar_application/view/home_screen.dart';

class SettingsScreen extends StatelessWidget {
  final ThemeController themeController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        foregroundColor: Colors.white,
        title: const Align(
          alignment: Alignment.centerRight,
          child: Text(
            'الإعدادات',
            style: TextStyle(
                color: Colors.white,
                fontFamily: 'alfont_com_SakkalKitab',
                fontWeight: FontWeight.bold),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.arrow_forward),
            onPressed: () {
              Get.offAll(HomeScreen());
            },
          )
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: Get.isDarkMode? AssetImage(
              'assests/settings_background_dark.png',
            ): AssetImage(
              'assests/settings_background.jpg',
            ),
            fit: BoxFit.fill,
          ),
        ),
        child: ListView(
          children: [
            ListTile(
              title: Text('تواصل معنا',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Theme.of(context).textTheme.bodyMedium!.color,
                  )),
              subtitle: Text('تواصل مع الدعم الفني',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Theme.of(context).textTheme.bodyMedium!.color,
                  )),
              trailing: Icon(
                Icons.message,
                color: Theme.of(context).primaryColor,
              ),
            ),
            ListTile(
              title: Text('تغيير النمط',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Theme.of(context).textTheme.bodyMedium!.color,
                  )),
              trailing: Icon(
                Icons.sunny,
                color: Theme.of(context).primaryColor,
              ),
              subtitle: Align(
                alignment: Alignment.centerRight,
                child: GetBuilder<ThemeController>(
                  builder: (controller) => Switch(
                    trackColor:
                        WidgetStatePropertyAll(Theme.of(context).primaryColor),
                    value: !Get.isDarkMode,
                    onChanged: (onChanged) {
                      controller.changeValue();
                      // print('theme before is ${controller.isDarkMode}');
                      // controller.changeTheme();
                      // controller.isDarkMode = !controller.isDarkMode;
                      // if (Get.isDarkMode) {
                      //   Get.changeThemeMode(ThemeMode.light);
                      // } else {
                      //   Get.changeThemeMode(ThemeMode.dark);
                      // }
                      /**
                       * Get.changeThemeMode(Get.isDarkMode? ThemeMode.light: ThemeMode.dark )
                       */
                      Get.isDarkMode
                          ? Get.changeThemeMode(ThemeMode.light)
                          : Get.changeThemeMode(ThemeMode.dark);
                      // print('theme after is ${controller.isDarkMode}');
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
