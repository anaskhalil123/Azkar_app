import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:second_copy_for_azkar_application/model/hive_card.dart';
import 'package:second_copy_for_azkar_application/model/thekerheader.dart';
import 'package:second_copy_for_azkar_application/view/settings_screen.dart';
import 'package:second_copy_for_azkar_application/view/taspeeh_screen.dart';
import 'package:second_copy_for_azkar_application/view/widgets/drawer_element.dart';
import 'package:second_copy_for_azkar_application/view/widgets/theker_button.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    List<ThekerHeader> thekerHeaders = getThekerHeaders();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
        title: Align(
          alignment: Alignment.centerRight,
          child: Text(
            'أذكار الصباح والمساء',
            style: TextStyle(
                color: Colors.white,
                fontFamily: 'alfont_com_SakkalKitab',
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
      drawer: Drawer(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: Get.isDarkMode
                  ? AssetImage(
                      'assests/splach_background_dark.jpg',
                    )
                  : AssetImage(
                      'assests/splach_background.jpg',
                    ),
              fit: BoxFit.fill,
              colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.7),
                BlendMode.srcOver,
              ),
            ),
          ),
          child: ListView(
            children: [
              SizedBox(
                height: height / 25,
              ),
              SizedBox(
                height: height / 5,
                child: Image.asset(
                  'assests/azkar_text_image.png',
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: DrawerElement(
                  drawer_element_icon: Icons.settings,
                  onClick: () {
                    Get.to(
                      SettingsScreen(),
                    );
                  },
                  element_text: 'الضبط',
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: DrawerElement(
                  drawer_element_icon: Icons.restore,
                  onClick: () {
                    Get.to(
                      TaspeehScreen(),
                    );
                  },
                  element_text: 'المسبحة الإلكترونية',
                ),
              )
            ],
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: Get.isDarkMode
                ? AssetImage(
                    'assests/splach_background_dark.png',
                  )
                : AssetImage(
                    'assests/splach_background.jpg',
                  ),
            colorFilter: ColorFilter.mode(
              Colors.white.withOpacity(0.6),
              BlendMode.srcOver,
            ),
            fit: BoxFit.fill,
          ),
        ),
        child: ListView(
          children: [
            SizedBox(
              height: height / 60,
            ),
            SizedBox(
              width: width / 4,
              height: height / 4,
              child: Image.asset(
                'assests/azkar_text_image.png',
              ),
            ),
            SizedBox(
              height: height / 60,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: width / 10,
              ),
              child: SizedBox(
                height: height / 1.4,
                child: ListView.builder(
                  itemBuilder: (context, index) => Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: height / 100,
                    ),
                    child: ThekeButton(
                      thekerHeader: thekerHeaders[index],
                    ),
                  ),
                  itemCount: thekerHeaders.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
