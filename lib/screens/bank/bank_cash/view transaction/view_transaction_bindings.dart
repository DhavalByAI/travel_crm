import 'package:get/get.dart';

import 'visa_transaction_controller.dart';

class ViewTransactionBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ViewTransactionController());
  }
}
