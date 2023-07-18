import 'package:get/get.dart';

import 'cabs_controller.dart';

class CabsBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CabsController());
  }
}
