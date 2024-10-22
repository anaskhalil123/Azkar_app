import 'package:get/get.dart';

class ThekerController extends GetxController {
  var theker_number = 0.obs;


  ThekerController({required int theker_number}){
    this.theker_number.value = theker_number;
  }

  decreaseThekerNumber() {
    if (theker_number > 0) theker_number--;
  }

  resetThekerNumber(int thekerNumber) {
    theker_number.value = thekerNumber;
  }
}
