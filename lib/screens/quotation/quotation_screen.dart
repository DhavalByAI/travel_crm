import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:travel_crm/core/constants/constants.dart';
import 'package:travel_crm/screens/quotation/quotation_controller.dart';
import 'package:travel_crm/widgets/sub_widgets/c_Card.dart';

import '../../core/utils/app_colors.dart';
import '../../core/utils/image_constant.dart';
import '../../widgets/main_widgets/drawer.dart';
import '../../widgets/sub_widgets/c_bounce.dart';
import '../../widgets/sub_widgets/c_card_with_corner_title.dart';
import '../../widgets/sub_widgets/c_dropdown.dart';
import '../../widgets/sub_widgets/cbutton.dart';
import '../../widgets/sub_widgets/ctext.dart';
import '../../widgets/sub_widgets/text_with_heading.dart';
import '../../widgets/sub_widgets/tour_details.dart';

class QuotationScreen extends StatelessWidget {
  QuotationScreen({Key? key}) : super(key: key);
  final List<bool> _checkedItems = List<bool>.filled(5, false);
  @override
  Widget build(BuildContext context) {
    List<String> queryType = [
      "Build",
      "Pricing",
      "Final",
    ];
    List<Widget> queryPage = [
      buildWidget(context),
      pricingWidget(),
      finalWidget(),
    ];

    return Scaffold(
      backgroundColor: AppColors.scafflodBackground,
      drawer: const CDrawer(),
      appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black, size: 30),
          title: ctext("", fontSize: 20, fontWeight: FontWeight.w700),
          centerTitle: true,
          elevation: 0,
          backgroundColor: AppColors.scafflodBackground),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              tourDetails(),
              const SizedBox(
                height: 15,
              ),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    selectedIconAndName(value: 0, iconAndName: queryType[0]),
                    selectedIconAndName(value: 1, iconAndName: queryType[1]),
                    selectedIconAndName(value: 2, iconAndName: queryType[2]),
                    const Spacer(),
                    cButton("Export"),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              GetBuilder<QuotationController>(
                initState: (_) {},
                builder: (_) {
                  return queryPage[_.selectedQueryType];
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildWidget(context) {
    List<String> quotationButton = [
      "Accommodation / Hotel",
      "Activity / Ticket",
      "Transportation / Transfer",
      "Visa/Extra",
    ];
    List<Widget> btnPages = [
      hotelWidget(context),
      ticket(),
      transfer(),
      visa()
    ];
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding:
              const EdgeInsets.only(bottom: 15, left: 15, right: 15, top: 15),
          decoration: BoxDecoration(
            color: AppColors.lightsYellow2,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Wrap(
            alignment: WrapAlignment.start,
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 12,
            runSpacing: 12,
            children: [
              selectedButton(value: 0, iconAndName: quotationButton[0]),
              selectedButton(value: 1, iconAndName: quotationButton[1]),
              selectedButton(value: 2, iconAndName: quotationButton[2]),
              selectedButton(value: 3, iconAndName: quotationButton[3]),
            ],
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        GetBuilder<QuotationController>(
          initState: (_) {},
          builder: (_) {
            return btnPages[_.selectedButton];
          },
        ),
      ],
    );
  }

  Widget pricingWidget() {
    List<String> roomsCount = [
      "0",
      "1",
      "2",
      "3",
      '4',
      '5',
      '6',
      '7',
      '8',
      '9'
    ];

    return Column(
      children: [
        cCardWithCornerTitle(
          cornerTitle: "Inclusion",
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(15),
                color: AppColors.iconBG,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    ctext("Item", color: AppColors.white, fontSize: 14),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        ctext("1."),
                        const SizedBox(
                          width: 12,
                        ),
                        Expanded(
                            child: ctext(
                                "1N Accommodation With Breakfast At Palm Beach Hotel Bur Dubai",
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                maxLines: 2)),
                        const SizedBox(
                          width: 12,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: AppColors.iconBG,
                          ),
                          padding: const EdgeInsets.all(8),
                          child: Image.asset(
                            IconConstant.editText,
                            scale: 3,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ctext(" ( Adult - 2 : Child - 0 )",
                              fontSize: 12, color: Colors.red),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: textWithHeading1(
                                  title: "Single :- ",
                                  subTitle: "55.00",
                                  isValue: true,
                                ),
                              ),
                              Container(
                                height: 30,
                                width: 2,
                                color: AppColors.black,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: textWithHeading1(
                                  title: "Double :- ",
                                  subTitle: "55.00",
                                  isValue: true,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: textWithHeading1(
                                  title: "Triple :- ",
                                  subTitle: "55.00",
                                  isValue: true,
                                ),
                              ),
                              Container(
                                height: 30,
                                width: 2,
                                color: AppColors.black,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: textWithHeading1(
                                  title: "Gross :- ",
                                  subTitle: "55.00",
                                  isValue: true,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: kPadding,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: kPadding,
        ),
        cCard(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(15),
                color: AppColors.iconBG,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    ctext("Item", color: AppColors.white, fontSize: 14),
                  ],
                ),
              ),
              ...List.generate(3, (index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          ctext("$index."),
                          const SizedBox(
                            width: 12,
                          ),
                          Expanded(
                              child: ctext(
                                  "1N Accommodation With Breakfast At Palm Beach Hotel Bur Dubai",
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  maxLines: 2)),
                          const SizedBox(
                            width: 12,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: AppColors.iconBG,
                            ),
                            padding: const EdgeInsets.all(8),
                            child: Image.asset(
                              IconConstant.editText,
                              scale: 3,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ctext(" ( Adult - 2 : Child - 0 )",
                                fontSize: 12, color: Colors.red),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: textWithHeading1(
                                    title: "Single :- ",
                                    subTitle: "55.00",
                                    isValue: true,
                                  ),
                                ),
                                Container(
                                  height: 30,
                                  width: 2,
                                  color: AppColors.black,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: textWithHeading1(
                                    title: "Double :- ",
                                    subTitle: "55.00",
                                    isValue: true,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: textWithHeading1(
                                    title: "Triple :- ",
                                    subTitle: "55.00",
                                    isValue: true,
                                  ),
                                ),
                                Container(
                                  height: 30,
                                  width: 2,
                                  color: AppColors.black,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: textWithHeading1(
                                    title: "Gross :- ",
                                    subTitle: "55.00",
                                    isValue: true,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 23,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              })
            ],
          ),
        ),
        const SizedBox(
          height: kPadding,
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 20),
          decoration: BoxDecoration(
            color: AppColors.totalCardColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: textWithHeading1(
                        title: "Total single :-",
                        subTitle: "AED1,521.75",
                        bottomSpace: 0),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Flexible(
                    flex: 6,
                    child: cDropDown(
                        fillColor: AppColors.white,
                        hintText: '0',
                        items: roomsCount,
                        onChanged: (value) {}),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Flexible(
                    flex: 6,
                    child: cDropDown(
                        fillColor: AppColors.white,
                        hintText: '0',
                        items: roomsCount,
                        onChanged: (value) {}),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                ],
              ),
              Divider(
                color: Colors.grey.withOpacity(0.5),
                thickness: 1,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: textWithHeading1(
                        title: "Total single :-",
                        subTitle: "AED1,521.75",
                        bottomSpace: 0),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Flexible(
                    flex: 6,
                    child: cDropDown(
                        fillColor: AppColors.white,
                        hintText: '0',
                        items: roomsCount,
                        onChanged: (value) {}),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Flexible(
                    flex: 6,
                    child: cDropDown(
                        fillColor: AppColors.white,
                        hintText: '0',
                        items: roomsCount,
                        onChanged: (value) {}),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                ],
              ),
              Divider(
                color: Colors.grey.withOpacity(0.5),
                thickness: 1,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: textWithHeading1(
                        title: "Total single :-",
                        subTitle: "AED1,521.75",
                        bottomSpace: 0),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Flexible(
                    flex: 6,
                    child: cDropDown(
                        fillColor: AppColors.white,
                        hintText: '0',
                        items: roomsCount,
                        onChanged: (value) {}),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Flexible(
                    flex: 6,
                    child: cDropDown(
                        fillColor: AppColors.white,
                        hintText: '0',
                        items: roomsCount,
                        onChanged: (value) {}),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                ],
              ),
              Divider(
                color: Colors.grey.withOpacity(0.5),
                thickness: 1,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: textWithHeading1(
                        title: "Total single :-",
                        subTitle: "AED1,521.75",
                        bottomSpace: 0),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Flexible(
                    flex: 6,
                    child: cDropDown(
                        fillColor: AppColors.white,
                        hintText: '0',
                        items: roomsCount,
                        onChanged: (value) {}),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Flexible(
                    flex: 6,
                    child: cDropDown(
                        fillColor: AppColors.white,
                        hintText: '0',
                        items: roomsCount,
                        onChanged: (value) {}),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                ],
              ),
              const SizedBox(
                height: kPadding,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  cButton(
                    "Update Billing",
                    btnColor: AppColors.iconBG,
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  cButton(
                    "Update CALC",
                    txtColor: AppColors.white,
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                padding: const EdgeInsets.all(8),
                color: AppColors.white20,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Flexible(
                      flex: 2,
                      child: ctext("Total:-",
                          color: AppColors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Flexible(
                      child: cDropDown(
                          fillColor: AppColors.white,
                          hintText: '0',
                          items: roomsCount,
                          onChanged: (value) {}),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Flexible(
                      child: cDropDown(
                          fillColor: AppColors.white,
                          hintText: '0',
                          items: roomsCount,
                          onChanged: (value) {}),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                padding: const EdgeInsets.all(12),
                color: AppColors.orange,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Flexible(
                            child: ctext("Total Gross :-",
                                color: AppColors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                maxLines: 2)),
                        const SizedBox(
                          width: 4,
                        ),
                        Flexible(
                          child: Row(
                            children: [
                              ctext("AED1,521.75",
                                  color: AppColors.white,
                                  fontSize: 14,
                                  maxLines: 100,
                                  fontWeight: FontWeight.w600),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: kPadding,
        )
      ],
    );
  }

  Widget finalWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        ctext("Dear Sir,", fontSize: 12, fontWeight: FontWeight.w600),
        const SizedBox(
          height: 4,
        ),
        Row(
          children: [
            Flexible(
              child: ctext(
                  "CopyKindly Provide The Best Rates For Below Enquiry For Dubai At The Earliest",
                  color: Colors.black54,
                  maxLines: 100),
            ),
            cButton(
              "copy",
              icon: IconConstant.copy,
            )
          ],
        ),
        const SizedBox(
          height: kPadding,
        ),
        cCardWithCornerTitle(
          cornerTitle: 'Enquiry Details',
          child: Padding(
            padding: const EdgeInsets.only(top: 0, left: 16, right: 16),
            child: Wrap(
              runSpacing: 0,
              spacing: 16,
              children: [
                textWithHeading(
                    title: "Customer Name", subTitle: "Mr.Kapil sharma"),
                textWithHeading(title: "Enquiry ID", subTitle: "#1"),
                textWithHeading(title: "Nights", subTitle: "1"),
                textWithHeading(title: "Destinations", subTitle: "Dubai"),
                textWithHeading(title: "Check-In", subTitle: "2023-03-26"),
                textWithHeading(title: "Check-Out", subTitle: "2023-03-26"),
                textWithHeading(title: "Query Code", subTitle: "#ADMMAR232"),
                textWithHeading(title: "Query Code", subTitle: "#ADMMAR232"),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: kPadding,
        ),
        cCard(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(15),
                color: AppColors.iconBG,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    ctext("Item", color: AppColors.white, fontSize: 14),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ...List.generate(3, (index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          ctext("$index."),
                          const SizedBox(
                            width: 12,
                          ),
                          Expanded(
                              child: ctext(
                                  "1N Accommodation With Breakfast At Palm Beach Hotel Bur Dubai",
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  maxLines: 2)),
                          const SizedBox(
                            width: 12,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: AppColors.iconBG,
                            ),
                            padding: const EdgeInsets.all(8),
                            child: Image.asset(
                              IconConstant.editText,
                              scale: 3,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ctext(" ( Adult - 2 : Child - 0 )",
                                fontSize: 12, color: Colors.red),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: textWithHeading1(
                                    title: "Single :- ",
                                    subTitle: "55.00",
                                    isValue: true,
                                  ),
                                ),
                                Container(
                                  height: 30,
                                  width: 2,
                                  color: AppColors.black,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: textWithHeading1(
                                    title: "Double :- ",
                                    subTitle: "55.00",
                                    isValue: true,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              })
            ],
          ),
        ),
        const SizedBox(
          height: kPadding,
        ),
        cCard(
          color: AppColors.totalCardColor,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: textWithHeading(
                    subTitle: "AEDI,521,75",
                    title: 'Total Single',
                    bottomSpace: 0),
              ),
              Divider(
                height: 0,
                color: Colors.grey.withOpacity(0.5),
                thickness: 1,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: textWithHeading(
                    subTitle: "AEDI,521,75",
                    title: 'Total Double',
                    bottomSpace: 0),
              ),
              Divider(
                height: 0,
                color: Colors.grey.withOpacity(0.5),
                thickness: 1,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: textWithHeading(
                    subTitle: "70", title: 'Markup', bottomSpace: 0),
              ),
              const SizedBox(
                height: 8,
              ),
              cButton("Grand Total :- AED999.00"),
            ],
          ),
        ),
        const SizedBox(
          height: kPadding,
        ),
        cCardWithCornerTitle(
            child: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: ctext("* All Rate Are Basis On Above Price",
                  maxLines: 2, fontWeight: FontWeight.w600),
            ),
            cornerTitle: "Exclude"),
        const SizedBox(
          height: kPadding,
        ),
      ],
    );
  }

  Widget hotelWidget(BuildContext context) {
    String date = '';
    List<String> ctabNames = [
      'Quest Will Pay',
      'Quest Will paid',
      'Quest Will Pay',
      'Quest Will paid',
      'Quest Will Pay',
    ];
    List<String> roomsCount = [
      "0",
      "1",
      "2",
      "3",
      '4',
      '5',
      '6',
      '7',
      '8',
      '9'
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ctext("Tourism Dirham Fees*", fontWeight: FontWeight.bold),
        const SizedBox(
          height: 10,
        ),
        GetBuilder<QuotationController>(
          initState: (_) {},
          builder: (_) {
            return cDropDown(
                onChanged: ((value) {
                  _.selectedFeesType = value ?? 0;
                  _.update();
                }),
                width: double.maxFinite,
                fillColor: Colors.white,
                heightPadding: 12,
                borderColor: Colors.white,
                items: ctabNames);
          },
        ),
        const SizedBox(
          height: kPadding,
        ),
        cCardWithCornerTitle(
            borderRadius: BorderRadius.circular(10),
            cornerTitle: "Select Room",
            child: Container(
              color: AppColors.lightsblue2,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: Column(
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: cDropDown(
                              fillColor: AppColors.white,
                              hintText: "Select Rooms",
                              items: [
                                "Room Type 1",
                                "Room Type 2",
                                "Room Type 3",
                              ],
                              label: "Hotel Room",
                              onChanged: (value) {}),
                        ),
                        const SizedBox(
                          width: 14,
                        ),
                        Expanded(
                          child: cDropDown(
                              fillColor: AppColors.white,
                              hintText: "Select Types",
                              items: [
                                "Room Type 1",
                                "Room Type 2",
                                "Room Type 3",
                              ],
                              label: "Room Types",
                              onChanged: (value) {}),
                        ),
                        const SizedBox(
                          width: 14,
                        ),
                        Expanded(
                          child: cDropDown(
                              fillColor: AppColors.white,
                              hintText: "Select Types",
                              items: [
                                "Room Type 1",
                                "Room Type 2",
                                "Room Type 3",
                              ],
                              label: "Meal Types",
                              onChanged: (value) {}),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Flexible(
                          child: cDropDown(
                              hintTextColor: AppColors.white,
                              fillColor: AppColors.iconBG.withOpacity(0.75),
                              hintText: '0',
                              items: roomsCount,
                              label: "Hotel Rooms",
                              onChanged: (value) {}),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Flexible(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ctext("Check In"),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: AppColors.iconBG.withOpacity(0.75),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Flexible(
                                      child: ctext(
                                    "DD/MM/YY",
                                    overflow: TextOverflow.ellipsis,
                                  )),
                                  GestureDetector(
                                    child: const Icon(
                                      Icons.date_range_rounded,
                                      size: 15,
                                    ),
                                    onTap: () async {
                                      DateTime? pickedDate = await showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime(1950),
                                          //DateTime.now() - not to allow to choose before today.
                                          lastDate: DateTime(2100));

                                      if (pickedDate != null) {
                                        print(
                                            pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                                        // String formattedDate =
                                        //     DateFormat('yyyy-MM-dd')
                                        //         .format(pickedDate);
                                        // print(
                                        //     formattedDate); //formatted date output using intl package =>  2021-03-16
                                        // date =
                                        //     formattedDate; //set output date to TextField value.
                                      } else {}
                                    },
                                  )
                                ],
                              ),
                            )
                          ],
                        )),
                        const SizedBox(
                          width: 12,
                        ),
                        Flexible(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ctext("Check Out"),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: AppColors.iconBG.withOpacity(0.75),
                              ),
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Flexible(
                                      child: ctext(
                                    "DD/MM/YY",
                                    overflow: TextOverflow.ellipsis,
                                  )),
                                  GestureDetector(
                                    child: const Icon(
                                      Icons.date_range_rounded,
                                      size: 15,
                                    ),
                                    onTap: () async {
                                      DateTime? pickedDate = await showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime(1950),
                                          //DateTime.now() - not to allow to choose before today.
                                          lastDate: DateTime(2100));

                                      if (pickedDate != null) {
                                        print(
                                            pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                                        // String formattedDate =
                                        //     DateFormat('yyyy-MM-dd')
                                        //         .format(pickedDate);
                                        // print(
                                        //     formattedDate); //formatted date output using intl package =>  2021-03-16
                                        // date =
                                        //     formattedDate; //set output date to TextField value.
                                      } else {}
                                    },
                                  )
                                ],
                              ),
                            )
                          ],
                        )),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Wrap(
                      alignment: WrapAlignment.center,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        ...List.generate(5, (index) {
                          return Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: AppColors.white),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ColoredBox(
                                    color: AppColors.lightOrange,
                                    child: SizedBox(
                                      height: 20,
                                      width: 20,
                                      child: Checkbox(
                                        shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.zero),
                                        fillColor:
                                            MaterialStateColor.resolveWith(
                                          (Set<MaterialState> states) {
                                            if (states.contains(
                                                MaterialState.disabled)) {
                                              return AppColors.black;
                                            }
                                            return AppColors.orange;
                                          },
                                        ),
                                        materialTapTargetSize:
                                            MaterialTapTargetSize.padded,
                                        splashRadius: 0,
                                        checkColor: Colors.white,
                                        side: BorderSide.none,
                                        value: _checkedItems[index],
                                        onChanged: (bool? value) {
                                          _checkedItems[index] = value!;
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                                ctext("Day ${index + 1}",
                                    fontSize: 12, fontWeight: FontWeight.w500),
                                const SizedBox(
                                  width: 5,
                                ),
                              ],
                            ),
                          );
                        })
                      ],
                    ),
                  ],
                ),
              ),
            )),
        const SizedBox(
          height: kPadding,
        ),
        cCardWithCornerTitle(
            borderRadius: BorderRadius.circular(10),
            cornerTitle: "Enter Number Of Rooms",
            child: Container(
              color: AppColors.lightsblue2,
              child: Padding(
                  padding: const EdgeInsets.all(kPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Flexible(
                            child: cDropDown(
                                fillColor: AppColors.white,
                                hintText: '0',
                                items: roomsCount,
                                label: "Single",
                                onChanged: (value) {}),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          Flexible(
                              child: cDropDown(
                                  fillColor: AppColors.white,
                                  hintText: '0',
                                  items: roomsCount,
                                  label: "Double",
                                  onChanged: (value) {})),
                          const SizedBox(
                            width: 12,
                          ),
                          Flexible(
                              child: cDropDown(
                                  fillColor: AppColors.white,
                                  hintText: '0',
                                  items: roomsCount,
                                  label: "Triple",
                                  onChanged: (value) {})),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Flexible(
                            child: cDropDown(
                                fillColor: AppColors.white,
                                hintText: '0',
                                items: roomsCount,
                                label: "Quad",
                                onChanged: (value) {}),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          Flexible(
                              child: cDropDown(
                                  fillColor: AppColors.white,
                                  hintText: '0',
                                  items: roomsCount,
                                  label: "CWB",
                                  onChanged: (value) {})),
                          const SizedBox(
                            width: 12,
                          ),
                          Flexible(
                              child: cDropDown(
                                  fillColor: AppColors.white,
                                  hintText: '0',
                                  items: roomsCount,
                                  label: "CNB",
                                  onChanged: (value) {})),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Flexible(
                            child: cDropDown(
                                fillColor: AppColors.white,
                                hintText: '0',
                                items: roomsCount,
                                label: "Extra Bed",
                                onChanged: (value) {}),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          const Flexible(child: SizedBox()),
                          const SizedBox(
                            width: 12,
                          ),
                          const Flexible(child: SizedBox()),
                        ],
                      ),
                    ],
                  )),
            )),
        const SizedBox(
          height: kPadding,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            cButton("+ Add",
                border: Border.all(
                  color: AppColors.orange40,
                  width: 1.5,
                )),
            const SizedBox(
              width: 12,
            ),
            cButton("Delete",
                txtColor: AppColors.white,
                btnColor: AppColors.iconBG,
                icon: IconConstant.delete,
                border: Border.all(
                  color: AppColors.grey30,
                  width: 1.5,
                ))
          ],
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }

  Widget ticket() {
    List<String> ctabNames = [
      'Quest Will Pay',
      'Quest Will paid',
      'Quest Will Pay',
      'Quest Will paid',
      'Quest Will Pay',
    ];
    List<String> roomsCount = [
      "0",
      "1",
      "2",
      "3",
      '4',
      '5',
      '6',
      '7',
      '8',
      '9'
    ];
    List<String> activity = [
      "Select Activity",
      "common Activity",
      "Special Acticity",
      "Select Activity",
      "common Activity",
      "Special Acticity",
      "Select Activity",
      "common Activity",
      "Special Acticity",
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ctext("Tourism Dirham Fees*", fontWeight: FontWeight.bold),
        const SizedBox(
          height: 10,
        ),
        GetBuilder<QuotationController>(
          initState: (_) {},
          builder: (_) {
            return cDropDown(
                onChanged: ((value) {
                  _.selectedFeesType = value ?? 0;
                  _.update();
                }),
                width: double.maxFinite,
                fillColor: Colors.white,
                heightPadding: 12,
                borderColor: Colors.white,
                items: ctabNames);
          },
        ),
        const SizedBox(
          height: 25,
        ),
        cCard(
            width: dwidth,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Container(
                    decoration: const BoxDecoration(
                        color: AppColors.orange,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(6),
                            bottomRight: Radius.circular(6))),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 8),
                      child: ctext("Hotels",
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                          color: Colors.white),
                    )),
                const SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: AppColors.white),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ColoredBox(
                            color: AppColors.lightBlue,
                            child: SizedBox(
                              height: 20,
                              width: 20,
                              child: Checkbox(
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.zero),
                                fillColor: MaterialStateColor.resolveWith(
                                  (Set<MaterialState> states) {
                                    if (states
                                        .contains(MaterialState.disabled)) {
                                      return AppColors.black;
                                    }
                                    return AppColors.iconBG2;
                                  },
                                ),
                                materialTapTargetSize:
                                    MaterialTapTargetSize.padded,
                                splashRadius: 0,
                                checkColor: Colors.white,
                                side: BorderSide.none,
                                value: _checkedItems[0],
                                onChanged: (bool? value) {
                                  _checkedItems[0] = value!;
                                },
                              ),
                            ),
                          ),
                        ),
                        ctext("Palm Beach Hotel Bur Dubai",
                            fontSize: 12, fontWeight: FontWeight.w500),
                        const SizedBox(
                          width: 5,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                    decoration: const BoxDecoration(
                        color: AppColors.orange,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(6),
                            bottomRight: Radius.circular(6))),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 8),
                      child: ctext("Activity/Ticket",
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                          color: Colors.white),
                    )),
                const SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: AppColors.white),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ColoredBox(
                                color: AppColors.lightBlue,
                                child: SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: Checkbox(
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.zero),
                                    fillColor: MaterialStateColor.resolveWith(
                                      (Set<MaterialState> states) {
                                        if (states
                                            .contains(MaterialState.disabled)) {
                                          return AppColors.black;
                                        }
                                        return AppColors.iconBG2;
                                      },
                                    ),
                                    materialTapTargetSize:
                                        MaterialTapTargetSize.padded,
                                    splashRadius: 0,
                                    checkColor: Colors.white,
                                    side: BorderSide.none,
                                    value: _checkedItems[0],
                                    onChanged: (bool? value) {
                                      _checkedItems[0] = value!;
                                    },
                                  ),
                                ),
                              ),
                            ),
                            ctext("MARINA DHOW CRUISE TICKETS",
                                fontSize: 12, fontWeight: FontWeight.w500),
                            const SizedBox(
                              width: 5,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: AppColors.white),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ColoredBox(
                                color: AppColors.lightBlue,
                                child: SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: Checkbox(
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.zero),
                                    fillColor: MaterialStateColor.resolveWith(
                                      (Set<MaterialState> states) {
                                        if (states
                                            .contains(MaterialState.disabled)) {
                                          return AppColors.black;
                                        }
                                        return AppColors.iconBG2;
                                      },
                                    ),
                                    materialTapTargetSize:
                                        MaterialTapTargetSize.padded,
                                    splashRadius: 0,
                                    checkColor: Colors.white,
                                    side: BorderSide.none,
                                    value: _checkedItems[0],
                                    onChanged: (bool? value) {
                                      _checkedItems[0] = value!;
                                    },
                                  ),
                                ),
                              ),
                            ),
                            ctext("DESERT SAFARI CAMP (STANDARD) TICKETS",
                                fontSize: 12, fontWeight: FontWeight.w500),
                            const SizedBox(
                              width: 5,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: AppColors.white),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ColoredBox(
                                color: AppColors.lightBlue,
                                child: SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: Checkbox(
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.zero),
                                    fillColor: MaterialStateColor.resolveWith(
                                      (Set<MaterialState> states) {
                                        if (states
                                            .contains(MaterialState.disabled)) {
                                          return AppColors.black;
                                        }
                                        return AppColors.iconBG2;
                                      },
                                    ),
                                    materialTapTargetSize:
                                        MaterialTapTargetSize.padded,
                                    splashRadius: 0,
                                    checkColor: Colors.white,
                                    side: BorderSide.none,
                                    value: _checkedItems[0],
                                    onChanged: (bool? value) {
                                      _checkedItems[0] = value!;
                                    },
                                  ),
                                ),
                              ),
                            ),
                            ctext("GLOBAL VILLAGE ENTRY TICKETS",
                                fontSize: 12, fontWeight: FontWeight.w500),
                            const SizedBox(
                              width: 5,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            )),
        const SizedBox(
          height: 20,
        ),
        cCardWithCornerTitle(
            shadow: false,
            color: AppColors.scafflodBackground,
            borderRadius: BorderRadius.circular(10),
            cornerTitle: "Select Rooms",
            childCornerPadding: false,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  color: AppColors.lightsblue2,
                  child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Flexible(
                                flex: 6,
                                child: cDropDown(
                                    fillColor: AppColors.white,
                                    hintText: '0',
                                    items: activity,
                                    label: "Activity",
                                    onChanged: (value) {}),
                              ),
                              const SizedBox(
                                width: 12,
                              ),
                              Flexible(
                                  flex: 3,
                                  child: cDropDown(
                                      fillColor: AppColors.iconBG2,
                                      hintText: '0',
                                      items: roomsCount,
                                      label: "Adult",
                                      onChanged: (value) {})),
                              const SizedBox(
                                width: 12,
                              ),
                              Flexible(
                                  flex: 3,
                                  child: cDropDown(
                                      fillColor: AppColors.iconBG2,
                                      hintText: '0',
                                      items: roomsCount,
                                      label: "Child",
                                      onChanged: (value) {})),
                              const SizedBox(
                                width: 12,
                              ),
                              Flexible(
                                  child: Column(
                                children: [
                                  ctext(""),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.red,
                                    ),
                                    padding: const EdgeInsets.all(5),
                                    child: Image.asset(
                                      IconConstant.delete,
                                      scale: 20,
                                    ),
                                  )
                                ],
                              )),
                            ],
                          ),
                        ],
                      )),
                ),
                const SizedBox(
                  height: 24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    cButton("+ Add",
                        border: Border.all(
                          color: AppColors.orange40,
                          width: 1.5,
                        )),
                    const SizedBox(
                      width: 12,
                    ),
                    cButton("Submit",
                        txtColor: AppColors.white,
                        btnColor: AppColors.iconBG,
                        border: Border.all(
                          color: AppColors.grey30,
                          width: 1.5,
                        ))
                  ],
                ),
              ],
            )),
      ],
    );
  }

  Widget transfer() {
    List<String> ctabNames = [
      'Quest Will Pay',
      'Quest Will paid',
      'Quest Will Pay',
      'Quest Will paid',
      'Quest Will Pay',
    ];
    List<String> roomsCount = [
      "0",
      "1",
      "2",
      "3",
      '4',
      '5',
      '6',
      '7',
      '8',
      '9'
    ];
    List<String> activity = [
      "Select Activity",
      "common Activity",
      "Special Acticity",
      "Select Activity",
      "common Activity",
      "Special Acticity",
      "Select Activity",
      "common Activity",
      "Special Acticity",
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        cCard(
            width: dwidth,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Container(
                    decoration: const BoxDecoration(
                        color: AppColors.orange,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(6),
                            bottomRight: Radius.circular(6))),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 8),
                      child: ctext("Hotels",
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                          color: Colors.white),
                    )),
                const SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: AppColors.white),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ColoredBox(
                            color: AppColors.lightBlue,
                            child: SizedBox(
                              height: 20,
                              width: 20,
                              child: Checkbox(
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.zero),
                                fillColor: MaterialStateColor.resolveWith(
                                  (Set<MaterialState> states) {
                                    if (states
                                        .contains(MaterialState.disabled)) {
                                      return AppColors.black;
                                    }
                                    return AppColors.iconBG2;
                                  },
                                ),
                                materialTapTargetSize:
                                    MaterialTapTargetSize.padded,
                                splashRadius: 0,
                                checkColor: Colors.white,
                                side: BorderSide.none,
                                value: _checkedItems[0],
                                onChanged: (bool? value) {
                                  _checkedItems[0] = value!;
                                },
                              ),
                            ),
                          ),
                        ),
                        ctext("Palm Beach Hotel Bur Dubai",
                            fontSize: 12, fontWeight: FontWeight.w500),
                        const SizedBox(
                          width: 5,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                    decoration: const BoxDecoration(
                        color: AppColors.orange,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(6),
                            bottomRight: Radius.circular(6))),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 8),
                      child: ctext("Activity/Ticket",
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                          color: Colors.white),
                    )),
                const SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: AppColors.white),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ColoredBox(
                                color: AppColors.lightBlue,
                                child: SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: Checkbox(
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.zero),
                                    fillColor: MaterialStateColor.resolveWith(
                                      (Set<MaterialState> states) {
                                        if (states
                                            .contains(MaterialState.disabled)) {
                                          return AppColors.black;
                                        }
                                        return AppColors.iconBG2;
                                      },
                                    ),
                                    materialTapTargetSize:
                                        MaterialTapTargetSize.padded,
                                    splashRadius: 0,
                                    checkColor: Colors.white,
                                    side: BorderSide.none,
                                    value: _checkedItems[0],
                                    onChanged: (bool? value) {
                                      _checkedItems[0] = value!;
                                    },
                                  ),
                                ),
                              ),
                            ),
                            ctext("MARINA DHOW CRUISE TICKETS",
                                fontSize: 12, fontWeight: FontWeight.w500),
                            const SizedBox(
                              width: 5,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: AppColors.white),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ColoredBox(
                                color: AppColors.lightBlue,
                                child: SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: Checkbox(
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.zero),
                                    fillColor: MaterialStateColor.resolveWith(
                                      (Set<MaterialState> states) {
                                        if (states
                                            .contains(MaterialState.disabled)) {
                                          return AppColors.black;
                                        }
                                        return AppColors.iconBG2;
                                      },
                                    ),
                                    materialTapTargetSize:
                                        MaterialTapTargetSize.padded,
                                    splashRadius: 0,
                                    checkColor: Colors.white,
                                    side: BorderSide.none,
                                    value: _checkedItems[0],
                                    onChanged: (bool? value) {
                                      _checkedItems[0] = value!;
                                    },
                                  ),
                                ),
                              ),
                            ),
                            ctext("DESERT SAFARI CAMP (STANDARD) TICKETS",
                                fontSize: 12, fontWeight: FontWeight.w500),
                            const SizedBox(
                              width: 5,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: AppColors.white),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ColoredBox(
                                color: AppColors.lightBlue,
                                child: SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: Checkbox(
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.zero),
                                    fillColor: MaterialStateColor.resolveWith(
                                      (Set<MaterialState> states) {
                                        if (states
                                            .contains(MaterialState.disabled)) {
                                          return AppColors.black;
                                        }
                                        return AppColors.iconBG2;
                                      },
                                    ),
                                    materialTapTargetSize:
                                        MaterialTapTargetSize.padded,
                                    splashRadius: 0,
                                    checkColor: Colors.white,
                                    side: BorderSide.none,
                                    value: _checkedItems[0],
                                    onChanged: (bool? value) {
                                      _checkedItems[0] = value!;
                                    },
                                  ),
                                ),
                              ),
                            ),
                            ctext("GLOBAL VILLAGE ENTRY TICKETS",
                                fontSize: 12, fontWeight: FontWeight.w500),
                            const SizedBox(
                              width: 5,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                )
              ],
            )),
        const SizedBox(
          height: 20,
        ),
        cCardWithCornerTitle(
            shadow: false,
            color: AppColors.scafflodBackground,
            borderRadius: BorderRadius.circular(10),
            cornerTitle: "Select Rooms",
            childCornerPadding: false,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  color: AppColors.lightsblue2,
                  child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.red,
                                ),
                                padding: const EdgeInsets.all(8),
                                child: const Icon(
                                  Icons.close_sharp,
                                  color: AppColors.white,
                                  size: 20,
                                ),
                              )
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Flexible(
                                child: cDropDown(
                                    fillColor: AppColors.white,
                                    hintText: '0',
                                    items: activity,
                                    label: "Select Definations",
                                    onChanged: (value) {}),
                              ),
                              const SizedBox(
                                width: 12,
                              ),
                              Column(
                                children: [
                                  ctext(""),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Flexible(
                                child: cDropDown(
                                    fillColor: AppColors.white,
                                    hintText: '0',
                                    items: activity,
                                    label: "Transfer Type",
                                    onChanged: (value) {}),
                              ),
                              const SizedBox(
                                width: 12,
                              ),
                              Flexible(
                                child: cDropDown(
                                    fillColor: AppColors.white,
                                    hintText: '0',
                                    items: activity,
                                    label: "Seats",
                                    onChanged: (value) {}),
                              ),
                              const SizedBox(
                                width: 12,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Flexible(
                                  flex: 3,
                                  child: cDropDown(
                                      fillColor: AppColors.iconBG2,
                                      hintText: '0',
                                      items: roomsCount,
                                      label: "Adult",
                                      onChanged: (value) {})),
                              const SizedBox(
                                width: 12,
                              ),
                              Flexible(
                                  flex: 3,
                                  child: cDropDown(
                                      fillColor: AppColors.iconBG2,
                                      hintText: '0',
                                      items: roomsCount,
                                      label: "Child",
                                      onChanged: (value) {})),
                              const SizedBox(
                                width: 12,
                              ),
                              Flexible(
                                  flex: 3,
                                  child: cDropDown(
                                      fillColor: AppColors.iconBG2,
                                      hintText: '0',
                                      items: roomsCount,
                                      label: "Guide Charge",
                                      onChanged: (value) {})),
                              const SizedBox(
                                width: 12,
                              ),
                              Flexible(
                                  child: Column(
                                children: [
                                  ctext(""),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: AppColors.iconBG,
                                    ),
                                    padding: const EdgeInsets.all(12),
                                    child:
                                        Image.asset(IconConstant.add, scale: 5),
                                  )
                                ],
                              )),
                            ],
                          ),
                        ],
                      )),
                ),
                const SizedBox(
                  height: 24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    cButton("+ Add",
                        border: Border.all(
                          color: AppColors.orange40,
                          width: 1.5,
                        )),
                    const SizedBox(
                      width: 12,
                    ),
                    cButton("Submit",
                        txtColor: AppColors.white,
                        btnColor: AppColors.iconBG,
                        border: Border.all(
                          color: AppColors.grey30,
                          width: 1.5,
                        ))
                  ],
                ),
              ],
            )),
      ],
    );
  }

  Widget visa() {
    List<String> ctabNames = [
      'Quest Will Pay',
      'Quest Will paid',
      'Quest Will Pay',
      'Quest Will paid',
      'Quest Will Pay',
    ];
    List<String> roomsCount = [
      "0",
      "1",
      "2",
      "3",
      '4',
      '5',
      '6',
      '7',
      '8',
      '9'
    ];
    List<String> activity = [
      "Select Activity",
      "common Activity",
      "Special Acticity",
      "Select Activity",
      "common Activity",
      "Special Acticity",
      "Select Activity",
      "common Activity",
      "Special Acticity",
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        cCardWithCornerTitle(
            shadow: false,
            color: AppColors.scafflodBackground,
            borderRadius: BorderRadius.circular(10),
            cornerTitle: "Select Rooms",
            childCornerPadding: false,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  color: AppColors.lightsblue2,
                  child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Flexible(
                                flex: 6,
                                child: cDropDown(
                                    fillColor: AppColors.white,
                                    hintText: '0',
                                    items: activity,
                                    label: "Activity",
                                    onChanged: (value) {}),
                              ),
                              const SizedBox(
                                width: 12,
                              ),
                              Flexible(
                                  flex: 3,
                                  child: cDropDown(
                                      fillColor: AppColors.iconBG2,
                                      hintText: '0',
                                      items: roomsCount,
                                      label: "Adult",
                                      onChanged: (value) {})),
                              const SizedBox(
                                width: 12,
                              ),
                              Flexible(
                                  flex: 3,
                                  child: cDropDown(
                                      fillColor: AppColors.iconBG2,
                                      hintText: '0',
                                      items: roomsCount,
                                      label: "Child",
                                      onChanged: (value) {})),
                              const SizedBox(
                                width: 12,
                              ),
                              Flexible(
                                  child: Column(
                                children: [
                                  ctext(""),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.red,
                                    ),
                                    padding: const EdgeInsets.all(5),
                                    child: Image.asset(
                                      IconConstant.delete,
                                      scale: 20,
                                    ),
                                  )
                                ],
                              )),
                            ],
                          ),
                        ],
                      )),
                ),
                const SizedBox(
                  height: 24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    cButton("+ Add",
                        border: Border.all(
                          color: AppColors.orange40,
                          width: 1.5,
                        )),
                    const SizedBox(
                      width: 12,
                    ),
                    cButton("Submit",
                        txtColor: AppColors.white,
                        btnColor: AppColors.iconBG,
                        border: Border.all(
                          color: AppColors.grey30,
                          width: 1.5,
                        ))
                  ],
                ),
              ],
            )),
      ],
    );
  }

  Widget selectedIconAndName(
      {required String iconAndName, Function()? onTap, int value = 0}) {
    return GetBuilder<QuotationController>(
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

  Widget selectedButton(
      {required String iconAndName, Function()? onTap, int value = 0}) {
    return GetBuilder<QuotationController>(
      initState: (_) {},
      builder: (_) {
        return cBounce(
            onPressed: () {
              _.selectedButton = value;
              _.update();
              // onTap!();
            },
            child: _.selectedButton == value
                ? Container(
                    decoration: BoxDecoration(
                        color: AppColors.orange,
                        borderRadius: BorderRadius.circular(6)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ctext(iconAndName, color: Colors.white),
                    ),
                  )
                : Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: AppColors.orange40),
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(6)),
                    child: ctext(iconAndName)));
      },
    );
  }
}
