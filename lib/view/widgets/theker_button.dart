import 'package:flutter/material.dart';
import 'package:second_copy_for_azkar_application/model/thekerheader.dart';
import 'package:second_copy_for_azkar_application/view/thekers_screen.dart';
import 'package:get/get.dart';

class ThekeButton extends StatelessWidget {
  const ThekeButton({
    super.key,
    required this.thekerHeader,
  });

  final ThekerHeader thekerHeader;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          minimumSize: Size(width / 1.4, height / 17),
          backgroundColor: Theme.of(context).primaryColor),
      onPressed: () {
        var argument = thekerHeader.text;
        Get.to(ThekersScreen(), arguments: argument);
      },
      child: Text(
        thekerHeader.text,
        style: TextStyle(
            fontSize: width / 16,
            fontFamily: 'alfont_com_SakkalKitab',
            color: Theme.of(context).textTheme.titleSmall!.color),
      ),
    );
  }
}
