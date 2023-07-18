import 'package:get/get.dart';

import 'destination_controller.dart';

class DestinationBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DestinationController());
  }
}
