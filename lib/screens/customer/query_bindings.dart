import 'package:get/get.dart';
import 'package:travel_crm/screens/customer/query_controller.dart';

class QueryBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => QueryController());
  }
}
