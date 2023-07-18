import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_crm/core/constants/constants.dart';
import 'package:travel_crm/core/utils/app_colors.dart';
import 'package:travel_crm/routes/app_routes.dart';
import 'package:travel_crm/screens/customer/sub_pages/query_view_controller.dart';
import 'package:travel_crm/widgets/sub_widgets/c_card_with_corner_title.dart';
import 'package:travel_crm/widgets/sub_widgets/c_dropdown.dart';
import 'package:travel_crm/widgets/sub_widgets/cbutton.dart';

import '../../../core/utils/image_constant.dart';
import '../../../widgets/main_widgets/drawer.dart';
import '../../../widgets/sub_widgets/c_Card.dart';
import '../../../widgets/sub_widgets/c_bounce.dart';
import '../../../widgets/sub_widgets/ctext.dart';
import '../../../widgets/sub_widgets/ctextfield_common.dart';
import '../../../widgets/sub_widgets/text_with_heading.dart';
import '../../../widgets/sub_widgets/tour_details.dart';

class QueryViewScreen extends StatelessWidget {
  QueryViewScreen({super.key});

  List<String> ctabNames = [
    'Query Details',
    'Quotation',
    'Itinerary',
    'Task',
    'Billing',
    'Guest Documents',
    'History'
  ];

  @override
  Widget build(BuildContext context) {
    List<Widget> tabFunction = [
      queryDetailWidget(),
      quotationWidget(),
      itinerary(),
      taskWidget(),
      billingWidget(),
      questWidget(),
      historyWidget(),
    ];
    return Scaffold(
      backgroundColor: AppColors.scafflodBackground,
      drawer: const CDrawer(),
      appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black, size: 30),
          title: ctext("Customer", fontSize: 20, fontWeight: FontWeight.w700),
          centerTitle: true,
          elevation: 0,
          backgroundColor: AppColors.scafflodBackground),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(kPadding),
          child: Column(children: [
            Center(
              child: ctext(
                  "Created: 2023-03-29 | Last Updated: 2023-03-31 03:45 PM",
                  fontSize: 10,
                  color: AppColors.black50),
            ),
            const SizedBox(
              height: kPadding - 6,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                cButton("Task",
                    iconHeight: 24,
                    iconWidth: 24,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    icon: IconConstant.reports,
                    fontSize: 14,
                    fontWeight: FontWeight.w600),
                const SizedBox(
                  width: 16,
                ),
                cButton("Edit",
                    iconHeight: 24,
                    iconWidth: 24,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    icon: IconConstant.edit,
                    fontSize: 14,
                    fontWeight: FontWeight.w600),
              ],
            ),
            const SizedBox(
              height: kPadding,
            ),
            GetBuilder<QueryViewController>(
              initState: (_) {},
              builder: (_) {
                return cDropDown(
                    onChanged: ((value) {
                      _.selectedTab = value ?? 0;
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
            tourDetails(),
            const SizedBox(
              height: kPadding,
            ),
            GetBuilder<QueryViewController>(
              initState: (_) {},
              builder: (_) {
                return tabFunction[_.selectedTab];
              },
            ),
            // queryDetailWidget(),
            const SizedBox(
              height: 20,
            ),
            chipWidget(),
          ]),
        ),
      ),
    );
  }

  Widget queryDetailWidget() {
    return Column(
      children: [
        cCardWithCornerTitle(
            cornerTitle: "Query Information",
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              child: Wrap(
                runSpacing: 12,
                spacing: 12,
                children: [
                  textWithHeading(
                      bottomSpace: 0, title: "Inquiry ID : ", subTitle: "#55"),
                  textWithHeading(
                    title: "Mobile Number",
                    subTitle: "7573063404",
                    bottomSpace: 0,
                  ),
                  textWithHeading(
                      bottomSpace: 0, title: "Email", subTitle: "j@gmail.com"),
                  textWithHeading(
                      bottomSpace: 0, title: "Email", subTitle: "j@gmail.com"),
                  textWithHeading(
                      bottomSpace: 0, title: "Email", subTitle: "j@gmail.com"),
                  textWithHeading(
                      bottomSpace: 0, title: "Email", subTitle: "j@gmail.com"),
                  textWithHeading(
                      bottomSpace: 0, title: "Email", subTitle: "j@gmail.com"),
                ],
              ),
            )),
        const SizedBox(
          height: kPadding,
        ),
        cCardWithCornerTitle(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SizedBox(
                    child: cCard(
                      color: Colors.white,
                      border: true,
                      borderColor: Colors.black45,
                      shadow: false,
                      height: 100,
                      child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: cTextFieldCommon(
                            validate: () {},
                          )),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    cButton("Save Note", btnColor: AppColors.orange),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
            cornerTitle: "Note",
            suffix: "+Add Note")
      ],
    );
  }

  Widget quotationWidget() {
    return Column(
      children: [
        SizedBox(
          child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 10,
                    )
                  ]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          decoration: const BoxDecoration(
                              color: AppColors.orange,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(6),
                                  bottomRight: Radius.circular(6))),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 14, vertical: 8),
                            child: ctext("Quotation",
                                fontWeight: FontWeight.w700,
                                fontSize: 14,
                                color: Colors.white),
                          )),
                    ],
                  ),
                  const SizedBox(
                    height: kPadding / 2,
                  ),
                  Container(
                    padding: const EdgeInsets.all(12),
                    color: AppColors.iconBG,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        ctext("ADAMAR232",
                            color: AppColors.white, fontSize: 14),
                        const SizedBox(
                          width: 12,
                        ),
                        ctext("Dubai", color: AppColors.white, fontSize: 10),
                        const Spacer(),
                        Image.asset(
                          IconConstant.more,
                          scale: 5,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                    child: Wrap(
                      runSpacing: 12,
                      spacing: 12,
                      children: [
                        textWithHeading(
                            bottomSpace: 0,
                            title: "Client Name",
                            subTitle: "Jayesh Chudasama"),
                        textWithHeading(
                          title: "Mobile Number",
                          subTitle: "7573063404",
                          bottomSpace: 0,
                        ),
                        textWithHeading(
                            bottomSpace: 0,
                            title: "Email",
                            subTitle: "j@gmail.com"),
                        textWithHeading(
                            bottomSpace: 0,
                            title: "Client Name",
                            subTitle: "Jayesh Chudasama"),
                        textWithHeading(
                          title: "Mobile Number",
                          subTitle: "7573063404",
                          bottomSpace: 0,
                        ),
                        textWithHeading(
                            bottomSpace: 0,
                            title: "Email",
                            subTitle: "j@gmail.com"),
                        textWithHeading(
                            bottomSpace: 0,
                            title: "Client Name",
                            subTitle: "Jayesh Chudasama"),
                        textWithHeading(
                          title: "Mobile Number",
                          subTitle: "7573063404",
                          bottomSpace: 0,
                        ),
                        textWithHeading(
                            bottomSpace: 0,
                            title: "Email",
                            subTitle: "j@gmail.com"),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      cButton("Confirmed",
                          btnColor: AppColors.greenButton,
                          icon: IconConstant.check),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                ],
              )),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            cButton(
              "+ create quotations",
              fontWeight: FontWeight.bold,
              btnColor: AppColors.iconBG,
              onTap: () {
                Get.back();
                Get.toNamed(AppRoutes.quotation);
              },
            ),
          ],
        ),
      ],
    );
  }

  Widget itinerary() {
    return Column(
      children: [
        Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 10,
                  )
                ]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    cButton(
                      "All Itinerary",
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    cBounce(
                      child: Container(
                        decoration: BoxDecoration(
                            color: AppColors.iconBG,
                            borderRadius: BorderRadius.circular(4)),
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ctext("Archive Itinerary",
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500),
                            ],
                          ),
                        )),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        decoration: const BoxDecoration(
                            color: AppColors.orange,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(6),
                                bottomRight: Radius.circular(6))),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 14, vertical: 8),
                          child: ctext("Itinerary",
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                              color: Colors.white),
                        )),
                  ],
                ),
                const SizedBox(
                  height: kPadding / 2,
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  color: AppColors.iconBG,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      ctext("ADAMAR232", color: AppColors.white, fontSize: 14),
                      const SizedBox(
                        width: 12,
                      ),
                      ctext("Dubai", color: AppColors.white, fontSize: 10),
                      const Spacer(),
                      Container(
                        width: 35,
                        height: 35,
                        padding: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.white,
                        ),
                        child: Image.asset(
                          IconConstant.menubar,
                          scale: 2,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 16, right: 16, top: 6, bottom: 16),
                  child: Wrap(
                    runSpacing: 12,
                    spacing: 12,
                    children: [
                      textWithHeading(
                          bottomSpace: 0,
                          title: "Client Name",
                          subTitle: "Jayesh Chudasama"),
                      textWithHeading(
                        title: "Mobile Number",
                        subTitle: "7573063404",
                        bottomSpace: 0,
                      ),
                      textWithHeading(
                          bottomSpace: 0,
                          title: "Email",
                          subTitle: "j@gmail.com"),
                      textWithHeading(
                          bottomSpace: 0,
                          title: "Client Name",
                          subTitle: "Jayesh Chudasama"),
                      textWithHeading(
                        title: "Mobile Number",
                        subTitle: "7573063404",
                        bottomSpace: 0,
                      ),
                      textWithHeading(
                          bottomSpace: 0,
                          title: "Email",
                          subTitle: "j@gmail.com"),
                      textWithHeading(
                          bottomSpace: 0,
                          title: "Client Name",
                          subTitle: "Jayesh Chudasama"),
                      textWithHeading(
                        title: "Mobile Number",
                        subTitle: "7573063404",
                        bottomSpace: 0,
                      ),
                      textWithHeading(
                          bottomSpace: 0,
                          title: "Email",
                          subTitle: "j@gmail.com"),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    cButton("Confirmed",
                        btnColor: AppColors.greenButton,
                        icon: IconConstant.check),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            )),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }

  Widget taskWidget() {
    return GetBuilder<QueryViewController>(
      initState: (_) {},
      builder: (_) {
        return Column(
          children: [
            cCardWithCornerTitle(
              child: Column(
                children: [
                  ...List.generate(3, (index) {
                    _.selectedIndexes.add(false);
                    return taskInfoCard(index, _);
                  }),
                ],
              ),
              cornerTitle: "Quotation",
              suffix: "+Add Task",
              suffixColor: AppColors.iconBG,
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        );
      },
    );
  }

  Widget taskInfoCard(int index, _) {
    List<String> iconString = [
      IconConstant.telephone,
      IconConstant.meeting,
      IconConstant.telephone,
    ];
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, right: 10, left: 10),
      child: Row(
        children: [
          Container(
              width: 40,
              height: 40,
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.iconBG,
              ),
              child: Image.asset(iconString[index])),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: AppColors.cardBackColor,
              ),
              child: Column(
                children: [
                  const SizedBox(
                    width: 5,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ctext("Admin"),
                            ctext("Due On: 2023-05-18 05:15 AM",
                                color: AppColors.black50),
                          ],
                        ),
                      ),
                      /*  Flexible(
                          child: Container(
                            height: 25,
                            width: 25,
                            color: Colors.red,
                            child: CheckboxListTile(
                              contentPadding: const EdgeInsets.all(0),
                              title: const Text(""),
                              subtitle: const Text(""),
                              value: selectedIndexes.contains(index),
                              onChanged: (_) {
                                if (selectedIndexes.contains(index)) {
                                  selectedIndexes.remove(index); // unselect
                                } else {
                                  selectedIndexes.add(index); // select
                                }
                              },
                              controlAffinity: ListTileControlAffinity.leading,
                            ),
                          ),
                        ),*/

                      ///check box
                      Checkbox(
                          side: MaterialStateBorderSide.resolveWith(
                            (states) => const BorderSide(
                                width: 1.0, color: Colors.grey),
                          ),
                          checkColor: AppColors.iconBG,
                          activeColor: Colors.green,
                          value: _.selectedIndexes[index],
                          onChanged: (bool? value) {
                            _.selectedIndexes[index] = value!;
                          }),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ctext("jay", fontWeight: FontWeight.bold),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget chipWidget() {
    List<String> dynamicChips = [
      'new',
      'hot deal',
      'Converted Customer',
      'Follow up',
      'Itinerary Created',
      'Billing Followup',
      'Confirme/Paid',
      'cancelled',
      'Invalid',
    ];
    List<String> imageString = [
      IconConstant.vector1,
      IconConstant.vector2,
      IconConstant.vector3,
      IconConstant.vector,
      IconConstant.vector4,
      IconConstant.vector6,
      IconConstant.vector7,
      IconConstant.vector8,
      IconConstant.vector9,
    ];

    return Wrap(
      spacing: 10.0,
      runSpacing: 15.0,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: List<Widget>.generate(dynamicChips.length, (int index) {
        return Container(
          padding:
              const EdgeInsets.only(top: 15, bottom: 15, left: 30, right: 15),
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage(imageString[index]),
            fit: BoxFit.fill,
          )),
          child: ctext(dynamicChips[index],
              fontSize: 10, fontWeight: FontWeight.bold),
        );
      }),
    );
  }

  Widget billingWidget() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: cCard(
                        color: AppColors.deepBlue,
                        // height: 35,
                        // width: 45,
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(6),
                            topRight: Radius.circular(6)),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 8),
                            child: ctext("₹4380",
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: Colors.white),
                          ),
                        )),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: cCard(
                            color: AppColors.lightdeepBlue,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 18, vertical: 10),
                              child: ctext("Purchase\nAmount",
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600),
                            )),
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: cCard(
                        color: AppColors.orange,
                        // height: 35,
                        // width: 45,
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(6),
                            topRight: Radius.circular(6)),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 25, vertical: 8),
                            child: ctext("₹170",
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: Colors.white),
                          ),
                        )),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: cCard(
                            color: AppColors.lightOrange,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 18, vertical: 10),
                              child: ctext("Gross  \nProfit  ",
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600),
                            )),
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: cCard(
                        color: AppColors.purple,
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(6),
                            topRight: Radius.circular(6)),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 8),
                            child: ctext("₹4552",
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: Colors.white),
                          ),
                        )),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: cCard(
                            color: AppColors.lightPurple,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 18, vertical: 10),
                              child: ctext("Total\nAmount",
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600),
                            )),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        SizedBox(
          child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 10,
                    )
                  ]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: kPadding / 2,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                    child: Wrap(
                      runSpacing: 12,
                      spacing: 12,
                      children: [
                        textWithHeading(
                            bottomSpace: 0,
                            title: "amount",
                            subTitle: "₹2000.00"),
                        textWithHeading(
                          title: "Payment Due Date",
                          subTitle: "2023-05-02",
                          bottomSpace: 0,
                        ),
                        widgetWithHeading(
                            bottomSpace: 0,
                            title: "Status",
                            subTitle: cButton("Partial",
                                height: 30,
                                width: 70,
                                btnColor: AppColors.statusButton)),
                        textWithHeading(
                            bottomSpace: 0,
                            title: "Remark",
                            subTitle: "j@gmailhjgfghfg.com"),
                        widgetWithHeading(
                          title: "Action",
                          subTitle: Row(
                            children: [
                              cCard(
                                  radius: 6,
                                  color: AppColors.iconBG,
                                  shadow: false,
                                  height: 28,
                                  width: 28,
                                  child: Padding(
                                    padding: const EdgeInsets.all(7),
                                    child: Image.asset(
                                      IconConstant.eye,
                                      color: Colors.white,
                                    ),
                                  )),
                              const SizedBox(
                                width: 6,
                              ),
                              cCard(
                                  radius: 6,
                                  color: AppColors.iconBG,
                                  shadow: false,
                                  height: 28,
                                  width: 28,
                                  child: Padding(
                                    padding: const EdgeInsets.all(7),
                                    child: Image.asset(
                                      IconConstant.edit,
                                      color: Colors.white,
                                    ),
                                  )),
                              const SizedBox(
                                width: 6,
                              ),
                              cCard(
                                  radius: 6,
                                  color: AppColors.iconBG,
                                  shadow: false,
                                  height: 28,
                                  width: 28,
                                  child: Padding(
                                    padding: const EdgeInsets.all(7),
                                    child: Image.asset(
                                      IconConstant.delete,
                                      color: Colors.white,
                                    ),
                                  ))
                            ],
                          ),
                          bottomSpace: 0,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              )),
        ),
        const SizedBox(
          height: 10,
        ),
        cCardWithCornerTitle(
            cornerTitle: "invoice",
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: AppColors.orange,
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 4, vertical: 8),
                      child: Image.asset(
                        IconConstant.note,
                        scale: 4,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ctext('Invoice - 02 may 2023', maxLines: 2),
                          ctext('INV-24'),
                        ],
                      ),
                    ),
                    cButton(
                      "View Invoice",
                      height: 30,
                    ),
                  ],
                ))),
      ],
    );
  }

  Widget questWidget() {
    return Column(
      children: [
        SizedBox(
          child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 10,
                    )
                  ]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: kPadding / 2,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                    child: Wrap(
                      runSpacing: 12,
                      spacing: 12,
                      children: [
                        textWithHeading(
                            bottomSpace: 0,
                            title: "amount",
                            subTitle: "₹2000.00"),
                        textWithHeading(
                          title: "Payment Due Date",
                          subTitle: "2023-05-02",
                          bottomSpace: 0,
                        ),
                        widgetWithHeading(
                            bottomSpace: 0,
                            title: "Status",
                            subTitle: cButton("Partial",
                                height: 30,
                                width: 70,
                                btnColor: AppColors.statusButton)),
                        textWithHeading(
                            bottomSpace: 0,
                            title: "Remark",
                            subTitle: "j@gmailhjgfghfg.com"),
                        widgetWithHeading(
                          title: "Action",
                          subTitle: Row(
                            children: [
                              cCard(
                                  radius: 6,
                                  color: AppColors.iconBG,
                                  shadow: false,
                                  height: 28,
                                  width: 28,
                                  child: Padding(
                                    padding: const EdgeInsets.all(7),
                                    child: Image.asset(
                                      IconConstant.eye,
                                      color: Colors.white,
                                    ),
                                  )),
                              const SizedBox(
                                width: 6,
                              ),
                              cCard(
                                  radius: 6,
                                  color: AppColors.iconBG,
                                  shadow: false,
                                  height: 28,
                                  width: 28,
                                  child: Padding(
                                    padding: const EdgeInsets.all(7),
                                    child: Image.asset(
                                      IconConstant.edit,
                                      color: Colors.white,
                                    ),
                                  )),
                              const SizedBox(
                                width: 6,
                              ),
                              cCard(
                                  radius: 6,
                                  color: AppColors.iconBG,
                                  shadow: false,
                                  height: 28,
                                  width: 28,
                                  child: Padding(
                                    padding: const EdgeInsets.all(7),
                                    child: Image.asset(
                                      IconConstant.delete,
                                      color: Colors.white,
                                    ),
                                  ))
                            ],
                          ),
                          bottomSpace: 0,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              )),
        ),
      ],
    );
  }

  Widget historyWidget() {
    return Column(
      children: [
        Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 10,
                  )
                ]),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              child: Wrap(
                runSpacing: 12,
                spacing: 12,
                children: [
                  textWithHeading(
                      bottomSpace: 0, title: "Type: ", subTitle: "#55"),
                  textWithHeading(
                    title: "Description",
                    subTitle: "7573063404",
                    bottomSpace: 0,
                  ),
                  textWithHeading(
                      bottomSpace: 0, title: "By", subTitle: "j@gmail.com"),
                  textWithHeading(
                      bottomSpace: 0, title: "Date", subTitle: "j@gmail.com"),
                ],
              ),
            )),
        const SizedBox(
          height: 10,
        ),
        Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 10,
                  )
                ]),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              child: Wrap(
                runSpacing: 12,
                spacing: 12,
                children: [
                  textWithHeading(
                      bottomSpace: 0, title: "Type: ", subTitle: "#55"),
                  textWithHeading(
                    title: "Description",
                    subTitle: "7573063404",
                    bottomSpace: 0,
                  ),
                  textWithHeading(
                      bottomSpace: 0, title: "By", subTitle: "j@gmail.com"),
                  textWithHeading(
                      bottomSpace: 0, title: "Date", subTitle: "j@gmail.com"),
                ],
              ),
            )),
      ],
    );
  }
}
