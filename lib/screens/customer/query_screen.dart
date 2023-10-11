import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_crm/core/constants/constants.dart';
import 'package:travel_crm/core/utils/app_colors.dart';
import 'package:travel_crm/widgets/sub_widgets/c_dropdown.dart';
import 'package:travel_crm/widgets/sub_widgets/cbutton.dart';

import '../../core/utils/image_constant.dart';
import '../../routes/app_routes.dart';
import '../../widgets/main_widgets/drawer.dart';
import '../../widgets/sub_widgets/c_Card.dart';
import '../../widgets/sub_widgets/c_bounce.dart';
import '../../widgets/sub_widgets/ctext.dart';
import '../../widgets/sub_widgets/ctextfield_common.dart';
import '../../widgets/sub_widgets/text_with_heading.dart';

class QueryScreen extends StatelessWidget {
  const QueryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scafflodBackground,
      drawer: const CDrawer(),
      appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black, size: 30),
          title: ctext("Customer/Query",
              fontSize: 20, fontWeight: FontWeight.w700),
          centerTitle: true,
          elevation: 0,
          backgroundColor: AppColors.scafflodBackground),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ///child-1
            const SizedBox(
              height: 18,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24, right: 24),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  cButton("Stats", icon: IconConstant.chargingCircle),
                  Container(
                    decoration: BoxDecoration(
                        color: AppColors.iconBG,
                        borderRadius: BorderRadius.circular(4)),
                    child: Center(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 6),
                            child: Image.asset(
                              IconConstant.filter,
                              height: 16,
                              width: 16,
                            ),
                          ),
                          ctext("Filter",
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                          Padding(
                            padding: const EdgeInsets.only(right: 6),
                            child: Image.asset(
                              IconConstant.arrow_filter,
                              height: 20,
                              width: 20,
                            ),
                          ),
                        ],
                      ),
                    )),
                  ),
                  cButton("Add Customer", icon: IconConstant.add)
                ],
              ),
            ),
            const SizedBox(
              height: 18,
            ),

            /// child-2
            Container(
              color: AppColors.lightYellow,
              padding: const EdgeInsets.all(15),
              //        color: AppColors.unCheckedWithOpacity,
              child: Row(
                children: [
                  ctext("Show ",
                      color: AppColors.black50, fontWeight: FontWeight.w500),
                  Flexible(
                    flex: 1,
                    child: SizedBox(
                      child: cCard(
                        color: Colors.white,
                        radius: 5,
                        border: true,
                        borderColor: Colors.black26,
                        shadow: false,
                        height: 30,
                        child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Flexible(
                                    child: cTextFieldCommon(
                                  validate: () {},
                                  hint: "10",
                                )),
                                cBounce(
                                  child: const Padding(
                                    padding: EdgeInsets.symmetric(vertical: 7),
                                    child: SizedBox(
                                        // child: Image.asset(
                                        //   ImageConstant.searchIcon,
                                        //   color: Colors.grey,
                                        // ),
                                        ),
                                  ),
                                ),
                              ],
                            )),
                      ),
                    ),
                  ),
                  ctext(" Entries ",
                      color: AppColors.black50, fontWeight: FontWeight.w500),
                  const SizedBox(
                    width: 5,
                  ),
                  Flexible(
                    flex: 4,
                    child: SizedBox(
                      child: cCard(
                        color: Colors.white,
                        border: true,
                        borderColor: Colors.black26,
                        shadow: false,
                        height: 30,
                        radius: 5,
                        child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Flexible(
                                    child: cTextFieldCommon(
                                  validate: () {},
                                )),
                              ],
                            )),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  cButton("Search", btnColor: AppColors.orange)
                ],
              ),
            ),
            const SizedBox(
              height: 12,
            ),

            /// child-3
            Center(
                child: cButton("Reset", width: 80, btnColor: AppColors.iconBG)),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(30),
              child: cBounce(
                onPressed: () {
                  Get.toNamed(AppRoutes.viewQuery);
                },
                child: cCard(
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
                                title: "Status",
                                subTitle: Row(
                                  children: [
                                    InkWell(
                                      onTap: () {},
                                      child: cCard(
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
                                    ),
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
