import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:travel_crm/core/constants/constants.dart';
import 'package:travel_crm/widgets/sub_widgets/c_card.dart';
import 'package:travel_crm/widgets/sub_widgets/c_dropdown.dart';
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
import '../../../widgets/sub_widgets/ctext.dart';
import '../../../widgets/sub_widgets/ctextfield.dart';
import '../../../widgets/sub_widgets/text_with_heading.dart';
import 'expences_controller.dart';

class ExpencesScreen extends StatelessWidget {
  ExpencesScreen({super.key});
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
          title: ctext("Expense", fontSize: 20, fontWeight: FontWeight.w700),
          centerTitle: true,
          elevation: 0,
          backgroundColor: AppColors.scafflodBackground),
      bottomNavigationBar: btmNavBar(context),
      body: GetBuilder<ExpencesController>(
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
                    cButton("+ Add Expense", onTap: () {
                      _.selectedFrom = null;
                      _.selectedCat = null;
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
                          int tmp = _.catList.indexWhere((element) =>
                              element.id ==
                              int.parse(
                                  _.dataList[index]['category_id'].toString()));
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
                                    subTitle: _.dataList[index]['bank_name']
                                        .toString(),
                                    title: "Bank"),
                                textWithHeading(
                                    subTitle:
                                        tmp >= 0 ? _.catList[tmp].name : '-',
                                    title: "Type"),
                                textWithHeading(
                                    subTitle: _.dataList[index]['amount'],
                                    title: "Amount"),
                                textWithHeading(
                                    subTitle: _.dataList[index]['note'],
                                    title: "Note"),
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
                                              _.dataList[index]['status']
                                                          .toString() ==
                                                      '1'
                                                  ? "Active"
                                                  : "In-Active",
                                              color: Colors.white),
                                        ))),
                                textWithHeading(
                                    subTitle: _.dataList[index]['by'],
                                    title: "By"),
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
                                                          ['bank_id']
                                                      .toString()));
                                          int tempCat = _.catList.indexWhere(
                                              (element) =>
                                                  element.id ==
                                                  int.parse(_.dataList[index]
                                                          ['category_id']
                                                      .toString()));
                                          _.amount.text = _.dataList[index]
                                                  ['amount']
                                              .toString();
                                          _.note.text = _.dataList[index]
                                                  ['note']
                                              .toString();

                                          _.selectedFrom =
                                              tempFrom >= 0 ? tempFrom : null;
                                          _.selectedCat =
                                              tempCat >= 0 ? tempCat : null;
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

  addData(BuildContext context, ExpencesController _) {
    _.selectedFrom = null;
    _.selectedCat = null;
    _.amount.clear();
    _.note.clear();
    _.date.text = convertDate(
        date: DateTime.now().toString(), format: DateFormat('yyyy-MM-dd'));
    List<Widget> addBank = [
      cTextField(
          title: "Bank",
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
          title: "Expense Type",
          padding: const EdgeInsets.all(0),
          textField: cDropDown(
              value: null,
              borderColor: Colors.transparent,
              fillColor: const Color.fromRGBO(0, 0, 0, 0),
              items: List.generate(_.catList.length, (i) => _.catList[i].name),
              onChanged: (val) {
                _.selectedCat = val;
              })),
      cTextField(
          title: "Expense Amount",
          textField: cTextFieldCommon(
            textInputType: TextInputType.number,
            controller: _.amount,
          )),
      cTextField(
          title: "Opening Date",
          textField: cTextFieldCommon(
            controller: _.date,
            onTap: () {
              showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2020, 5, 1),
                lastDate: DateTime.now(),
              ).then((date) {
                if (date != null) {
                  _.date.text = convertDate(
                      date: date.toString(), format: DateFormat('yyyy-MM-dd'));
                }
              });
            },
          )),
      cTextField(
          title: "Note",
          textField: cTextFieldCommon(
            controller: _.note,
          )),
    ];

    bottomSheet(
        context: context,
        title: "Add Expense",
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
                  cButton("Add Expense", onTap: () {
                    _.selectedFrom == null
                        ? EasyLoading.showError("Please Select Bank")
                        : _.selectedCat == null
                            ? EasyLoading.showError("Please Select Income Type")
                            : _.addAPI();
                  }, btnColor: AppColors.iconBG)
                ],
              )
            ],
          ),
        ));
  }

  updateData(
    ExpencesController _, {
    required BuildContext context,
    required String id_,
  }) {
    List<Widget> addBank = [
      cTextField(
          title: "Bank",
          padding: const EdgeInsets.all(0),
          textField: cDropDown(
            borderColor: Colors.transparent,
            value: _.selectedFrom,
            fillColor: const Color.fromRGBO(0, 0, 0, 0),
            items: List.generate(_.bankList.length, (i) => _.bankList[i].name),
            onChanged: (p0) {
              _.selectedFrom = p0;
            },
          )),
      cTextField(
          title: "Expense Type",
          padding: const EdgeInsets.all(0),
          textField: cDropDown(
              value: _.selectedCat,
              borderColor: Colors.transparent,
              fillColor: const Color.fromRGBO(0, 0, 0, 0),
              items: List.generate(_.catList.length, (i) => _.catList[i].name),
              onChanged: (val) {
                _.selectedCat = val;
              })),
      cTextField(
          title: "Expense Amount",
          textField: cTextFieldCommon(
            textInputType: TextInputType.number,
            controller: _.amount,
          )),
      cTextField(
          title: "Opening Date",
          textField: cTextFieldCommon(
            controller: _.date,
            onTap: () {
              showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2020, 5, 1),
                lastDate: DateTime.now(),
              ).then((date) {
                if (date != null) {
                  _.date.text = convertDate(
                      date: date.toString(), format: DateFormat('yyyy-MM-dd'));
                }
              });
            },
          )),
      cTextField(
          title: "Note",
          textField: cTextFieldCommon(
            controller: _.note,
          )),
    ];

    bottomSheet(
        context: context,
        title: "Update Expense",
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
                  cButton("update Expense", onTap: () {
                    _.selectedFrom == null
                        ? EasyLoading.showError("Please Select Bank")
                        : _.selectedCat == null
                            ? EasyLoading.showError("Please Select Income Type")
                            : _.updateAPI(id_);
                  }, btnColor: AppColors.iconBG)
                ],
              )
            ],
          ),
        ));
  }
}
