import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:travel_crm/core/constants/constants.dart';
import 'package:travel_crm/widgets/sub_widgets/c_card.dart';
import 'package:travel_crm/widgets/sub_widgets/cbutton.dart';
import 'package:travel_crm/widgets/sub_widgets/ctextfield_common.dart';
import 'package:travel_crm/widgets/sub_widgets/list_view_pegination.dart';
import 'package:image_picker/image_picker.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/date_conversion.dart';
import '../../../core/utils/image_constant.dart';
import '../../../widgets/main_widgets/btm_nav_bar.dart';
import '../../../widgets/main_widgets/drawer.dart';
import '../../../widgets/sub_widgets/bottom_sheet.dart';
import '../../../widgets/sub_widgets/c_bounce.dart';
import '../../../widgets/sub_widgets/c_dropdown.dart';
import '../../../widgets/sub_widgets/ctext.dart';
import '../../../widgets/sub_widgets/ctextfield.dart';
import '../../../widgets/sub_widgets/delete_dialogue.dart';
import '../../../widgets/sub_widgets/search_button.dart';
import '../../../widgets/sub_widgets/text_with_heading.dart';
import 'activity_controller.dart';

class ActivityScreen extends StatelessWidget {
  ActivityScreen({super.key});
  final RefreshController refreshController =
      RefreshController(initialRefresh: false);
  final ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CDrawer(),
      backgroundColor: AppColors.scafflodBackground,
      appBar: AppBar(
          iconTheme: const IconThemeData(size: 30, color: Colors.black),
          title: ctext("Activity", fontSize: 20, fontWeight: FontWeight.w700),
          centerTitle: true,
          elevation: 0,
          backgroundColor: AppColors.scafflodBackground),
      bottomNavigationBar: btmNavBar(context),
      body: GetBuilder<ActivityController>(
        initState: (_) {},
        builder: (_) {
          if (_.dataList.isNotEmpty) {
            return ListViewPagination(
              controller: refreshController,
              scrollController: scrollController,
              onLoad: () {
                _.dataAPI(_.page + 1);
              },
              onRefresh: () {
                _.page = 1;
                _.dataAPI(1);
              },
              child: Padding(
                padding: const EdgeInsets.all(kPadding),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    searchButton(
                        onPressed: () {
                          _.page = 1;
                          _.dataAPI(_.page);
                        },
                        searchController: _.searchController),
                    const SizedBox(
                      height: 16,
                    ),
                    cButton("+ Add Activity", onTap: () {
                      addData(context, _);
                    }),
                    const SizedBox(
                      height: kPadding,
                    ),
                    ListView.separated(
                        shrinkWrap: true,
                        controller: scrollController,
                        itemBuilder: (context, index) {
                          return cCard(
                              child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                textWithHeading(
                                    subTitle:
                                        _.dataList[index]['name'].toString(),
                                    title: "Name"),
                                textWithHeading(
                                    subTitle: _.dataList[index]['destination']
                                        .toString(),
                                    title: "Destination"),
                                widgetWithHeading(
                                    subTitle: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        cButton(
                                          height: 25,
                                          padding: const EdgeInsets.only(
                                              top: 3,
                                              bottom: 3,
                                              left: 8,
                                              right: 8),
                                          "Update Price",
                                        ),
                                      ],
                                    ),
                                    title: "Price"),
                                textWithHeading(
                                    subTitle: _.dataList[index]['activity_type']
                                        .toString(),
                                    title: "Activity Type"),
                                widgetWithHeading(
                                    title: "Status",
                                    subTitle: cCard(
                                        radius: 6,
                                        height: 25,
                                        color: _.dataList[index]['status']
                                                    .toString() ==
                                                '1'
                                            ? AppColors.active
                                            : AppColors.inActive,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 4, left: 8, right: 8),
                                          child: ctext(
                                              _.dataList[index]['status']
                                                          .toString() ==
                                                      '1'
                                                  ? "Active"
                                                  : "In-Active",
                                              color: Colors.white),
                                        ))),
                                textWithHeading(
                                    subTitle:
                                        _.dataList[index]['by'].toString(),
                                    title: "By"),
                                textWithHeading(
                                    subTitle: convertDate(
                                      date: _.dataList[index]['created_at'],
                                    ),
                                    title: "Created At"),
                                widgetWithHeading(
                                  bottomSpace: 0,
                                  title: "Action",
                                  subTitle: Row(
                                    children: [
                                      cBounce(
                                        onPressed: () {
                                          _.selectedDestination = _
                                              .destinationList
                                              .indexWhere((element) =>
                                                  element.name ==
                                                  _.dataList[index]
                                                      ['destination']);
                                          _.selectedDestination! >= 0
                                              ? null
                                              : _.selectedDestination = null;
                                          _.a.text = _.dataList[index]['name']
                                              .toString();
                                          _.b.text = _.dataList[index]
                                                  ['activity_detail']
                                              .toString();
                                          _.selectedType = _.dataList[index]
                                                          ['activity_type']
                                                      .toString() ==
                                                  'PVT'
                                              ? 0
                                              : null;
                                          _.status = int.parse(_.dataList[index]
                                                  ['status']
                                              .toString());
                                          updateData(
                                            _,
                                            context: context,
                                            id_: _.dataList[index]['id']
                                                .toString(),
                                          );
                                        },
                                        child: cCard(
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
                                      ),
                                      const SizedBox(
                                        width: 6,
                                      ),
                                      cBounce(
                                        onPressed: () {
                                          deleteDialogue(
                                              context: context,
                                              onPressed: () {
                                                _.deleteAPI(
                                                    id: _.dataList[index]['id']
                                                        .toString());
                                              });
                                        },
                                        child: cCard(
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
                                            )),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ));
                        },
                        separatorBuilder: (context, index) => const SizedBox(
                              height: 16,
                            ),
                        itemCount: _.dataList.length)
                  ],
                ),
              ),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }

  addData(
    BuildContext context,
    ActivityController _,
  ) {
    _.selectedDestination = null;
    _.a.clear();
    _.b.clear();
    _.c.clear();
    _.d.clear();
    _.e.clear();
    _.f.clear();
    _.status = 1;
    _.rating = null;
    _.hotelPhoto = null;
    _.selectedType = null;

    List<Widget> addBank = [
      cTextField(
          title: "Activity Name",
          textField: cTextFieldCommon(
            controller: _.a,
          )),
      cTextField(
          title: "Destination",
          padding: const EdgeInsets.all(0),
          textField: cDropDown(
              value: _.selectedDestination,
              borderColor: Colors.transparent,
              fillColor: const Color.fromRGBO(0, 0, 0, 0),
              items: List.generate(_.destinationList.length,
                  (index) => _.destinationList[index].name),
              onChanged: (val) {
                _.selectedDestination = val;
              })),
      cTextField(
          title: "Activity Details",
          textField: cTextFieldCommon(
            maxLines: 3,
            controller: _.b,
          )),
      cTextField(
        title: "Activity Photo",
        textField: cCard(
            shadow: false,
            color: Colors.transparent,
            child: GetBuilder<ActivityController>(
              init: ActivityController(),
              initState: (_) {},
              builder: (_) {
                return Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    cBounce(
                      onPressed: () async {
                        await ImagePicker()
                            .pickImage(source: ImageSource.gallery)
                            .then((value) {
                          _.hotelPhoto = value;
                          log(_.hotelPhoto!.name.toString());
                          _.update();
                        });
                      },
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Text(
                            _.hotelPhoto != null
                                ? _.hotelPhoto!.name
                                : "Choose A File",
                            maxLines: 5,
                            softWrap: true,
                            overflow: TextOverflow.fade),
                      ),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    _.hotelPhoto != null
                        ? cBounce(
                            onPressed: () {
                              _.hotelPhoto = null;
                              _.update();
                            },
                            child: const Icon(Icons.clear_rounded))
                        : const SizedBox()
                  ],
                );
              },
            )),
      ),
      cTextField(
          title: "Status",
          padding: const EdgeInsets.all(0),
          textField: cDropDown(
              value: _.status,
              borderColor: Colors.transparent,
              fillColor: const Color.fromRGBO(0, 0, 0, 0),
              items: ['In-Active', 'Active'],
              onChanged: (val) {
                _.status = val;
              })),
      cTextField(
          title: "Activity Type",
          padding: const EdgeInsets.all(0),
          textField: cDropDown(
              value: _.selectedType,
              borderColor: Colors.transparent,
              fillColor: const Color.fromRGBO(0, 0, 0, 0),
              items: ['PVT', 'Null'],
              onChanged: (val) {
                _.selectedType = val;
              })),
    ];

    bottomSheet(
        context: context,
        title: "Add Activity",
        controller: scrollController,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListView.separated(
                  controller: scrollController,
                  shrinkWrap: true,
                  itemBuilder: (context, index) => addBank[index],
                  separatorBuilder: (context, index) => const SizedBox(
                        height: 16,
                      ),
                  itemCount: addBank.length),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  cButton(
                    "Close",
                    onTap: () {
                      Get.back();
                    },
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  cButton("Add Activity", onTap: () {
                    _.selectedDestination == null
                        ? EasyLoading.showError("Please Selecte Destination")
                        : _.addAPI();
                  }, btnColor: AppColors.iconBG)
                ],
              )
            ],
          ),
        ));
  }

  updateData(ActivityController _,
      {required BuildContext context, required String id_}) {
    _.hotelPhoto = null;
    List<Widget> addBank = [
      cTextField(
          title: "Activity Name",
          textField: cTextFieldCommon(
            controller: _.a,
          )),
      cTextField(
          title: "Destination",
          padding: const EdgeInsets.all(0),
          textField: cDropDown(
              value: _.selectedDestination,
              borderColor: Colors.transparent,
              fillColor: const Color.fromRGBO(0, 0, 0, 0),
              items: List.generate(_.destinationList.length,
                  (index) => _.destinationList[index].name),
              onChanged: (val) {
                _.selectedDestination = val;
              })),
      cTextField(
          title: "Activity Details",
          textField: cTextFieldCommon(
            maxLines: 3,
            controller: _.b,
          )),
      cTextField(
        title: "Activity Photo",
        textField: cCard(
            shadow: false,
            color: Colors.transparent,
            child: GetBuilder<ActivityController>(
              init: ActivityController(),
              initState: (_) {},
              builder: (_) {
                return Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    cBounce(
                      onPressed: () async {
                        await ImagePicker()
                            .pickImage(source: ImageSource.gallery)
                            .then((value) {
                          _.hotelPhoto = value;
                          log(_.hotelPhoto!.name.toString());
                          _.update();
                        });
                      },
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Text(
                            _.hotelPhoto != null
                                ? _.hotelPhoto!.name
                                : "Choose A File",
                            maxLines: 5,
                            softWrap: true,
                            overflow: TextOverflow.fade),
                      ),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    _.hotelPhoto != null
                        ? cBounce(
                            onPressed: () {
                              _.hotelPhoto = null;
                              _.update();
                            },
                            child: const Icon(Icons.clear_rounded))
                        : const SizedBox()
                  ],
                );
              },
            )),
      ),
      cTextField(
          title: "Status",
          padding: const EdgeInsets.all(0),
          textField: cDropDown(
              value: _.status,
              borderColor: Colors.transparent,
              fillColor: const Color.fromRGBO(0, 0, 0, 0),
              items: ['In-Active', 'Active'],
              onChanged: (val) {
                _.status = val;
              })),
      cTextField(
          title: "Activity Type",
          padding: const EdgeInsets.all(0),
          textField: cDropDown(
              value: _.selectedType,
              borderColor: Colors.transparent,
              fillColor: const Color.fromRGBO(0, 0, 0, 0),
              items: ['PVT', 'Null'],
              onChanged: (val) {
                _.selectedType = val;
              })),
    ];

    bottomSheet(
        context: context,
        title: "Update Activity",
        controller: scrollController,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListView.separated(
                  controller: scrollController,
                  shrinkWrap: true,
                  itemBuilder: (context, index) => addBank[index],
                  separatorBuilder: (context, index) => const SizedBox(
                        height: 16,
                      ),
                  itemCount: addBank.length),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  cButton(
                    "Close",
                    onTap: () {
                      Get.back();
                    },
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  cButton("Save", onTap: () {
                    _.selectedDestination == null
                        ? EasyLoading.showError("Please Select Destination")
                        : _.updateAPI(id_);
                  }, btnColor: AppColors.iconBG)
                ],
              )
            ],
          ),
        ));
  }
}
