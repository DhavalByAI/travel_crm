// ignore_for_file: must_be_immutable

import 'package:intl/intl.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_crm/core/utils/date_conversion.dart';
import 'package:travel_crm/core/utils/image_constant.dart';
import 'package:travel_crm/routes/app_routes.dart';
import 'package:travel_crm/widgets/main_widgets/btm_nav_bar.dart';
import 'package:travel_crm/widgets/sub_widgets/bottom_sheet.dart';
import 'package:travel_crm/widgets/sub_widgets/c_card.dart';
import 'package:travel_crm/widgets/sub_widgets/c_dropdown.dart';
import 'package:travel_crm/widgets/sub_widgets/cbutton.dart';
import 'package:travel_crm/widgets/sub_widgets/ctextfield_common.dart';
import 'package:travel_crm/widgets/sub_widgets/list_view_pegination.dart';
import 'package:travel_crm/widgets/sub_widgets/text_with_heading.dart';
import '../../../core/constants/constants.dart';
import '../../../core/utils/app_colors.dart';
import '../../../widgets/main_widgets/drawer.dart';
import '../../../widgets/sub_widgets/c_bounce.dart';
import '../../../widgets/sub_widgets/ctext.dart';
import '../../../widgets/sub_widgets/ctextfield.dart';
import 'invoice_controller.dart';

class InvoiceScreen extends StatelessWidget {
  InvoiceScreen({super.key});
  final RefreshController _sc = RefreshController(initialRefresh: false);
  final ScrollController _scc = ScrollController();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<InvoiceController>(
      initState: (_) {},
      builder: (_) {
        return Scaffold(
            drawer: const CDrawer(),
            backgroundColor: AppColors.scafflodBackground,
            appBar: AppBar(
                iconTheme: const IconThemeData(size: 30, color: Colors.black),
                title: ctext("Invoices",
                    fontSize: 20, fontWeight: FontWeight.w700),
                centerTitle: true,
                elevation: 0,
                backgroundColor: AppColors.scafflodBackground),
            bottomNavigationBar: btmNavBar(context),
            body: _.data != null
                ? ListViewPagination(
                    controller: _sc,
                    onLoad: () {
                      _.dataAPI(_.page + 1);
                    },
                    onRefresh: () {
                      _.page = 1;
                      _.dataAPI(1);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(kPadding),
                      child: Column(mainAxisSize: MainAxisSize.min, children: [
                        cCard(
                          width: dwidth,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                selectedIconAndName(
                                  value: 0,
                                  iconAndName: "All Invoices",
                                ),
                                selectedIconAndName(
                                    value: 1, iconAndName: "Paid"),
                                selectedIconAndName(
                                    value: 2, iconAndName: "Unpaid"),
                                selectedIconAndName(
                                    value: 3, iconAndName: "Draft"),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: kPadding,
                        ),
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
                        Flexible(
                          child: bankList(context),
                        )
                      ]),
                    ),
                  )
                : const SizedBox());
      },
    );
  }

  Widget bankList(BuildContext context) {
    return GetBuilder<InvoiceController>(
      initState: (_) {},
      builder: (_) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            cButton("+ Add Invoice", onTap: () {
              addBankFunction(context, _);
            }),
            const SizedBox(
              height: kPadding / 2,
            ),
            _.bankList.isNotEmpty
                ? ListView.separated(
                    shrinkWrap: true,
                    controller: _scc,
                    itemBuilder: (context, index) {
                      return cCard(
                          child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            widgetWithHeading(
                                title: "Status",
                                subTitle: cCard(
                                    radius: 6,
                                    height: 25,
                                    color: _.bankList[index]['billing_status']
                                                .toString() ==
                                            'Paid'
                                        ? AppColors.active
                                        : AppColors.inActive,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 4, left: 8, right: 8),
                                      child: ctext(
                                          _.bankList[index]['billing_status']
                                              .toString(),
                                          color: Colors.white),
                                    ))),
                            textWithHeading(
                                subTitle: _.bankList[index]['date'] ?? '',
                                title: "Date"),
                            textWithHeading(
                                subTitle: _.bankList[index]['inv_number'] ?? '',
                                title: "Number"),
                            textWithHeading(
                                subTitle: _.bankList[index]['full_name'],
                                title: "Customer"),
                            textWithHeading(
                                subTitle:
                                    '${_.bankList[index]['c_currency_symbol']} ${_.bankList[index]['total_amount'] ?? '0'}\n${_.bankList[index]['convert_currency']} ${_.bankList[index]['convert_total_amount'] ?? '0'}',
                                title: "Total"),
                            textWithHeading(
                                subTitle:
                                    '${_.bankList[index]['c_currency_symbol']} ${_.bankList[index]['amount_due'] ?? '0'}',
                                title: "Due Amount"),
                            widgetWithHeading(
                              bottomSpace: 0,
                              title: "Action",
                              subTitle: Row(
                                children: [
                                  cBounce(
                                    onPressed: () {
                                      Get.toNamed(AppRoutes.viewTransaction,
                                          arguments: _.bankList[index]['id']
                                              .toString());
                                    },
                                    child: cCard(
                                        radius: 6,
                                        color: AppColors.iconBG,
                                        shadow: false,
                                        height: 28,
                                        width: 28,
                                        child: Padding(
                                          padding: const EdgeInsets.all(7),
                                          child: Hero(
                                            tag: _.bankList[index]['id']
                                                .toString(),
                                            child: Image.asset(
                                              IconConstant.eye,
                                              color: Colors.white,
                                            ),
                                          ),
                                        )),
                                  ),
                                  const SizedBox(
                                    width: 6,
                                  ),
                                  cBounce(
                                    onPressed: () {
                                      _.bnkAccountName.text =
                                          _.bankList[index]['account_name'];
                                      _.bnkAccountNumber.text =
                                          _.bankList[index]['account_number'];
                                      _.bnkDescription.text =
                                          _.bankList[index]['description'];
                                      _.bnkIFSCNumber.text =
                                          _.bankList[index]['ifsc'];
                                      _.bnkName.text =
                                          _.bankList[index]['bank_name'];
                                      _.bnkOpeningBalance.text =
                                          _.bankList[index]['opening_balance'];
                                      _.bnkOpeningDate.text =
                                          _.bankList[index]['created_at'];
                                      _.bnkstatus = int.parse(_.bankList[index]
                                              ['status']
                                          .toString());
                                      _.update();
                                      updateBankFunction(context, _,
                                          _.bankList[index]['id'].toString());
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
                                                style: ElevatedButton.styleFrom(
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
                                                      id: _.bankList[index]
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
                                          IconConstant.download,
                                          color: Colors.white,
                                        ),
                                      )),
                                ],
                              ),
                            )
                          ],
                        ),
                      ));
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: kPadding / 2,
                      );
                    },
                    itemCount: _.bankList.length)
                : ctext("No Data Found"),
          ],
        );
      },
    );
  }

  Widget selectedIconAndName(
      {required String iconAndName, Function()? onTap, int value = 0}) {
    return GetBuilder<InvoiceController>(
      initState: (_) {},
      builder: (_) {
        return cBounce(
          onPressed: () {
            _.selectedQueryType = value;
            _.dataAPI(1);
            _.update();
            // onTap!();
          },
          child: _.selectedQueryType == value
              ? Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    //color: AppColors.white
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: ctext(iconAndName,
                            fontWeight: FontWeight.bold,
                            color: AppColors.black),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: AppColors.orange,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        width: 45,
                        height: 3,
                      ),
                    ],
                  ),
                )
              : Container(
                  color: Colors.transparent,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ctext(iconAndName,
                        fontWeight: FontWeight.bold, color: AppColors.grey50),
                  )),
        );
      },
    );
  }

  addBankFunction(BuildContext context, InvoiceController _) {
    _.bnkAccountName.clear();
    _.bnkAccountNumber.clear();
    _.bnkDescription.clear();
    _.bnkIFSCNumber.clear();
    _.bnkName.clear();
    _.bnkOpeningBalance.clear();
    _.bnkOpeningDate.text = convertDate(
        date: DateTime.now().toString(), format: DateFormat('yyyy-MM-dd'));
    _.bnkstatus = 1;

    List<Widget> addBank = [
      cTextField(
          title: "Account Holder Name",
          textField: cTextFieldCommon(
            controller: _.bnkAccountName,
          )),
      cTextField(
          title: "Bank Name",
          textField: cTextFieldCommon(controller: _.bnkName)),
      cTextField(
          title: "Account Number",
          textField: cTextFieldCommon(
            textInputType: TextInputType.number,
            controller: _.bnkAccountNumber,
          )),
      cTextField(
          title: "IFSC Number",
          textField: cTextFieldCommon(
            controller: _.bnkIFSCNumber,
          )),
      cTextField(
          title: "Opening Balance",
          textField: cTextFieldCommon(
            textInputType: TextInputType.number,
            controller: _.bnkOpeningBalance,
          )),
      cTextField(
          title: "Description",
          textField: cTextFieldCommon(
            controller: _.bnkDescription,
          )),
      cTextField(
          title: "Opening Date",
          textField: cTextFieldCommon(
            controller: _.bnkOpeningDate,
            onTap: () {
              showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2020, 5, 1),
                lastDate: DateTime.now(),
              ).then((date) {
                if (date != null) {
                  _.bnkOpeningDate.text = convertDate(
                      date: date.toString(), format: DateFormat('yyyy-MM-dd'));
                }
              });
            },
          )),
      cTextField(
          title: "Status",
          textField: cDropDown(
            height: 30,
            items: ['Active', 'In-Active'],
            borderColor: Colors.transparent,
            fillColor: const Color.fromRGBO(0, 0, 0, 0),
            onChanged: (val) {
              _.bnkstatus = val == 0 ? 1 : 0;
              _.update();
            },
          ))
    ];

    bottomSheet(
        context: context,
        title: "Add Bank",
        controller: _scc,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListView.separated(
                  controller: _scc,
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
                  cButton("Add Bank", onTap: () {
                    _.addbank();
                  }, btnColor: AppColors.iconBG)
                ],
              )
            ],
          ),
        ));
  }

  updateBankFunction(BuildContext context, InvoiceController _, String id_) {
    List<Widget> addBank = [
      cTextField(
          title: "Account Holder Name",
          textField: cTextFieldCommon(
            controller: _.bnkAccountName,
          )),
      cTextField(
          title: "Bank Name",
          textField: cTextFieldCommon(controller: _.bnkName)),
      cTextField(
          title: "Account Number",
          textField: cTextFieldCommon(
            textInputType: TextInputType.number,
            controller: _.bnkAccountNumber,
          )),
      cTextField(
          title: "IFSC Number",
          textField: cTextFieldCommon(
            controller: _.bnkIFSCNumber,
          )),
      cTextField(
          title: "Opening Balance",
          textField: cTextFieldCommon(
            textInputType: TextInputType.number,
            controller: _.bnkOpeningBalance,
          )),
      cTextField(
          title: "Description",
          textField: cTextFieldCommon(
            controller: _.bnkDescription,
          )),
      cTextField(
          title: "Opening Date",
          textField: cTextFieldCommon(
            controller: _.bnkOpeningDate,
            onTap: () {
              showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2020, 5, 1),
                      lastDate: DateTime.now(),
                      currentDate:
                          DateFormat('yyyy-MM-dd').parse(_.bnkOpeningDate.text))
                  .then((date) {
                if (date != null) {
                  _.bnkOpeningDate.text = convertDate(
                      date: date.toString(), format: DateFormat('yyyy-MM-dd'));
                }
              });
            },
          )),
      cTextField(
          title: "Status",
          textField: cDropDown(
            height: 30,
            items: [
              'In-Active',
              'Active',
            ],
            value: _.bnkstatus,
            borderColor: Colors.transparent,
            fillColor: const Color.fromRGBO(0, 0, 0, 0),
            onChanged: (val) {
              _.bnkstatus = val ?? 1;
              _.update();
            },
          ))
    ];

    bottomSheet(
        context: context,
        title: "Update Bank",
        controller: _scc,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListView.separated(
                  controller: _scc,
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
                  cButton("Update Bank", onTap: () {
                    _.updateBank(id_);
                  }, btnColor: AppColors.iconBG)
                ],
              )
            ],
          ),
        ));
  }
}
