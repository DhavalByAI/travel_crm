import 'package:get/get.dart';
import 'package:travel_crm/screens/login/login_controller.dart';

class InitialBindings extends Bindings {
  @override
  dependencies() {
    Get.lazyPut(() => LoginController());
  }
}
