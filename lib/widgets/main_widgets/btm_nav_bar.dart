import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_crm/routes/app_routes.dart';
import 'package:travel_crm/widgets/main_widgets/drawer.dart';

import '../../core/constants/constants.dart';
import '../../core/utils/app_colors.dart';
import '../../core/utils/image_constant.dart';
import '../../screens/dashboard/dashboard_controller.dart';
import '../sub_widgets/bottom_sheet.dart';
import '../sub_widgets/c_bounce.dart';
import '../sub_widgets/c_card.dart';
import '../sub_widgets/ctext.dart';

Widget btmNavBar(BuildContext context) {
  List<String> btmIcon = [
    IconConstant.btmTask,
    IconConstant.btmBank,
    IconConstant.settings,
    IconConstant.btmNotification,
  ];
  List<String> btmTitle = ["Task", "Bank", "Settings", "Notifications"];
  List<DrawerTile> bank = [
    DrawerTile(
        icon: IconConstant.category,
        title: "Category",
        onPressed: () {
          Get.back();
          Get.toNamed(AppRoutes.categoryScreen);
        }),
    DrawerTile(
        icon: IconConstant.bankOption,
        title: "Bank / Cash",
        onPressed: () {
          Get.back();
          Get.toNamed(AppRoutes.bankCashScreen);
        }),
    DrawerTile(
        icon: IconConstant.bankTransfer,
        title: "Bank Transfer",
        onPressed: () {
          Get.back();
          Get.toNamed(AppRoutes.bankTransferScreen);
        }),
    DrawerTile(
        icon: IconConstant.income,
        title: "Income",
        onPressed: () {
          Get.back();
          Get.toNamed(AppRoutes.incomeScreen);
        }),
    DrawerTile(
        icon: IconConstant.expense,
        title: "Expenses",
        onPressed: () {
          Get.back();
          Get.toNamed(AppRoutes.expenseScreen);
        }),
    DrawerTile(
        icon: IconConstant.allTransection,
        title: "All Transactions",
        onPressed: () {
          Get.back();
          Get.toNamed(AppRoutes.allTransaction);
        }),
    DrawerTile(
        icon: IconConstant.invoice,
        title: "Invoice",
        onPressed: () {
          Get.back();
          Get.toNamed(AppRoutes.invoice);
        }),
    DrawerTile(
        icon: IconConstant.bill,
        title: "Bill",
        onPressed: () {
          Get.back();
          Get.toNamed(AppRoutes.bill);
        }),
  ];
  List<Function()> btmFn = [
    () {
      Get.toNamed(AppRoutes.tasks);
    },
    () {
      bottomSheet(
          context: context,
          title: "Accounts",
          child: Padding(
              padding: const EdgeInsets.all(16),
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: bank.length,
                separatorBuilder: (context, index) => const SizedBox(
                  height: 16,
                ),
                itemBuilder: (context, index) => cBounce(
                  onPressed: bank[index].onPressed,
                  child: cCard(
                      shadow: false,
                      color: AppColors.orange20.withOpacity(0.1),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          children: [
                            Image.asset(
                              bank[index].icon,
                              height: 20,
                              width: 20,
                            ),
                            const SizedBox(
                              width: kPadding,
                            ),
                            ctext(bank[index].title,
                                fontSize: 14, fontWeight: FontWeight.w400),
                          ],
                        ),
                      )),
                ),
              )));
    },
    () {},
    () {}
  ];
  DashboardController _ = Get.find();
  return cCard(
      radius: kPadding,
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(kPadding),
          topRight: Radius.circular(kPadding)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kPadding, vertical: 10),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.min,
            children: List.generate(
                btmTitle.length,
                (index) => Obx(
                      () => cBounce(
                        onPressed: () {
                          _.selectedBtmNavBar.value = index;

                          btmFn[index]();
                        },
                        child: SizedBox(
                          width: 80,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              cCard(
                                  shadow: false,
                                  color: _.selectedBtmNavBar.value == index
                                      ? AppColors.orange
                                      : Colors.transparent,
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Image.asset(
                                      btmIcon[index],
                                      color: _.selectedBtmNavBar.value == index
                                          ? Colors.white
                                          : Colors.black,
                                      height: 25,
                                      width: 25,
                                    ),
                                  )),
                              const SizedBox(
                                height: 4,
                              ),
                              ctext(btmTitle[index],
                                  fontWeight: FontWeight.w600, maxLines: 1)
                            ],
                          ),
                        ),
                      ),
                    ))),
      ));
}
