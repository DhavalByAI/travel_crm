import 'package:get/get.dart';
import 'package:travel_crm/screens/quotation/quotation_controller.dart';

class QuotationBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => QuotationController());
  }
}
