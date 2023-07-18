import 'package:get/get.dart';

import 'expences_controller.dart';

class ExpencesBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ExpencesController());
  }
}
