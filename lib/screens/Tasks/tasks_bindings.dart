import 'package:get/get.dart';
import 'package:travel_crm/screens/Tasks/tasks_controller.dart';

class TaskBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TaskController());
  }
}
