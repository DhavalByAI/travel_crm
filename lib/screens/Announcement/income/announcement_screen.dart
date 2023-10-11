import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:travel_crm/core/constants/constants.dart';

import 'package:travel_crm/widgets/sub_widgets/c_card.dart';
import 'package:travel_crm/widgets/sub_widgets/c_dropdown.dart';
import 'package:travel_crm/widgets/sub_widgets/cbutton.dart';
import 'package:travel_crm/widgets/sub_widgets/ctextfield_common.dart';
import 'package:travel_crm/widgets/sub_widgets/list_view_pegination.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/image_constant.dart';
import '../../../widgets/main_widgets/btm_nav_bar.dart';
import '../../../widgets/main_widgets/drawer.dart';
import '../../../widgets/sub_widgets/bottom_sheet.dart';
import '../../../widgets/sub_widgets/c_bounce.dart';
import '../../../widgets/sub_widgets/ctext.dart';
import '../../../widgets/sub_widgets/ctextfield.dart';
import '../../../widgets/sub_widgets/text_with_heading.dart';
import 'announcement_controller.dart';

class AnnScreen extends StatelessWidget {
  AnnScreen({super.key});
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
          title:
              ctext("Announcement", fontSize: 20, fontWeight: FontWeight.w700),
          centerTitle: true,
          elevation: 0,
          backgroundColor: AppColors.scafflodBackground),
      bottomNavigationBar: btmNavBar(context),
      body: GetBuilder<AnnController>(
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
                    cCard(
                        radius: kPadding,
                        shadow: false,
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 12),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Expanded(
                                child: cTextFieldCommon(
                                  controller: _.searchController,
                                  hint: 'search',
                                ),
                              ),
                              const SizedBox(
                                width: 6,
                              ),
                              cBounce(
                                onPressed: () {
                                  _.page = 1;
                                  _.dataAPI(_.page);
                                },
                                child: Image.asset(
                                  IconConstant.search,
                                  height: 20,
                                  width: 20,
                                ),
                              ),
                            ],
                          ),
                        )),
                    const SizedBox(
                      height: 16,
                    ),
                    cButton("+ Add Announcement", onTap: () {
                      _.selectedFrom = null;
                      _.bankList.isEmpty
                          ? _
                              .getBank()
                              .then((value) async => await addData(context, _))
                          : addData(context, _);
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
                                        _.dataList[index]['date'].toString(),
                                    title: "Date"),
                                textWithHeading(
                                    subTitle: _.dataList[index]['user_name']
                                        .toString(),
                                    title: "User Name"),
                                textWithHeading(
                                    subTitle: _.dataList[index]['title'],
                                    title: "Title"),
                                widgetWithHeading(
                                    title: "Status",
                                    subTitle: cCard(
                                        radius: 6,
                                        height: 25,
                                        color:
                                            _.dataList[index]['status'] == '1'
                                                ? AppColors.active
                                                : AppColors.inActive,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 4, left: 8, right: 8),
                                          child: ctext(
                                              _.dataList[index]['status'] == '1'
                                                  ? "Readed"
                                                  : "Unreaded",
                                              color: Colors.white),
                                        ))),
                                widgetWithHeading(
                                  bottomSpace: 0,
                                  title: "Action",
                                  subTitle: Row(
                                    children: [
                                      cBounce(
                                        onPressed: () {
                                          int tempFrom = _.bankList.indexWhere(
                                              (element) =>
                                                  element.id ==
                                                  int.parse(_.dataList[index]
                                                      ['bank_id']));
                                          _.amount.text = _.dataList[index]
                                                  ['amount']
                                              .toString();
                                          _.note.text = _.dataList[index]
                                                  ['note']
                                              .toString();
                                          _.selectedFrom =
                                              tempFrom >= 0 ? tempFrom : null;
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
                                          showDialog(
                                            barrierColor:
                                                Colors.black.withOpacity(0.7),
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                title: const Text(
                                                    'Are you sure you want to delete?'),
                                                content: const Text(
                                                    'This action cannot be undone.'),
                                                actions: [
                                                  ElevatedButton(
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                            backgroundColor:
                                                                Colors.grey),
                                                    onPressed: () {
                                                      Get.back();
                                                    },
                                                    child: const Text(
                                                      'Cancel',
                                                    ),
                                                  ),
                                                  ElevatedButton(
                                                    onPressed: () {
                                                      _.deleteAPI(
                                                          id: _.dataList[index]
                                                                  ['id']
                                                              .toString());
                                                      Get.back();
                                                    },
                                                    child: const Text('Delete'),
                                                  ),
                                                  const SizedBox(
                                                    width: kPadding / 2,
                                                  )
                                                ],
                                              );
                                            },
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

  addData(BuildContext context, AnnController _) {
    _.selectedFrom = null;
    _.amount.clear();
    _.note.clear();
    List<Widget> addBank = [
      cTextField(
          title: "Select User/Staff",
          padding: const EdgeInsets.all(0),
          textField: cDropDown(
            borderColor: Colors.transparent,
            fillColor: const Color.fromRGBO(0, 0, 0, 0),
            items: List.generate(_.bankList.length, (i) => _.bankList[i].name),
            onChanged: (p0) {
              _.selectedFrom = p0;
            },
          )),
      cTextField(
          title: "Title",
          textField: cTextFieldCommon(
            controller: _.amount,
          )),
      cTextField(
          title: "Content",
          textField: cTextFieldCommon(
            maxLines: 5,
            controller: _.note,
          )),
    ];

    bottomSheet(
        context: context,
        title: "Add Announcement",
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
                  cButton("Add Announcement", onTap: () {
                    _.selectedFrom == null
                        ? EasyLoading.showError("Please Select User")
                        : _.addAPI();
                  }, btnColor: AppColors.iconBG)
                ],
              )
            ],
          ),
        ));
  }

  updateData(
    AnnController _, {
    required BuildContext context,
    required String id_,
  }) {
    List<Widget> addBank = [
      cTextField(
          title: "Select User/Staff",
          padding: const EdgeInsets.all(0),
          textField: cDropDown(
            borderColor: Colors.transparent,
            fillColor: const Color.fromRGBO(0, 0, 0, 0),
            items: List.generate(_.bankList.length, (i) => _.bankList[i].name),
            onChanged: (p0) {
              _.selectedFrom = p0;
            },
          )),
      cTextField(
          title: "Title",
          textField: cTextFieldCommon(
            controller: _.amount,
          )),
      cTextField(
          title: "Content",
          textField: cTextFieldCommon(
            maxLines: 5,
            controller: _.note,
          )),
    ];
    bottomSheet(
        context: context,
        title: "Update Announcement",
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
                  cButton("update Announcement", onTap: () {
                    _.selectedFrom == null
                        ? EasyLoading.showError("Please Select User")
                        : _.updateAPI(id_);
                  }, btnColor: AppColors.iconBG)
                ],
              )
            ],
          ),
        ));
  }
}
