import 'package:get/get.dart';

import 'invoice_controller.dart';

class InvoiceBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => InvoiceController());
  }
}
