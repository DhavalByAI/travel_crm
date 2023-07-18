import 'package:get/get.dart';
import 'income_controller.dart';

class IncomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => IncomeController());
  }
}
