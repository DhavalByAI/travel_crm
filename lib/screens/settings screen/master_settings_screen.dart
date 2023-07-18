import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_crm/core/constants/constants.dart';
import 'package:travel_crm/core/utils/image_constant.dart';
import 'package:travel_crm/routes/app_routes.dart';
import 'package:travel_crm/widgets/sub_widgets/c_card.dart';
import '../../core/utils/app_colors.dart';
import '../../widgets/main_widgets/drawer.dart';
import '../../widgets/sub_widgets/c_bounce.dart';
import '../../widgets/sub_widgets/ctext.dart';

class MasterSettingsScreen extends StatelessWidget {
  const MasterSettingsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<MasterSettingWidgetClass> listOfMasterSetting = [
      MasterSettingWidgetClass(
          title: "Agents",
          icon: IconConstant.agents,
          color: const Color(0xFF609966),
          onPressed: () {
            Get.toNamed(AppRoutes.msAgent);
          }),
      MasterSettingWidgetClass(
          title: "Destination",
          icon: IconConstant.destination,
          color: const Color(0xFFA0C3D2),
          onPressed: () {
            Get.toNamed(AppRoutes.msDestination);
          }),
      MasterSettingWidgetClass(
          title: "Destination Area",
          icon: IconConstant.destinationArea,
          color: const Color(0xFF3A98B9),
          onPressed: () {
            Get.toNamed(AppRoutes.msDestinationArea);
          }),
      MasterSettingWidgetClass(
          title: "Room Type",
          icon: IconConstant.roomType,
          color: const Color(0xFFDFA67B),
          onPressed: () {
            Get.toNamed(AppRoutes.msRoomType);
          }),
      MasterSettingWidgetClass(
          title: "Meal Plan",
          icon: IconConstant.mealPlan,
          color: const Color(0xFFA555EC),
          onPressed: () {
            Get.toNamed(AppRoutes.msMealPlan);
          }),
      MasterSettingWidgetClass(
          title: "Hotel",
          icon: IconConstant.hotelMasterSetting,
          color: const Color(0xFF7286D3),
          onPressed: () {
            Get.toNamed(AppRoutes.msHotel);
          }),
      MasterSettingWidgetClass(
          title: "Activity",
          icon: IconConstant.activity,
          color: const Color(0xFF939B62),
          onPressed: () {
            Get.toNamed(AppRoutes.msActivity);
          }),
      MasterSettingWidgetClass(
          title: "Visa/Extra",
          icon: IconConstant.visa,
          color: const Color(0xFFCBB279),
          onPressed: () {
            Get.toNamed(AppRoutes.msVisaExtra);
          }),
      MasterSettingWidgetClass(
          title: "Driver",
          icon: IconConstant.driver,
          color: const Color(0xFF84A7A1),
          onPressed: () {
            Get.toNamed(AppRoutes.msDriver);
          }),
      MasterSettingWidgetClass(
          title: "Cabs",
          icon: IconConstant.cabs,
          color: const Color(0xFF526D82),
          onPressed: () {
            Get.toNamed(AppRoutes.msCabs);
          }),
      MasterSettingWidgetClass(
          title: "Transfer Price",
          icon: IconConstant.transferPrice,
          color: const Color(0xFFD3756B),
          onPressed: () {
            Get.toNamed(AppRoutes.msTransferPrice);
          }),
      // MasterSettingWidgetClass(
      //     title: "Day Itinerary",
      //     icon: IconConstant.dayItinerary,
      //     color: const Color(0xFFC85C8E),
      //     onPressed: () {}),
      MasterSettingWidgetClass(
          title: "Lead Source",
          icon: IconConstant.leadSource,
          color: const Color(0xFF579BB1),
          onPressed: () {
            Get.toNamed(AppRoutes.msLeadSource);
          }),
      MasterSettingWidgetClass(
          title: "Vendors",
          icon: IconConstant.vendors,
          color: const Color(0xFF62B6B7),
          onPressed: () {}),
      MasterSettingWidgetClass(
          title: "Airport",
          icon: IconConstant.airports,
          color: const Color(0xFFFAAB78),
          onPressed: () {}),
    ];
    return Scaffold(
      backgroundColor: AppColors.scafflodBackground,
      drawer: const CDrawer(),
      appBar: AppBar(
          iconTheme: const IconThemeData(size: 30, color: Colors.black),
          title: ctext("Master Settings",
              fontSize: 20, fontWeight: FontWeight.w700),
          centerTitle: true,
          elevation: 0,
          backgroundColor: AppColors.scafflodBackground),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ctext(
                  "All Settings Related To System Masters Like Your Contracted Hotels, Transfers, Activities.",
                  textAlign: TextAlign.center,
                  fontSize: 11,
                  maxLines: 2,
                  color: Colors.black.withOpacity(0.5),
                  fontWeight: FontWeight.w400),
              const SizedBox(
                height: kPadding / 2,
              ),
              Wrap(
                alignment: WrapAlignment.start,
                crossAxisAlignment: WrapCrossAlignment.start,
                runAlignment: WrapAlignment.start,
                spacing: 12,
                runSpacing: 0,
                children: List.generate(
                  listOfMasterSetting.length,
                  (index) => cBounce(
                    onPressed: listOfMasterSetting[index].onPressed,
                    child: SizedBox(
                      height: 135,
                      width: 105,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Positioned(
                            bottom: 0,
                            child: cCard(
                              width: 105,
                              height: 45,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 15, left: 6, right: 6),
                                child: ctext(
                                  listOfMasterSetting[index].title,
                                  fontSize: 11,
                                  maxLines: 2,
                                  textAlign: TextAlign.center,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                          CircleAvatar(
                            backgroundColor: listOfMasterSetting[index].color,
                            radius: 32,
                            child: Image.asset(
                              listOfMasterSetting[index].icon,
                              height: 30,
                              width: 30,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MasterSettingWidgetClass {
  String title;
  String icon;
  Color color;
  Function() onPressed;
  MasterSettingWidgetClass(
      {required this.title,
      required this.icon,
      required this.color,
      required this.onPressed});
}
