import 'package:get/get.dart';

import 'itinerary_controller.dart';

class ItineraryBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ItineraryController());
  }
}
