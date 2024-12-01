import 'package:get/get.dart';
import 'package:second_copy_for_azkar_application/model/theker_number.dart';

class ThekerController extends GetxController {
  // var theker_number = 0.obs;
  var theker_numbers = [];

  ThekerController({required List<ThekerNumber> thekers_num}){
    // print('ThekerController, thekers numbers is ${thekers_num}');
    theker_numbers = thekers_num;
    // print('ThekerController, theker controller number is ${theker_numbers.value}');
  }

  decreaseThekerNumber(int index) {
    print('ThekerController, decrease index ${index}');
    if (theker_numbers[index].number > 0) theker_numbers[index].number--;
    print('ThekerController, theker number after decrese is ${index}');
    update();
  }

  resetThekerNumber(int index , int thekerNumber) {
    theker_numbers[index].number = thekerNumber;
    update();
  }  
}
