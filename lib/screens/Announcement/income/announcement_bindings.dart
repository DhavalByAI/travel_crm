import 'package:get/get.dart';
import 'announcement_controller.dart';

class AnnBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AnnController());
  }
}
