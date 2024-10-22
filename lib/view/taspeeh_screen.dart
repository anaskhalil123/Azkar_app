import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:second_copy_for_azkar_application/controller/taspeeh_controller.dart';
import 'package:second_copy_for_azkar_application/statics/statics.dart';
import 'package:second_copy_for_azkar_application/view/home_screen.dart';

class TaspeehScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    TaspeehController taspeehController = Get.put(TaspeehController());

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Theme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        title: const Align(
          alignment: Alignment.centerRight,
          child: Text(
            'المسبحة الإلكترونية',
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
              print('offAll');
              Get.offAll(HomeScreen());
            },
          )
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: Get.isDarkMode
                ? AssetImage(
                    'assests/settings_background_dark.png',
                  )
                : AssetImage(
                    'assests/settings_background.jpg',
                  ),
            fit: BoxFit.fill,
          ),
        ),
        child: ListView(
          children: [
            SizedBox(
              height: height / 3.9,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width / 5),
              child: Container(
                width: width / 3,
                height: height / 3.5,
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(width / 2),
                  border: Border.all(
                    color: Theme.of(context).primaryColor,
                    width: 4,
                  ),
                ),
                child: InkWell(
                  borderRadius: BorderRadius.circular(width / 2),
                  onTap: () {
                    taspeehController.decrease();
                  },
                  child: ListView(
                    children: [
                      SizedBox(
                        height: height / 12,
                      ),
                      Center(
                        child: Text(
                          'استغفر الله',
                          style: TextStyle(
                            fontSize: height / 30,
                            fontFamily: 'alfont_com_SakkalKitab',
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height / 15,
                      ),
                      Obx(
                        () => Center(
                          child: Text(
                            '${taspeehController.taspeeh_number.value}',
                            style: TextStyle(
                              fontSize: height / 25,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height / 15,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width / 4),
              child: ElevatedButton(
                onPressed: () {
                  taspeehController.reset();
                },
                child: Text(
                  'أعد التسبيح',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: height / 40,
                    fontFamily: 'alfont_com_SakkalKitab',
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(
                    Theme.of(context).primaryColor,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
