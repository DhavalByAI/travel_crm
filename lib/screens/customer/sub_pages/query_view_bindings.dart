import 'package:get/get.dart';
import 'package:travel_crm/screens/customer/sub_pages/query_view_controller.dart';

class QueryViewBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => QueryViewController());
  }
}
