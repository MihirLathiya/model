import 'package:get/get.dart';
import 'package:model/controller/controller.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IncrementController>(() => IncrementController(), fenix: true);
  }
}
