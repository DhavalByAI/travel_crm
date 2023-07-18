import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_crm/core/constants/constants.dart';
import 'package:travel_crm/core/utils/image_constant.dart';
import 'package:travel_crm/screens/itinerary/itinerary_controller.dart';
import 'package:travel_crm/widgets/sub_widgets/c_card.dart';
import 'package:travel_crm/widgets/sub_widgets/c_dropdown.dart';
import 'package:travel_crm/widgets/sub_widgets/cbutton.dart';
import 'package:travel_crm/widgets/sub_widgets/ctextfield_common.dart';
import 'package:travel_crm/widgets/sub_widgets/text_with_heading.dart';
import '../../core/utils/app_colors.dart';
import '../../widgets/main_widgets/drawer.dart';
import '../../widgets/sub_widgets/c_bounce.dart';
import '../../widgets/sub_widgets/ctext.dart';

class ItineraryScreen extends StatelessWidget {
  const ItineraryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> queryType = [
      "Build",
      "Pricing",
      "Final",
    ];
    List<Widget> queryPage = [
      const SizedBox(),
      const SizedBox(),
      const SizedBox(),
    ];
    List<String> btnName = [
      "+ Add Accommodation",
      "+ Add Transfer",
      "+ Activity/Ticket",
      '+ Add flight details',
      '+ Add Additional details'
    ];
    return Scaffold(
      backgroundColor: AppColors.scafflodBackground,
      drawer: CDrawer(),
      appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black, size: 30),
          title:
              ctext("Itineraries", fontSize: 20, fontWeight: FontWeight.w700),
          centerTitle: true,
          elevation: 0,
          backgroundColor: AppColors.scafflodBackground),
      body: Padding(
        padding: const EdgeInsets.all(kPadding),
        child: SingleChildScrollView(
          child: Column(children: [
            cCard(
              width: dwidth,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    selectedIconAndName(value: 0, iconAndName: queryType[0]),
                    selectedIconAndName(value: 1, iconAndName: queryType[1]),
                    selectedIconAndName(value: 2, iconAndName: queryType[2]),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: kPadding,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                cButton("Export", btnColor: AppColors.iconBG),
                const SizedBox(
                  width: kPadding / 2,
                ),
                cButton("Download Voucher")
              ],
            ),
            const SizedBox(
              height: kPadding,
            ),
            Row(
              children: [
                ctext("Kapil Sharma",
                    fontSize: 24, fontWeight: FontWeight.w800),
                const Spacer(),
                cCard(
                    color: Colors.black,
                    child: cButton("Edit",
                        border: Border.all(color: Colors.black, width: 1.5),
                        icon: IconConstant.edit,
                        iconColor: Colors.black,
                        txtColor: Colors.black,
                        btnColor: AppColors.scafflodBackground))
              ],
            ),
            const SizedBox(
              height: kPadding,
            ),
            Divider(
              color: Colors.black.withOpacity(0.5),
              height: 0,
            ),
            const SizedBox(
              height: kPadding,
            ),
            Wrap(
              spacing: 16,
              runSpacing: 16,
              children: List.generate(
                  btnName.length,
                  (index) => Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          cButton(btnName[index],
                              txtColor: AppColors.black,
                              fontWeight: FontWeight.w500,
                              btnColor: AppColors.vlightOrange),
                        ],
                      )),
            ),
            const SizedBox(
              height: kPadding,
            ),
            Divider(
              color: Colors.black.withOpacity(0.5),
              height: 0,
            ),
            const SizedBox(
              height: kPadding,
            ),
            Wrap(
              spacing: 8,
              children: List.generate(
                  5,
                  (index) => selectedIconAndName(
                      iconAndName: "Day ${index + 1}", value: index)),
            ),
            const SizedBox(
              height: kPadding,
            ),
            cDropDown(
                items: ["Dubai", "London"],
                borderColor: Colors.white,
                fillColor: Colors.white,
                heightPadding: 12),
            const SizedBox(
              height: kPadding / 2,
            ),
            cButton("Package Terms",
                icon: IconConstant.packageTerms,
                padding: const EdgeInsets.all(12)),
            const SizedBox(
              height: kPadding,
            ),
            cCard(
                width: dwidth,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            IconConstant.hotel,
                            height: 30,
                            width: 30,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Flexible(
                            child: ctext("Palm Beach Hotel Bur Dubai",
                                maxLines: 2,
                                fontWeight: FontWeight.w700,
                                fontSize: 16),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: kPadding,
                      ),
                      textWithHeading(
                          subTitle: "27 Mar 2023 05:30 AM", title: "Check-In"),
                      textWithHeading(
                          subTitle: "27 Mar 2023 05:30 AM", title: "Check-Out"),
                      textWithHeading(
                          subTitle: "Standard Room", title: "Room Type"),
                      textWithHeading(subTitle: "1 Double", title: "Check-In"),
                      textWithHeading(subTitle: "American Plan", title: "Meal"),
                      Divider(
                        height: 0,
                        color: AppColors.black50,
                      ),
                      const SizedBox(
                        height: kPadding,
                      ),
                      Column(
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(
                                IconConstant.helicopter,
                                height: 30,
                                width: 30,
                              ),
                              const SizedBox(
                                width: 12,
                              ),
                              Image.asset(
                                IconConstant.clock,
                                height: 15,
                                width: 15,
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Flexible(
                                child: ctext("26-03-2023 05:13 PM TO 05:14 PM",
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 40),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ctext(
                                  "Helicopter Ride",
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                ctext(
                                    "- ALCON HELICOPTER CITY CURCUIT DUBAI - 25 MINUTES (SIC)",
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14),
                                const SizedBox(
                                  height: kPadding / 2,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    cCard(
                                        radius: 6,
                                        color: AppColors.iconBG,
                                        child: Padding(
                                          padding: const EdgeInsets.all(6),
                                          child: Image.asset(
                                            IconConstant.edit,
                                            height: 16,
                                            width: 16,
                                          ),
                                        )),
                                    const SizedBox(
                                      width: 11,
                                    ),
                                    cCard(
                                        radius: 6,
                                        color: AppColors.iconBG,
                                        child: Padding(
                                          padding: const EdgeInsets.all(6),
                                          child: Image.asset(
                                            IconConstant.delete,
                                            height: 16,
                                            width: 16,
                                          ),
                                        )),
                                  ],
                                ),
                                const SizedBox(
                                  height: kPadding,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        color: AppColors.black50,
                        height: 0,
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Column(
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(
                                IconConstant.bus,
                                height: 30,
                                width: 30,
                              ),
                              const SizedBox(
                                width: 12,
                              ),
                              Image.asset(
                                IconConstant.clock,
                                height: 15,
                                width: 15,
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Flexible(
                                child: ctext("26-03-2023 05:13 PM TO 05:14 PM",
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 40),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ctext(
                                  "Bus Ride",
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                ctext(
                                    "- ALCON HELICOPTER CITY CURCUIT DUBAI - 25 MINUTES (SIC)",
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14),
                                const SizedBox(
                                  height: kPadding / 2,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    cCard(
                                        radius: 6,
                                        color: AppColors.iconBG,
                                        child: Padding(
                                          padding: const EdgeInsets.all(6),
                                          child: Image.asset(
                                            IconConstant.edit,
                                            height: 16,
                                            width: 16,
                                          ),
                                        )),
                                    const SizedBox(
                                      width: 11,
                                    ),
                                    cCard(
                                        radius: 6,
                                        color: AppColors.iconBG,
                                        child: Padding(
                                          padding: const EdgeInsets.all(6),
                                          child: Image.asset(
                                            IconConstant.delete,
                                            height: 16,
                                            width: 16,
                                          ),
                                        )),
                                  ],
                                ),
                                const SizedBox(
                                  height: kPadding,
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )),
            const SizedBox(
              height: kPadding,
            ),
            cCard(
                color: AppColors.lightsblue2,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ctext("  Accommodation", fontSize: 14),
                      cCard(
                        shadowPadding: true,
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: cTextFieldCommon(
                            hint: "1N Accommodation With Breakfast",
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      ctext("  Activity/Ticket", fontSize: 14),
                      cCard(
                        shadowPadding: true,
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: cTextFieldCommon(
                            hint: "1N Accommodation With Breakfast",
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      ctext("  Activity/Ticket", fontSize: 14),
                      cCard(
                        shadowPadding: true,
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: cTextFieldCommon(
                            hint: "Simple Dummy text",
                          ),
                        ),
                      )
                    ],
                  ),
                ))
          ]),
        ),
      ),
    );
  }

  Widget selectedIconAndName(
      {required String iconAndName, Function()? onTap, int value = 0}) {
    return GetBuilder<ItineraryController>(
      initState: (_) {},
      builder: (_) {
        return cBounce(
          onPressed: () {
            _.selectedQueryType = value;
            _.update();
            // onTap!();
          },
          child: _.selectedQueryType == value
              ? Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    //color: AppColors.white
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: ctext(iconAndName,
                            fontWeight: FontWeight.bold,
                            color: AppColors.black),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: AppColors.orange,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        width: 45,
                        height: 3,
                      ),
                    ],
                  ),
                )
              : Container(
                  color: Colors.transparent,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ctext(iconAndName,
                        fontWeight: FontWeight.bold, color: AppColors.grey50),
                  )),
        );
      },
    );
  }
}
