import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_crm/core/constants/constants.dart';
import 'package:travel_crm/core/utils/image_constant.dart';
import 'package:travel_crm/widgets/main_widgets/drawer.dart';
import 'package:travel_crm/widgets/sub_widgets/c_Card.dart';

import 'package:travel_crm/widgets/sub_widgets/ctext.dart';

import '../../core/utils/app_colors.dart';
import '../../widgets/main_widgets/btm_nav_bar.dart';
import '../../widgets/sub_widgets/c_bounce.dart';
import '../../widgets/sub_widgets/c_dropdown.dart';
import '../../widgets/sub_widgets/cbutton.dart';
import '../../widgets/sub_widgets/ctextfield_common.dart';

import '../../widgets/sub_widgets/text_with_heading.dart';
import 'dashboard_controller.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<int> statisticsData = [8, 12, 22, 45, 2, 12];
    List<Flag> flags = [
      Flag(
          flagImage: ImageConstant.indiaFlag,
          currency: "INR",
          price: "1.00 ${AppConst.rupee}",
          bgImage: ImageConstant.cardOne),
      Flag(
          flagImage: ImageConstant.uaeFlag,
          currency: "AED",
          price: "23.11 AED",
          bgImage: ImageConstant.cardTwo),
      Flag(
          flagImage: ImageConstant.canadaFlag,
          currency: "CED",
          price: "84.69 C\$",
          bgImage: ImageConstant.cardThree),
      Flag(
          flagImage: ImageConstant.indiaFlag,
          currency: "INR",
          price: "1.00 ${AppConst.rupee}",
          bgImage: ImageConstant.cardFour),
      Flag(
          flagImage: ImageConstant.uaeFlag,
          currency: "AED",
          price: "23.11 AED",
          bgImage: ImageConstant.cardFive),
      Flag(
          flagImage: ImageConstant.canadaFlag,
          currency: "CED",
          price: "84.69 C\$",
          bgImage: ImageConstant.cardSix),
    ];

    DashboardController _ = Get.find();
    return Scaffold(
      backgroundColor: AppColors.scafflodBackground,
      drawer: const CDrawer(),
      appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black, size: 30),
          title: ctext("Dashboard", fontSize: 20, fontWeight: FontWeight.w700),
          centerTitle: true,
          elevation: 0,
          backgroundColor: AppColors.scafflodBackground),
      bottomNavigationBar: btmNavBar(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(kPadding),
          child: Column(
            children: [
              stastics(statisticsData),
              const SizedBox(
                height: kPadding,
              ),
              Wrap(
                  spacing: 16,
                  runSpacing: 16,
                  children: List.generate(
                    flags.length,
                    (index) => cCard(
                        height: 80,
                        width: 100,
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(flags[index].bgImage)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              cCard(
                                  radius: 6,
                                  child: Padding(
                                    padding: const EdgeInsets.all(4),
                                    child: Image.asset(
                                      flags[index].flagImage,
                                      height: 26,
                                    ),
                                  )),
                              Flexible(
                                child: FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: RichText(
                                      maxLines: 1,
                                      overflow: TextOverflow.visible,
                                      softWrap: true,
                                      text: TextSpan(children: [
                                        TextSpan(
                                            text: "${flags[index].currency} - ",
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w700)),
                                        TextSpan(
                                            text: flags[index].price,
                                            style: TextStyle(
                                                color: AppColors.black50,
                                                fontWeight: FontWeight.w400))
                                      ])),
                                ),
                              )
                            ],
                          ),
                        )),
                  )),
              const SizedBox(
                height: kPadding,
              ),
              cCard(
                  child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ctext("Today’s Pending Payment Collection",
                        fontSize: 15, fontWeight: FontWeight.w700),
                    const SizedBox(
                      height: kPadding,
                    ),
                    paymentCollectionTable(),
                  ],
                ),
              )),
              const SizedBox(
                height: kPadding,
              ),
              cCard(
                  child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ctext("Task / Follow-Up's",
                        fontSize: 15, fontWeight: FontWeight.w700),
                    const SizedBox(
                      height: kPadding,
                    ),
                    paymentCollectionTable(),
                  ],
                ),
              )),
              const SizedBox(
                height: kPadding,
              ),
              cCard(
                  child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ctext("Top Lead Sources",
                        fontSize: 15, fontWeight: FontWeight.w700),
                    const SizedBox(
                      height: kPadding,
                    ),
                    leadSourceTable(),
                  ],
                ),
              )),
              const SizedBox(
                height: kPadding,
              ),
              cCard(
                  child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ctext("Accounts",
                        fontSize: 15, fontWeight: FontWeight.w700),
                    const SizedBox(
                      height: kPadding,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        cCard(
                            shadow: false,
                            radius: 6,
                            color: AppColors.lightBrown,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Image.asset(
                                IconConstant.moneyPink,
                                height: 28,
                                width: 28,
                              ),
                            )),
                        SizedBox(
                          width: 82,
                          child: ctext("Cash In Hand",
                              color: AppColors.black50, fontSize: 12),
                        ),
                        ctext('${AppConst.rupee}193,026.23',
                            fontWeight: FontWeight.w700, fontSize: 14)
                      ],
                    ),
                    const SizedBox(
                      height: kPadding,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        cCard(
                            shadow: false,
                            radius: 6,
                            color: AppColors.lightBlue,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Image.asset(
                                IconConstant.bankBlue,
                                height: 28,
                                width: 28,
                              ),
                            )),
                        SizedBox(
                          width: 82,
                          child: ctext("Bank Balance",
                              color: AppColors.black50, fontSize: 12),
                        ),
                        ctext('${AppConst.rupee}193,026.23',
                            fontWeight: FontWeight.w700, fontSize: 14)
                      ],
                    ),
                    const SizedBox(
                      height: kPadding,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        cCard(
                            shadow: false,
                            radius: 6,
                            color: AppColors.lightYellow,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Image.asset(
                                IconConstant.creditCardOrange,
                                height: 28,
                                width: 28,
                              ),
                            )),
                        Flexible(
                          child: SizedBox(
                            width: 82,
                            child: ctext("Outstanding Balance",
                                maxLines: 2,
                                color: AppColors.black50,
                                fontSize: 12),
                          ),
                        ),
                        ctext('${AppConst.rupee}193,026.23',
                            fontWeight: FontWeight.w700, fontSize: 14)
                      ],
                    )
                  ],
                ),
              )),
              const SizedBox(
                height: kPadding,
              ),
              cCard(
                  child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ctext("Financial Report",
                        fontSize: 15, fontWeight: FontWeight.w700),
                    const SizedBox(
                      height: kPadding,
                    ),
                    cCard(
                        gradient: const LinearGradient(colors: [
                          Color(0xFF1DAFA7),
                          Color(0xFF52BFDB),
                          Color(0xFF4CBED8),
                          Color(0xFF22B0AC),
                        ]),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 18, vertical: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ctext("2023 Apr", color: Colors.white),
                              ctext("${AppConst.rupee}178,528.00",
                                  color: Colors.white)
                            ],
                          ),
                        )),
                    const SizedBox(
                      height: kPadding / 2,
                    ),
                    cCard(
                        gradient: const LinearGradient(colors: [
                          Color(0xFFF4BD87),
                          Color(0xFFF889A3),
                          Color(0xFFD67BC3),
                          Color(0xFFF3BF88),
                        ]),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 18, vertical: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ctext("2023 Apr", color: Colors.white),
                              ctext("${AppConst.rupee}178,528.00",
                                  color: Colors.white)
                            ],
                          ),
                        )),
                    const SizedBox(
                      height: kPadding / 2,
                    ),
                    cCard(
                        gradient: const LinearGradient(colors: [
                          Color(0xFFACB4E9),
                          Color(0xFFCA7DCD),
                          Color(0xFFACB7EA),
                        ]),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 18, vertical: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ctext("2023 Apr", color: Colors.white),
                              ctext("${AppConst.rupee}178,528.00",
                                  color: Colors.white)
                            ],
                          ),
                        )),
                    const SizedBox(
                      height: kPadding / 2,
                    ),
                    cCard(
                        gradient: const LinearGradient(colors: [
                          Color(0xFF55DBC1),
                          Color(0xFFCAC97F),
                          Color(0xFFEDBC82),
                          Color(0xFF4BDBC8),
                        ]),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 18, vertical: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ctext("2023 Apr", color: Colors.white),
                              ctext("${AppConst.rupee}178,528.00",
                                  color: Colors.white)
                            ],
                          ),
                        )),
                  ],
                ),
              )),
              const SizedBox(
                height: kPadding,
              ),
              cCard(
                  width: double.maxFinite,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                            child: ctext("Confirm Booking",
                                fontWeight: FontWeight.w700,
                                fontSize: 14,
                                color: Colors.white),
                          )),
                      const SizedBox(
                        height: kPadding / 2,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 6),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            textWithHeading(title: "ID", subTitle: "#13"),
                            textWithHeading(
                                title: "Query Code", subTitle: "#ADMMAR234"),
                            widgetWithHeading(
                                title: "Status",
                                subTitle: cCard(
                                    shadow: false,
                                    radius: 6,
                                    height: 25,
                                    width: 50,
                                    color: AppColors.blue,
                                    child: Center(
                                        child: ctext("Active",
                                            color: Colors.white)))),
                            textWithHeading(
                                title: "Account Type", subTitle: "Bank"),
                            textWithHeading(
                                title: "Account Holder Name",
                                subTitle: "Jayesh Chuda"),
                            textWithHeading(
                                title: "Bank Name", subTitle: "HDFC"),
                            textWithHeading(
                                title: "Opening Balance",
                                subTitle: "${AppConst.rupee}10,000"),
                            widgetWithHeading(
                                title: "Assigned to",
                                subTitle: cDropDown(
                                    height: 35,
                                    hintText: "  Select Assignee",
                                    items: [
                                      'Admin',
                                      'client',
                                      'ajay patel',
                                      "hhkgf ghf"
                                    ])),
                            textWithHeading(
                                title: "Created At",
                                subTitle: "2023-03-23 12:41 AM"),
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
                            )
                          ],
                        ),
                      )
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }

  Widget leadSourceTable() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Table(
                columnWidths: const {0: FlexColumnWidth(2)},
                children: [
                  TableRow(
                    children: [
                      ctext("Name",
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          textAlign: TextAlign.center),
                      ctext("Assign",
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          textAlign: TextAlign.center),
                      ctext("Confirmed",
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          textAlign: TextAlign.center),
                    ],
                  )
                ],
              ),
              // Divider(
              //   color: AppColors.black20,
              //   thickness: 0.8,
              // ),
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 8),
                child: GetBuilder<DashboardController>(
                  initState: (_) {},
                  builder: (_) {
                    return SizedBox(
                      child: SingleChildScrollView(
                          physics: const AlwaysScrollableScrollPhysics(),
                          child: Table(
                            columnWidths: const {0: FlexColumnWidth(2)},
                            children: List.generate(4 * 2 - 1, (index) {
                              return index.isOdd
                                  ? tableRowSpace(3)
                                  : leadSourceTableRow();
                            }),
                          )),
                    );
                  },
                ),
              ),
              // const SizedBox(
              //   height: 12,
              // ),
            ],
          ),
        ),
      ],
    );
  }

  TableRow leadSourceTableRow() {
    return TableRow(
      children: [
        ctext("Jayesh Chudashma",
            color: AppColors.black50, textAlign: TextAlign.center),
        ctext("5", color: AppColors.black50, textAlign: TextAlign.center),
        ctext("7", color: AppColors.black50, textAlign: TextAlign.center)
      ],
    );
  }

  Widget paymentCollectionTable() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 40,
          child: Row(
            children: [
              const SizedBox(
                width: 6,
              ),
              ctext("Show "),
              Flexible(
                child: cCard(
                    radius: 6,
                    width: 30,
                    height: 30,
                    shadow: false,
                    child: Padding(
                      padding: const EdgeInsets.all(6),
                      child: Center(
                        child: cTextFieldCommon(
                          hint: '10',
                        ),
                      ),
                    ),
                    border: true),
              ),
              ctext(" Entries"),
              const Spacer(),
              Flexible(
                flex: 3,
                child: SizedBox(
                  child: cCard(
                    radius: 6,
                    border: true,
                    shadow: false,
                    height: 30,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: GetBuilder<DashboardController>(
                        initState: (_) {},
                        builder: (_) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Flexible(
                                  child: cTextFieldCommon(
                                controller: _.searchFieldController,
                                validate: () {},
                                hint: "Search ID",
                              )),
                              cBounce(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 7),
                                  child: SizedBox(
                                    child: Image.asset(
                                      IconConstant.search,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        // Padding(
        //   padding: const EdgeInsets.all(12),
        //   child: ctext("TODAY'S PAYMENT COLLECTION",
        //       fontSize: 12,
        //       fontWeight: FontWeight.w600,
        //       textAlign: TextAlign.start),
        // ),
        const SizedBox(height: 8),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SizedBox(
            width: 450,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Table(
                  columnWidths: const {0: FlexColumnWidth(0.8)},
                  children: [
                    TableRow(
                      children: [
                        ctext("Query ID",
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            textAlign: TextAlign.center),
                        ctext("Amount",
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            textAlign: TextAlign.center),
                        ctext("Due Date",
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            textAlign: TextAlign.center),
                        ctext("Status",
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            textAlign: TextAlign.center),
                        ctext("Status",
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            textAlign: TextAlign.center),
                      ],
                    )
                  ],
                ),
                Divider(
                  color: AppColors.black20,
                  thickness: 0.8,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 8),
                  child: GetBuilder<DashboardController>(
                    initState: (_) {},
                    builder: (_) {
                      return SizedBox(
                        height: 150,
                        child: SingleChildScrollView(
                            physics: const AlwaysScrollableScrollPhysics(),
                            child: Table(
                              columnWidths: const {0: FlexColumnWidth(0.8)},
                              children: List.generate(12 * 2 - 1, (index) {
                                return index.isOdd
                                    ? tableRowSpace(5)
                                    : paymentCollectionTableRow();
                              }),
                            )),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
              ],
            ),
          ),
        ),
        Center(
            child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: cButton("View More"),
        )),

        // const SizedBox(
        //   height: 12,
        // ),
      ],
    );
  }

  TableRow tableRowSpace(int columnCount) {
    return TableRow(
      children: List.generate(
          columnCount,
          (index) => const SizedBox(
                height: 16,
              )),
    );
  }

  TableRow paymentCollectionTableRow() {
    return TableRow(
      children: [
        ctext("#12345", color: AppColors.black50, textAlign: TextAlign.center),
        ctext("3,500", color: AppColors.black50, textAlign: TextAlign.center),
        ctext("23/01/2022",
            color: AppColors.black50, textAlign: TextAlign.center),
        cCard(
            radius: 6,
            color: Colors.green,
            child: ctext("done",
                color: Colors.white, textAlign: TextAlign.center)),
        ctext("done", color: AppColors.black50, textAlign: TextAlign.center)
      ],
    );
  }

  Widget stastics(List<int> statisticsData) {
    return cCard(
      width: dwidth,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ctext("Statistics", fontSize: 15, fontWeight: FontWeight.w700),
            const SizedBox(
              height: kPadding,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      cCard(
                          color: AppColors.deepBlue,
                          height: 35,
                          width: 45,
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(6),
                              topRight: Radius.circular(6)),
                          child: Center(
                            child: ctext('${statisticsData[0]}',
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: Colors.white),
                          )),
                      cCard(
                          color: AppColors.lightdeepBlue,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 18, vertical: 10),
                            child: ctext("Today’s\nQueries",
                                textAlign: TextAlign.center,
                                maxLines: 2,
                                fontSize: 13,
                                fontWeight: FontWeight.w600),
                          ))
                    ],
                  ),
                ),
                Flexible(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      cCard(
                          color: AppColors.orange,
                          height: 35,
                          width: 45,
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(6),
                              topRight: Radius.circular(6)),
                          child: Center(
                            child: ctext('${statisticsData[1]}',
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: Colors.white),
                          )),
                      cCard(
                          color: AppColors.lightOrange,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 18, vertical: 10),
                            child: ctext("Total\nQueries",
                                textAlign: TextAlign.center,
                                maxLines: 2,
                                fontSize: 13,
                                fontWeight: FontWeight.w600),
                          ))
                    ],
                  ),
                ),
                Flexible(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      cCard(
                          color: AppColors.purple,
                          height: 35,
                          width: 45,
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(6),
                              topRight: Radius.circular(6)),
                          child: Center(
                            child: ctext('${statisticsData[2]}',
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: Colors.white),
                          )),
                      cCard(
                          color: AppColors.lightPurple,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 18, vertical: 10),
                            child: ctext("Today\nConverted",
                                textAlign: TextAlign.center,
                                maxLines: 2,
                                fontSize: 13,
                                fontWeight: FontWeight.w600),
                          ))
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 22,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      cCard(
                          color: AppColors.teal,
                          height: 35,
                          width: 45,
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(6),
                              topRight: Radius.circular(6)),
                          child: Center(
                            child: ctext('${statisticsData[0]}',
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: Colors.white),
                          )),
                      cCard(
                          color: AppColors.lightTeal,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            child: ctext("Total\nConverted",
                                textAlign: TextAlign.center,
                                maxLines: 2,
                                fontSize: 13,
                                fontWeight: FontWeight.w600),
                          ))
                    ],
                  ),
                ),
                Flexible(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      cCard(
                          color: AppColors.green,
                          height: 35,
                          width: 45,
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(6),
                              topRight: Radius.circular(6)),
                          child: Center(
                            child: ctext('${statisticsData[1]}',
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: Colors.white),
                          )),
                      cCard(
                          color: AppColors.lightGreen,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            child: ctext("Pending\nPayment",
                                textAlign: TextAlign.center,
                                maxLines: 2,
                                fontSize: 13,
                                fontWeight: FontWeight.w600),
                          ))
                    ],
                  ),
                ),
                Flexible(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      cCard(
                          color: AppColors.pink,
                          height: 35,
                          width: 45,
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(6),
                              topRight: Radius.circular(6)),
                          child: Center(
                            child: ctext('${statisticsData[2]}',
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: Colors.white),
                          )),
                      cCard(
                          color: AppColors.lightPink,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            child: ctext("Done\nPayment",
                                maxLines: 2,
                                textAlign: TextAlign.center,
                                fontSize: 13,
                                fontWeight: FontWeight.w600),
                          ))
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Flag {
  String flagImage;
  String currency;
  String price;
  String bgImage;

  Flag({
    required this.flagImage,
    required this.currency,
    required this.price,
    required this.bgImage,
  });
}
