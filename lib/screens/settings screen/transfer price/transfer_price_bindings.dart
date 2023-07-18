import 'package:get/get.dart';

import 'transfer_price_controller.dart';

class TransferPriceBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TransferPriceController());
  }
}
