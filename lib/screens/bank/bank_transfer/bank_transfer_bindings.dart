import 'package:get/get.dart';
import 'package:travel_crm/screens/bank/bank_transfer/bank_transfer_controller.dart';

class BankTransferBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BankTransferController());
  }
}
