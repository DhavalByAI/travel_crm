import 'package:get/get.dart';

import 'destination_area_controller.dart';

class DestinationAreaBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DestinationAreaController());
  }
}
