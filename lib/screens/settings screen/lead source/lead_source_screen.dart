import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:travel_crm/core/constants/constants.dart';
import 'package:travel_crm/widgets/sub_widgets/c_card.dart';
import 'package:travel_crm/widgets/sub_widgets/cbutton.dart';
import 'package:travel_crm/widgets/sub_widgets/ctextfield_common.dart';
import 'package:travel_crm/widgets/sub_widgets/list_view_pegination.dart';

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
import 'lead_source_controller.dart';

class LeadSourceScreen extends StatelessWidget {
  LeadSourceScreen({super.key});
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
              ctext("Lead Source", fontSize: 20, fontWeight: FontWeight.w700),
          centerTitle: true,
          elevation: 0,
          backgroundColor: AppColors.scafflodBackground),
      bottomNavigationBar: btmNavBar(context),
      body: GetBuilder<LeadSourceController>(
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
                    cButton("+ Add Lead Source", onTap: () {
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
                                          _.name.text = _.dataList[index]
                                                  ['name']
                                              .toString();
                                          _.status = int.parse(
                                              _.dataList[index]['status']);
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

  addData(BuildContext context, LeadSourceController _) {
    _.name.clear();
    _.status = 1;
    List<Widget> addBank = [
      cTextField(
          title: "Lead Source",
          textField: cTextFieldCommon(
            controller: _.name,
          )),
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
    ];

    bottomSheet(
        context: context,
        title: "Add Lead Source",
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
                    _.name.text.isEmpty
                        ? EasyLoading.showError(
                            "Please Write Proper Lead Source")
                        : _.addAPI();
                  }, btnColor: AppColors.iconBG)
                ],
              )
            ],
          ),
        ));
  }

  updateData(LeadSourceController _,
      {required BuildContext context, required String id_}) {
    List<Widget> addBank = [
      cTextField(
          title: "Lead Source",
          textField: cTextFieldCommon(
            controller: _.name,
          )),
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
    ];
    bottomSheet(
        context: context,
        title: "Update Lead Source",
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
                  cButton("Update", onTap: () {
                    _.name.text.isEmpty
                        ? EasyLoading.showError(
                            "Please Write Proper Lead Source")
                        : _.updateAPI(id_);
                  }, btnColor: AppColors.iconBG)
                ],
              )
            ],
          ),
        ));
  }
}
