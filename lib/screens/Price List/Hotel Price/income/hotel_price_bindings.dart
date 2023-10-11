import 'package:get/get.dart';
import 'hotel_price_controller.dart';

class HotelPriceBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HotelPriceController());
  }
}
