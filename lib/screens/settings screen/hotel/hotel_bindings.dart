import 'package:get/get.dart';

import 'hotel_controller.dart';

class HotelBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HotelController());
  }
}
