import 'package:get/get.dart';

import 'master_settings_controller.dart';

class MasterSettingsBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MasterSettingsController());
  }
}
