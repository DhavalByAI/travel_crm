import 'package:get/get.dart';
import 'package:travel_crm/screens/login/login_controller.dart';

class LoginBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }
}
