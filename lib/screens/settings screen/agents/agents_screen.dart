import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:travel_crm/core/constants/constants.dart';
import 'package:travel_crm/screens/settings%20screen/agents/agents_controller.dart';
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
import '../../../widgets/sub_widgets/text_with_heading.dart';

class AgentScreen extends StatelessWidget {
  AgentScreen({super.key});
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
          title: ctext("Agents", fontSize: 20, fontWeight: FontWeight.w700),
          centerTitle: true,
          elevation: 0,
          backgroundColor: AppColors.scafflodBackground),
      bottomNavigationBar: btmNavBar(context),
      body: GetBuilder<AgentController>(
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
                    cButton("+ Add Agents", onTap: () {
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
                                    subTitle: _.dataList[index]['company_name']
                                        .toString(),
                                    title: "Company"),
                                textWithHeading(
                                    subTitle: (_.dataList[index]['title'] +
                                            " " +
                                            _.dataList[index]['firstname'] +
                                            " " +
                                            _.dataList[index]['lastname'])
                                        .toString(),
                                    title: "Name"),
                                textWithHeading(
                                    subTitle:
                                        _.dataList[index]['email'].toString(),
                                    title: "Email"),
                                textWithHeading(
                                    subTitle: _.dataList[index]['mobile'],
                                    title: "Mobile"),
                                textWithHeading(
                                    subTitle: _.dataList[index]['address'],
                                    title: "Address"),
                                textWithHeading(
                                    subTitle: _.dataList[index]['city'],
                                    title: "City"),
                                textWithHeading(
                                    subTitle: _.dataList[index]['gst_no'],
                                    title: "GST No"),
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
                                          _.companyName.text = _.dataList[index]
                                                  ['company_name']
                                              .toString();
                                          _.firstName.text = _.dataList[index]
                                                  ['firstname']
                                              .toString();
                                          _.lastName.text = _.dataList[index]
                                                  ['lastname']
                                              .toString();
                                          _.email.text = _.dataList[index]
                                                  ['email']
                                              .toString();
                                          _.mobile.text = _.dataList[index]
                                                  ['mobile']
                                              .toString();
                                          _.address.text = _.dataList[index]
                                                  ['address']
                                              .toString();
                                          _.city.text = _.dataList[index]
                                                  ['city']
                                              .toString();
                                          _.gstNo.text = _.dataList[index]
                                                  ['gst_no']
                                              .toString();
                                          _.selectedTitle = _.titleList
                                              .indexWhere((element) =>
                                                  element ==
                                                  _.dataList[index]['title']
                                                      .toString());
                                          _.dob.text = _.dataList[index]
                                                      ['dob'] !=
                                                  null
                                              ? convertDate(
                                                  date: _.dataList[index]
                                                      ['dob'],
                                                  format:
                                                      DateFormat('yyyy-MM-dd'))
                                              : _.dataList[index]['dob']
                                                  .toString();
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

  addData(BuildContext context, AgentController _) {
    _.address.clear();
    _.city.clear();
    _.companyName.clear();
    _.country.clear();
    _.dob.clear();
    _.email.clear();
    _.firstName.clear();
    _.gstNo.clear();
    _.lastName.clear();
    _.mobile.clear();

    List<Widget> addBank = [
      cTextField(
          title: "Company Name",
          textField: cTextFieldCommon(
            controller: _.companyName,
          )),
      cTextField(
          title: "Title",
          padding: const EdgeInsets.all(0),
          textField: cDropDown(
              value: 0,
              borderColor: Colors.transparent,
              fillColor: const Color.fromRGBO(0, 0, 0, 0),
              items: _.titleList,
              onChanged: (val) {
                _.selectedTitle = val!;
              })),
      cTextField(
          title: "First Name",
          textField: cTextFieldCommon(
            controller: _.firstName,
          )),
      cTextField(
          title: "Last Name",
          textField: cTextFieldCommon(
            controller: _.lastName,
          )),
      cTextField(
          title: "Email",
          textField: cTextFieldCommon(
            controller: _.email,
          )),
      cTextField(
          title: "Mobile",
          textField: cTextFieldCommon(
            textInputType: TextInputType.phone,
            controller: _.mobile,
          )),
      cTextField(
          title: "DOB",
          textField: cTextFieldCommon(
            controller: _.dob,
            onTap: () {
              showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2020, 5, 1),
                lastDate: DateTime.now(),
              ).then((date) {
                if (date != null) {
                  _.dob.text = convertDate(
                      date: date.toString(), format: DateFormat('yyyy-MM-dd'));
                }
              });
            },
          )),
      cTextField(
          title: "Address",
          textField: cTextFieldCommon(
            controller: _.address,
          )),
      cTextField(
          title: "City",
          textField: cTextFieldCommon(
            controller: _.city,
          )),
      cTextField(
          title: "GST No",
          textField: cTextFieldCommon(
            controller: _.gstNo,
          )),
      cTextField(
          title: "Country",
          padding: const EdgeInsets.all(0),
          textField: cDropDown(
              value: 0,
              borderColor: Colors.transparent,
              fillColor: const Color.fromRGBO(0, 0, 0, 0),
              items: _.countryList,
              onChanged: (val) {
                _.selectedCountry = val!;
              })),
    ];

    bottomSheet(
        context: context,
        title: "Add Agent",
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
                  cButton("Add Agent", onTap: () {
                    _.addAPI();
                  }, btnColor: AppColors.iconBG)
                ],
              )
            ],
          ),
        ));
  }

  updateData(AgentController _,
      {required BuildContext context, required String id_}) {
    List<Widget> addBank = [
      cTextField(
          title: "Company Name",
          textField: cTextFieldCommon(
            controller: _.companyName,
          )),
      cTextField(
          title: "Title",
          padding: const EdgeInsets.all(0),
          textField: cDropDown(
              value: _.selectedTitle,
              borderColor: Colors.transparent,
              fillColor: const Color.fromRGBO(0, 0, 0, 0),
              items: _.titleList,
              onChanged: (val) {
                _.selectedTitle = val!;
              })),
      cTextField(
          title: "First Name",
          textField: cTextFieldCommon(
            controller: _.firstName,
          )),
      cTextField(
          title: "Last Name",
          textField: cTextFieldCommon(
            controller: _.lastName,
          )),
      cTextField(
          title: "Email",
          textField: cTextFieldCommon(
            controller: _.email,
          )),
      cTextField(
          title: "Mobile",
          textField: cTextFieldCommon(
            textInputType: TextInputType.phone,
            controller: _.mobile,
          )),
      cTextField(
          title: "DOB",
          textField: cTextFieldCommon(
            controller: _.dob,
            onTap: () {
              showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2020, 5, 1),
                lastDate: DateTime.now(),
              ).then((date) {
                if (date != null) {
                  _.dob.text = convertDate(
                      date: date.toString(), format: DateFormat('yyyy-MM-dd'));
                }
              });
            },
          )),
      cTextField(
          title: "Address",
          textField: cTextFieldCommon(
            controller: _.address,
          )),
      cTextField(
          title: "City",
          textField: cTextFieldCommon(
            controller: _.city,
          )),
      cTextField(
          title: "GST No",
          textField: cTextFieldCommon(
            controller: _.gstNo,
          )),
      cTextField(
          title: "Country",
          padding: const EdgeInsets.all(0),
          textField: cDropDown(
              value: 0,
              borderColor: Colors.transparent,
              fillColor: const Color.fromRGBO(0, 0, 0, 0),
              items: _.countryList,
              onChanged: (val) {
                _.selectedCountry = val!;
              })),
    ];

    bottomSheet(
        context: context,
        title: "Update Agent",
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
                  cButton("Update Agent", onTap: () {
                    _.updateAPI(id_);
                  }, btnColor: AppColors.iconBG)
                ],
              )
            ],
          ),
        ));
  }
}
