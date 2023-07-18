import 'package:get/get.dart';
import 'package:travel_crm/screens/settings%20screen/meal%20plan/meal_plan_controller.dart';

class MealPlanBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MealPlanController());
  }
}
