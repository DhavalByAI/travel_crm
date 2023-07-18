import 'package:get/get.dart';

import 'visa_controller.dart';

class VisaBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => VisaController());
  }
}
