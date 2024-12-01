import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:second_copy_for_azkar_application/controller/theker_controller.dart';
import 'package:second_copy_for_azkar_application/model/hive_card.dart';
import 'package:second_copy_for_azkar_application/model/theker.dart';
import 'package:second_copy_for_azkar_application/model/theker_number.dart';
import 'package:second_copy_for_azkar_application/statics/statics.dart';
import 'package:second_copy_for_azkar_application/view/home_screen.dart';
import 'package:second_copy_for_azkar_application/view/widgets/theker_widget.dart';

class ThekersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // get arguments from the previous screen
    var thekerHeader = Get.arguments;

    //get thekers based for the thekerHeader
    List<Theker> thekers = getThekers(thekerHeader);

    // thekers_numbers list
    List<ThekerNumber> thekersNumbers = [];
    // add theker numbers to static list
    int index = 0;
    for (var theker in thekers) {
      thekersNumbers.add(
        ThekerNumber(number: theker.theker_number, id: index),
      );
      print(
          'ThekersScreen: thekers numbers from static for index $index  is ${thekersNumbers[index].number}');
      index++;
    }
    // get controller
    final ThekerController thekerController = Get.put(
      ThekerController(thekers_num: thekersNumbers),
    );

    return WillPopScope(
      onWillPop: () async {
        // Constants.thekerNumbers = [];
        // print(
        //     'ThekersScreen: after back thekers list ${Constants.thekerNumbers}');
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Theme.of(context).primaryColor,
          title: Align(
            alignment: Alignment.centerRight,
            child: Text(
              thekerHeader,
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'alfont_com_SakkalKitab',
                  fontWeight: FontWeight.bold),
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.arrow_forward,
                color: Colors.white,
              ),
              onPressed: () {
                // Constants.thekerNumbers = [];
                // print(
                //     'ThekersScreen: after back thekers list ${Constants.thekerNumbers}');
                Get.offAll(HomeScreen());
              },
            )
          ],
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
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
              colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.5),
                BlendMode.srcOver,
              ),
            ),
          ),
          child: GetBuilder<ThekerController>(
            builder: (controller) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  return ThekerWidget(
                    theker: thekers[index],
                    thekerChangedNumber:
                        controller.theker_numbers[index].number,
                    index: index,
                  );
                },
                itemCount: controller.theker_numbers.length,
              );
            },
          ),
        ),
      ),
    );
  }
}
