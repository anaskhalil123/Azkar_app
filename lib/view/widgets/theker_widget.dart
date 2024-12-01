import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:second_copy_for_azkar_application/controller/theker_controller.dart';
import 'package:second_copy_for_azkar_application/model/theker.dart';
import 'package:second_copy_for_azkar_application/statics/statics.dart';

class ThekerWidget extends StatelessWidget {
  ThekerWidget({
    super.key,
    required this.theker,
    required this.thekerChangedNumber,
    required this.index,
  });
  Theker theker;
  int thekerChangedNumber;
  int index;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    var thekerController = Get.find<ThekerController>();
    
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  textAlign: TextAlign.right,
                  textDirection: TextDirection.rtl,
                  theker.theker_text,
                  style: TextStyle(
                    fontSize: width / 23.5,
                    fontFamily: 'alfont_com_SakkalKitab',
                    color: Theme.of(context).textTheme.bodyMedium!.color,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  textAlign: TextAlign.right,
                  textDirection: TextDirection.rtl,
                  theker.theker_reward,
                  style: TextStyle(
                    fontSize: width / 30,
                    color: Theme.of(context).textTheme.bodyMedium!.color,
                  ),
                ),
              ),
              SizedBox(
                height: height / 55,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    flex: 1,
                    child: IconButton(
                      icon: Icon(
                        Icons.restore,
                        color: Theme.of(context).primaryColor,
                        size: 30,
                      ),
                      onPressed: () {
                        // reset theker number here....
                        thekerController
                            .resetThekerNumber(index, theker.theker_number);
                        // Constants.thekerNumbers[index].number =
                            // theker.theker_number;
                      },
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: ElevatedButton(
                        child: Text(
                          '${thekerController.theker_numbers[index].number}',
                          style: TextStyle(
                              color:
                                  Theme.of(context).textTheme.bodyMedium!.color,
                              fontSize: width / 18),
                        ),
                        style: ButtonStyle(
                          minimumSize: WidgetStatePropertyAll(
                            Size(width / 17, height / 20),
                          ),
                          backgroundColor: WidgetStateProperty.all(
                            Theme.of(context).primaryColor,
                          ),
                        ),
                        onPressed: () {
                          // Constants.thekerNumbers[index].number--;
                          print('ThekerWidget, decrease index ${index}');
                          thekerController.decreaseThekerNumber(index);
                        },
                      ),
                  ),
                  Expanded(
                    flex: 1,
                    child: IconButton(
                      icon: Icon(
                        Icons.menu_book_rounded,
                        size: 30,
                        color: Theme.of(context).primaryColor,
                      ),
                      onPressed: () {
                        Get.defaultDialog(
                          backgroundColor:
                              Theme.of(context).scaffoldBackgroundColor,
                          title: 'الدليل',
                          titleStyle: TextStyle(
                            color:
                                Theme.of(context).textTheme.bodyMedium!.color,
                          ),
                          content: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              theker.theker_guide,
                              textAlign: TextAlign.right,
                              textDirection: TextDirection.rtl,
                              style: TextStyle(
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .color,
                                fontFamily: 'alfont_com_SakkalKitab',
                              ),
                            ),
                          ),
                          cancel: TextButton(
                            style: ButtonStyle(
                              backgroundColor: WidgetStateProperty.all(
                                Theme.of(context).primaryColor,
                              ),
                            ),
                            onPressed: () {
                              Get.back();
                            },
                            child: Text(
                              'حسناً',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
