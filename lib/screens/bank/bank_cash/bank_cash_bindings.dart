import 'package:get/get.dart';

import 'bank_cash_controller.dart';

class BankCashBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BankCashController());
  }
}
