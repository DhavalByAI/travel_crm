import 'package:get/get.dart';

import 'driver_controller.dart';

class DriverBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DriverController());
  }
}
