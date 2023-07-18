import 'package:get/get.dart';

import 'agents_controller.dart';

class AgentBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AgentController());
  }
}
