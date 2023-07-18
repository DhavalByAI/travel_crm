import 'package:get/get.dart';

import 'activity_controller.dart';

class ActivityBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ActivityController());
  }
}
