// ignore_for_file: must_be_immutable

import 'package:intl/intl.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_crm/core/utils/date_conversion.dart';
import 'package:travel_crm/core/utils/image_constant.dart';
import 'package:travel_crm/routes/app_routes.dart';
import 'package:travel_crm/screens/bank/bank_cash/bank_cash_controller.dart';
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

class BankCashScreen extends StatelessWidget {
  BankCashScreen({super.key});
  final RefreshController _sc = RefreshController(initialRefresh: false);
  final ScrollController _scc = ScrollController();
  @override
  Widget build(BuildContext context) {
    List<Widget> tabWidget = [
      bankList(context),
      creditCardList(context),
      cashList(context)
    ];
    return GetBuilder<BankCashController>(
      initState: (_) {},
      builder: (_) {
        return Scaffold(
            drawer: const CDrawer(),
            backgroundColor: AppColors.scafflodBackground,
            appBar: AppBar(
                iconTheme: const IconThemeData(size: 30, color: Colors.black),
                title: ctext("Bank/Cash",
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
                        balanceWidget(),
                        const SizedBox(
                          height: kPadding,
                        ),
                        cCard(
                          width: dwidth,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                selectedIconAndName(
                                    value: 0, iconAndName: "Bank"),
                                selectedIconAndName(
                                    value: 1, iconAndName: "Credit Card"),
                                selectedIconAndName(
                                    value: 2, iconAndName: "Cash"),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: kPadding,
                        ),
                        Flexible(child: tabWidget[_.selectedQueryType])
                      ]),
                    ),
                  )
                : const SizedBox());
      },
    );
  }

  Widget bankList(BuildContext context) {
    return GetBuilder<BankCashController>(
      initState: (_) {},
      builder: (_) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            cButton("+ Add bank", onTap: () {
              addBankFunction(context, _);
            }),
            const SizedBox(
              height: kPadding / 2,
            ),
            ListView.separated(
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
                        textWithHeading(
                            subTitle: _.bankList[index]['account_type'] ?? '',
                            title: "Account Type"),
                        textWithHeading(
                            subTitle: _.bankList[index]['account_name'] ?? '',
                            title: "Account Holder Name"),
                        textWithHeading(
                            subTitle: _.bankList[index]['bank_name'],
                            title: "Bank Name"),
                        textWithHeading(
                            subTitle: _.bankList[index]['opening_balance'],
                            title: "Opening Balance"),
                        widgetWithHeading(
                            title: "Status",
                            subTitle: cCard(
                                radius: 6,
                                height: 25,
                                color: _.bankList[index]['status'].toString() ==
                                        '1'
                                    ? AppColors.active
                                    : AppColors.inActive,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 4, left: 8, right: 8),
                                  child: ctext(
                                      _.bankList[index]['status'].toString() ==
                                              '1'
                                          ? "Active"
                                          : "In-Active",
                                      color: Colors.white),
                                ))),
                        textWithHeading(
                            subTitle: convertDate(
                                date: _.bankList[index]['created_at']),
                            title: "Created At"),
                        widgetWithHeading(
                          bottomSpace: 0,
                          title: "Action",
                          subTitle: Row(
                            children: [
                              cBounce(
                                onPressed: () {
                                  Get.toNamed(AppRoutes.viewTransaction,
                                      arguments:
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
                                      child: Hero(
                                        tag: _.bankList[index]['id'].toString(),
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
                                  _.bnkstatus = int.parse(
                                      _.bankList[index]['status'].toString());
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
                                    barrierColor: Colors.black.withOpacity(0.7),
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
                                                backgroundColor: Colors.grey),
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
                                                  id: _.bankList[index]['id']
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
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: kPadding / 2,
                  );
                },
                itemCount: _.bankList.length),
          ],
        );
      },
    );
  }

  Widget creditCardList(BuildContext context) {
    return GetBuilder<BankCashController>(
      initState: (_) {},
      builder: (_) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            cButton("+ Add Credit", onTap: () {
              addCreditCardFunction(context, _);
            }),
            const SizedBox(
              height: kPadding / 2,
            ),
            ListView.separated(
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
                        textWithHeading(
                            subTitle: _.creditList[index]['account_type'],
                            title: "Account Type"),
                        textWithHeading(
                            subTitle: _.creditList[index]['account_name'],
                            title: "Account Holder Name"),
                        textWithHeading(
                            subTitle: _.creditList[index]['bank_name'],
                            title: "Bank Name"),
                        textWithHeading(
                            subTitle: _.creditList[index]['card_limit'],
                            title: "Card Limit"),
                        textWithHeading(
                            subTitle: _.creditList[index]['current_limit'],
                            title: "Current Limit"),
                        textWithHeading(
                            subTitle: _.creditList[index]['current_limit'],
                            title: "Outstanding"),
                        textWithHeading(
                            subTitle:
                                "${convertDate(date: _.creditList[index]['card_duedate'].toString(), format: DateFormat('dd'))} / Every Month",
                            title: "Card Due Date"),
                        widgetWithHeading(
                            title: "Status",
                            subTitle: cCard(
                                radius: 6,
                                height: 25,
                                color:
                                    _.creditList[index]['status'].toString() ==
                                            '1'
                                        ? AppColors.active
                                        : AppColors.inActive,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 4, left: 8, right: 8),
                                  child: ctext(
                                      _.creditList[index]['status']
                                                  .toString() ==
                                              '1'
                                          ? "Active"
                                          : "In-Active",
                                      color: Colors.white),
                                ))),
                        textWithHeading(
                            subTitle: convertDate(
                                date: _.creditList[index]['created_at']),
                            title: "Created At"),
                        widgetWithHeading(
                          bottomSpace: 0,
                          title: "Action",
                          subTitle: Row(
                            children: [
                              cBounce(
                                onPressed: () {
                                  Get.toNamed(AppRoutes.viewTransaction,
                                      arguments:
                                          _.creditList[index]['id'].toString());
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
                                        IconConstant.eye,
                                        color: Colors.white,
                                      ),
                                    )),
                              ),
                              const SizedBox(
                                width: 6,
                              ),
                              cBounce(
                                onPressed: () {
                                  _.bnkAccountName.text =
                                      _.creditList[index]['account_name'] ?? '';
                                  _.bnkDescription.text =
                                      _.creditList[index]['description'] ?? '';
                                  _.bnkName.text =
                                      _.creditList[index]['bank_name'] ?? '';
                                  _.bnkCardLimit.text =
                                      _.creditList[index]['card_limit'] ?? '';
                                  _.bnkCurrentLimit.text = _.creditList[index]
                                          ['current_limit'] ??
                                      '';
                                  _.bnkAccountNumber.text = _.creditList[index]
                                          ['account_number'] ??
                                      '';
                                  _.bnkCardDueDate.text = convertDate(
                                      date: _.creditList[index]
                                              ['card_duedate'] ??
                                          '',
                                      format: DateFormat('yyyy-MM-dd'));

                                  _.bnkOpeningDate.text = convertDate(
                                      date: _.creditList[index]['created_at'] ??
                                          '',
                                      format: DateFormat('yyyy-MM-dd'));
                                  _.bnkstatus = int.parse(
                                      _.creditList[index]['status'].toString());
                                  _.update();
                                  updateCreditFunction(context, _,
                                      _.creditList[index]['id'].toString());
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
                                    barrierColor: Colors.black.withOpacity(0.7),
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
                                                backgroundColor: Colors.grey),
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
                                                  id: _.creditList[index]['id']
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
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: kPadding / 2,
                  );
                },
                itemCount: _.creditList.length),
          ],
        );
      },
    );
  }

  Widget cashList(BuildContext context) {
    return GetBuilder<BankCashController>(
      initState: (_) {},
      builder: (_) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            cButton("+ Add Cash", onTap: () {
              addCashFunction(context, _);
            }),
            const SizedBox(
              height: kPadding / 2,
            ),
            ListView.separated(
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
                        textWithHeading(
                            subTitle: _.cashList[index]['account_type'],
                            title: "Account Type"),
                        textWithHeading(
                            subTitle: _.cashList[index]['account_name'],
                            title: "Account Holder Name"),
                        textWithHeading(
                            subTitle: _.cashList[index]['opening_balance'],
                            title: "Opening Balance"),
                        widgetWithHeading(
                            title: "Status",
                            subTitle: cCard(
                                radius: 6,
                                height: 25,
                                color: _.cashList[index]['status'].toString() ==
                                        '1'
                                    ? AppColors.active
                                    : AppColors.inActive,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 4, left: 8, right: 8),
                                  child: ctext(
                                      _.cashList[index]['status'].toString() ==
                                              '1'
                                          ? "Active"
                                          : "In-Active",
                                      color: Colors.white),
                                ))),
                        textWithHeading(
                            subTitle: convertDate(
                                date: _.cashList[index]['created_at']),
                            title: "Created At"),
                        widgetWithHeading(
                          bottomSpace: 0,
                          title: "Action",
                          subTitle: Row(
                            children: [
                              cBounce(
                                onPressed: () {
                                  Get.toNamed(AppRoutes.viewTransaction,
                                      arguments:
                                          _.cashList[index]['id'].toString());
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
                                        IconConstant.eye,
                                        color: Colors.white,
                                      ),
                                    )),
                              ),
                              const SizedBox(
                                width: 6,
                              ),
                              cBounce(
                                onPressed: () {
                                  _.bnkAccountName.text =
                                      _.cashList[index]['account_name'];
                                  _.bnkDescription.text =
                                      _.cashList[index]['description'];
                                  _.bnkOpeningBalance.text =
                                      _.cashList[index]['opening_balance'];
                                  _.bnkOpeningDate.text = convertDate(
                                      date: _.cashList[index]['created_at'],
                                      format: DateFormat('yyyy-MM-dd'));
                                  _.bnkstatus = int.parse(
                                      _.cashList[index]['status'].toString());
                                  _.update();
                                  updateCashFunction(context, _,
                                      _.cashList[index]['id'].toString());
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
                                    barrierColor: Colors.black.withOpacity(0.7),
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
                                                backgroundColor: Colors.grey),
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
                                                  id: _.cashList[index]['id']
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
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: kPadding / 2,
                  );
                },
                itemCount: _.cashList.length),
          ],
        );
      },
    );
  }

  Widget selectedIconAndName(
      {required String iconAndName, Function()? onTap, int value = 0}) {
    return GetBuilder<BankCashController>(
      initState: (_) {},
      builder: (_) {
        return cBounce(
          onPressed: () {
            _.selectedQueryType = value;
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

  Widget balanceWidget() {
    return GetBuilder<BankCashController>(
      initState: (_) {},
      builder: (_) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            cCard(
                gradient: const LinearGradient(colors: [
                  Color(0xFF1DAFA7),
                  Color(0xFF52BFDB),
                  Color(0xFF4CBED8),
                  Color(0xFF22B0AC),
                ]),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      cCard(
                          radius: 4,
                          color: Colors.white.withOpacity(0.3),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              IconConstant.moneyPink,
                              color: Colors.white,
                              height: 25,
                              width: 25,
                            ),
                          )),
                      ctext("Cash In Hand", color: Colors.white),
                      GetBuilder<BankCashController>(
                        initState: (_) {},
                        builder: (_) {
                          return ctext(
                              "${AppConst.rupee}${_.data!['getSumAllBank']['total_cash_amount']}",
                              color: Colors.white);
                        },
                      )
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      cCard(
                          radius: 4,
                          color: Colors.white.withOpacity(0.3),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              IconConstant.bankBlue,
                              color: Colors.white,
                              height: 25,
                              width: 25,
                            ),
                          )),
                      ctext("Bank Balance", color: Colors.white),
                      ctext(
                          "${AppConst.rupee}${_.data!['getSumAllBank']['total_bank_amount']}",
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: cCard(
                            radius: 4,
                            color: Colors.white.withOpacity(0.3),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(
                                IconConstant.creditCardOrange,
                                color: Colors.white,
                                height: 25,
                                width: 25,
                              ),
                            )),
                      ),
                      Flexible(
                          child: ctext("Outstanding Balance",
                              color: Colors.white)),
                      Flexible(
                        child: ctext(
                            "${AppConst.rupee}${_.data!['getSumAllBank']['total_card_amount']}/ ${AppConst.rupee}${_.data!['getSumAllBank']['total_outstanding_amount']}",
                            maxLines: 2,
                            color: Colors.white),
                      )
                    ],
                  ),
                )),
          ],
        );
      },
    );
  }

  addBankFunction(BuildContext context, BankCashController _) {
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

  addCreditCardFunction(
    BuildContext context,
    BankCashController _,
  ) {
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
          title: "Card Number",
          textField: cTextFieldCommon(
            textInputType: TextInputType.number,
            controller: _.bnkAccountNumber,
          )),
      cTextField(
          title: "Card Limit",
          textField: cTextFieldCommon(
            textInputType: TextInputType.number,
            controller: _.bnkCardLimit,
          )),
      cTextField(
          title: "Current Limit",
          textField: cTextFieldCommon(
            textInputType: TextInputType.number,
            controller: _.bnkCurrentLimit,
          )),
      cTextField(
          title: "Card Due Date",
          textField: cTextFieldCommon(
            controller: _.bnkCardDueDate,
            onTap: () {
              showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2020, 5, 1),
                lastDate: DateTime.now(),
              ).then((date) {
                if (date != null) {
                  _.bnkCardDueDate.text = convertDate(
                      date: date.toString(), format: DateFormat('yyyy-MM-dd'));
                }
              });
            },
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
        title: "Add Credit Card",
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
                  cButton("Add Credit Card", onTap: () {
                    _.addCreditCard();
                  }, btnColor: AppColors.iconBG)
                ],
              )
            ],
          ),
        ));
  }

  addCashFunction(BuildContext context, BankCashController _) {
    _.bnkAccountName.clear();
    _.bnkDescription.clear();
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
        title: "Add Cash",
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
                  cButton("Add Cash", onTap: () {
                    _.addCash();
                  }, btnColor: AppColors.iconBG)
                ],
              )
            ],
          ),
        ));
  }

  updateBankFunction(BuildContext context, BankCashController _, String id_) {
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

  updateCreditFunction(BuildContext context, BankCashController _, String id_) {
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
          title: "Card Number",
          textField: cTextFieldCommon(
            textInputType: TextInputType.number,
            controller: _.bnkAccountNumber,
          )),
      cTextField(
          title: "Card Limit",
          textField: cTextFieldCommon(
            controller: _.bnkCardLimit,
          )),
      cTextField(
          title: "Current Limit",
          textField: cTextFieldCommon(
            textInputType: TextInputType.number,
            controller: _.bnkCurrentLimit,
          )),
      cTextField(
          title: "Card Due Date",
          textField: cTextFieldCommon(
            controller: _.bnkCardDueDate,
            onTap: () {
              showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2020, 5, 1),
                      lastDate: DateTime.now(),
                      currentDate:
                          DateFormat('yyyy-MM-dd').parse(_.bnkCardDueDate.text))
                  .then((date) {
                if (date != null) {
                  _.bnkCardDueDate.text = convertDate(
                      date: date.toString(), format: DateFormat('yyyy-MM-dd'));
                }
              });
            },
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
        title: "Update Credit Card",
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
                  cButton("Save Changes", onTap: () {
                    _.updateCreditCard(id_);
                  }, btnColor: AppColors.iconBG)
                ],
              )
            ],
          ),
        ));
  }

  updateCashFunction(BuildContext context, BankCashController _, String id_) {
    List<Widget> addBank = [
      cTextField(
          title: "Account Holder Name",
          textField: cTextFieldCommon(
            controller: _.bnkAccountName,
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
        title: "Update Cash",
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
                  cButton("Save Changes", onTap: () {
                    _.updateCash(id_);
                  }, btnColor: AppColors.iconBG)
                ],
              )
            ],
          ),
        ));
  }
}
