import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_crm/core/constants/constants.dart';
import 'package:travel_crm/core/utils/app_colors.dart';
import 'package:travel_crm/routes/app_routes.dart';
import 'package:travel_crm/widgets/sub_widgets/c_card.dart';

import '../../core/utils/image_constant.dart';
import '../sub_widgets/c_bounce.dart';
import '../sub_widgets/ctext.dart';

class CDrawer extends StatefulWidget {
  const CDrawer({super.key});

  @override
  State<CDrawer> createState() => _CDrawerState();
}

class _CDrawerState extends State<CDrawer> {
  int currIndex = 0;
  bool isExpand = false;
  @override
  Widget build(BuildContext context) {
    List<DrawerTile> drawerTile = [
      DrawerTile(
          icon: IconConstant.dashboard,
          title: "Dashboard",
          onPressed: () {
            Get.back();
            Get.toNamed(AppRoutes.dashboard);
          }),
      DrawerTile(
          icon: IconConstant.customer,
          title: "Customers",
          onPressed: () {
            Get.back();
            Get.toNamed(AppRoutes.query);
          }),
      DrawerTile(
          icon: IconConstant.customer,
          title: "Visa",
          onPressed: () {
            // Get.back();
            // Get.toNamed(AppRoutes.query);
          }),
      DrawerTile(
          icon: IconConstant.customer,
          title: "Today's Work",
          onPressed: () {
            // Get.back();
            // Get.toNamed(AppRoutes.query);
          }),
      DrawerTile(
          icon: IconConstant.confirmCalender,
          title: "Bookings",
          onPressed: () {
            Get.back();
            // Get.toNamed(AppRoutes.dashboard);
          }),
      DrawerTile(
          icon: IconConstant.itinerary,
          title: "All Itineraries",
          onPressed: () {
            Get.back();
            Get.toNamed(AppRoutes.itinerary);
          }),
      DrawerTile(
          icon: IconConstant.moneyPink,
          title: "Announcement",
          onPressed: () {
            Get.back();
            Get.toNamed(AppRoutes.annScreen);
          }),
      // DrawerTile(
      //     icon: IconConstant.accounts,
      //     title: "Marketing",
      //     isDropDown: true,
      //     items: [
      //       DrawerTile(
      //           icon: IconConstant.dashboard,
      //           title: "Bulk SMS",
      //           onPressed: () {}),
      //       DrawerTile(
      //           icon: IconConstant.moneyPink,
      //           title: "Bulk Email",
      //           onPressed: () {
      //             Get.back();
      //           }),

      //     ],
      //     onPressed: () {}),
      DrawerTile(
          icon: IconConstant.settings,
          title: "Mailbox",
          onPressed: () {
            Get.back();
          }),
      DrawerTile(
          icon: IconConstant.settings,
          title: "Master Setting",
          onPressed: () {
            Get.back();
            Get.toNamed(AppRoutes.masterSettings);
          }),
      DrawerTile(
          icon: IconConstant.reports,
          title: "Price List",
          isDropDown: true,
          items: [
            DrawerTile(
                icon: IconConstant.dashboard,
                title: "Hotel Price",
                onPressed: () {
                  Get.back();
                  Get.toNamed(AppRoutes.hotelPrice);
                }),
            DrawerTile(
                icon: IconConstant.moneyPink,
                title: "Activity Price",
                onPressed: () {}),
            DrawerTile(
                icon: IconConstant.moneyPink,
                title: "Visa Price",
                onPressed: () {}),
            DrawerTile(
                icon: IconConstant.moneyPink,
                title: "Tour/Transfer Price",
                onPressed: () {}),
          ],
          onPressed: () {
            Get.back();
          }),
      DrawerTile(
          icon: IconConstant.reports,
          title: "Reports",
          isDropDown: true,
          items: [
            DrawerTile(
                icon: IconConstant.dashboard,
                title: "Acitivity Report",
                onPressed: () {}),
            DrawerTile(
                icon: IconConstant.moneyPink,
                title: "Profit/Loss Report",
                onPressed: () {}),
            DrawerTile(
                icon: IconConstant.moneyPink,
                title: "Ledger Report",
                onPressed: () {}),
            DrawerTile(
                icon: IconConstant.moneyPink,
                title: "Agent Report",
                onPressed: () {}),
            DrawerTile(
                icon: IconConstant.moneyPink,
                title: "Tour Report",
                onPressed: () {}),
          ],
          onPressed: () {
            Get.back();
          }),
    ];
    return Drawer(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(45), bottomRight: Radius.circular(45))),
      backgroundColor: AppColors.orange,
      child: Stack(
        children: [
          SizedBox(
            height: dheight,
            child: Image.asset(
              'assets/Images/drawer_bg.png',
              fit: BoxFit.fill,
              height: dheight,
              width: double.maxFinite,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(kPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: kPadding,
                ),
                cBounce(
                  onPressed: () {
                    Get.back();
                    Get.toNamed(AppRoutes.profile);
                  },
                  child: Center(
                    child: Row(
                      children: [
                        Hero(
                          tag: "ProfilePhoto",
                          child: Image.asset(
                            ImageConstant.dummyPerson,
                            height: 70,
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Flexible(
                          child: ctext("Ghandshyam Patel",
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Image.asset(
                          IconConstant.rightArrow,
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Image.asset(
                  ImageConstant.drawerFlash,
                ),
                const SizedBox(
                  height: kPadding,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(
                          drawerTile.length,
                          (index) => drawerTileWidget(
                              index: index,
                              icon: drawerTile[index].icon,
                              title: drawerTile[index].title,
                              isDropDown: drawerTile[index].isDropDown,
                              onPressed: drawerTile[index].onPressed,
                              items: drawerTile[index].items)),
                    ),
                  ),
                ),
                Image.asset(
                  ImageConstant.drawerFlash,
                  height: kPadding,
                ),
                drawerTileWidget(
                  index: 100,
                  icon: IconConstant.logout,
                  title: "Logout",
                  onPressed: () async {
                    await box.clear();
                    await Get.offAllNamed(AppRoutes.login);
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget drawerTileWidget(
      {required String icon,
      required String title,
      required Function() onPressed,
      required int index,
      List<DrawerTile>? items,
      bool? isDropDown = false}) {
    return Column(
      children: [
        cBounce(
          onPressed: () {
            (isDropDown ?? false) ? isExpand = !isExpand : onPressed();
            setState(() {
              currIndex = index;
            });
          },
          child: cCard(
            shadow: false,
            color: currIndex == index ? Colors.white : Colors.transparent,
            width: double.maxFinite,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        icon,
                        height: index == 0 ? 22 : 25,
                        color: currIndex == index ? Colors.black : Colors.white,
                      ),
                      const SizedBox(width: 20),
                      ctext(title,
                          color:
                              currIndex == index ? Colors.black : Colors.white,
                          fontSize: 18),
                      const Spacer(),
                      isDropDown ?? false
                          ? Container(
                              child: Image.asset(
                                IconConstant.downArrow,
                                width: 15,
                                color: currIndex == index
                                    ? Colors.black
                                    : Colors.white,
                              ),
                            )
                          : const SizedBox()
                    ],
                  ),

                  // Flexible(
                  //   child: SizedBox(
                  //     height: bottomPadding ?? kPadding,
                  //   ),
                  // )
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: (isExpand &&
                  currIndex == index &&
                  (isDropDown ?? false) &&
                  items != null)
              ? 4
              : 0,
        ),
        (isExpand &&
                currIndex == index &&
                (isDropDown ?? false) &&
                items != null)
            ? cCard(
                shadow: false,
                color: currIndex == index ? Colors.white : Colors.transparent,
                width: double.maxFinite,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(
                          items.length,
                          (i) => cBounce(
                                onPressed: items[i].onPressed,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Image.asset(items[i].icon,
                                          height: 18, color: Colors.black),
                                      const SizedBox(width: 16),
                                      ctext(items[i].title,
                                          color: Colors.black, fontSize: 14),
                                    ],
                                  ),
                                ),
                              ))),
                ),
              )
            : const SizedBox()
      ],
    );
  }
}

class DrawerTile {
  String icon;
  String title;
  Function() onPressed;
  bool? isDropDown = false;
  List<DrawerTile>? items;

  DrawerTile(
      {required this.icon,
      required this.title,
      required this.onPressed,
      this.isDropDown,
      this.items});
}
