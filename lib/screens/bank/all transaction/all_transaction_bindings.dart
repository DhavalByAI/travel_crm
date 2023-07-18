import 'package:get/get.dart';

import 'all_transaction_controller.dart';

class AllTransactionBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AllTransactionController());
  }
}
