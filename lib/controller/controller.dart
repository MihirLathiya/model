import 'package:get/get.dart';

class IncrementController extends GetxController {
  var x = 0.obs;
  increment() {
    x.value++;
  }

  decrement() {
    x.value--;
  }
}
