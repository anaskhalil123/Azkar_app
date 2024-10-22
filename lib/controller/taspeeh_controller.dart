import 'package:get/get.dart';

class TaspeehController extends GetxController {
  var taspeeh_number = 100.obs;

  void decrease() {
    taspeeh_number--;
  }

  void reset() {
    taspeeh_number.value = 100;
  }
}
