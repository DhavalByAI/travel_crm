import 'package:get/get.dart';
import 'package:travel_crm/screens/dashboard/dashboard_controller.dart';

class DashBoardBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DashboardController());
  }
}
