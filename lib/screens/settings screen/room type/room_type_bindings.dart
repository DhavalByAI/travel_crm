import 'package:get/get.dart';
import 'package:travel_crm/screens/settings%20screen/room%20type/room_type_controller.dart';

class RoomTypeBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RoomTypeController());
  }
}
