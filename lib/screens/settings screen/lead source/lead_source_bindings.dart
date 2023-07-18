import 'package:get/get.dart';
import 'package:travel_crm/screens/settings%20screen/lead%20source/lead_source_controller.dart';

class LeadSourceBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LeadSourceController());
  }
}
