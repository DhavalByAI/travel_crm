import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:travel_crm/core/constants/constants.dart';
import 'package:travel_crm/core/utils/date_conversion.dart';
import 'package:travel_crm/widgets/sub_widgets/c_card.dart';
import 'package:travel_crm/widgets/sub_widgets/c_dropdown.dart';
import 'package:travel_crm/widgets/sub_widgets/ctextfield_common.dart';
import 'package:travel_crm/widgets/sub_widgets/list_view_pegination.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/image_constant.dart';
import '../../../widgets/main_widgets/btm_nav_bar.dart';
import '../../../widgets/main_widgets/drawer.dart';
import '../../../widgets/sub_widgets/c_bounce.dart';
import '../../../widgets/sub_widgets/ctext.dart';
import '../../../widgets/sub_widgets/ctextfield.dart';
import '../../../widgets/sub_widgets/text_with_heading.dart';
import 'all_transaction_controller.dart';

class AllTransactionScreen extends StatelessWidget {
  AllTransactionScreen({super.key});
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
          title: ctext("All Transactions",
              fontSize: 20, fontWeight: FontWeight.w700),
          centerTitle: true,
          elevation: 0,
          backgroundColor: AppColors.scafflodBackground),
      bottomNavigationBar: btmNavBar(context),
      body: GetBuilder<AllTransactionController>(
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
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Flexible(
                          child: cTextField(
                              title: "From Date",
                              textField: cTextFieldCommon(
                                controller: _.fromDate,
                                onTap: () {
                                  showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2020, 5, 1),
                                    lastDate: DateTime.now(),
                                  ).then((date) {
                                    if (date != null) {
                                      _.fromDate.text = convertDate(
                                          date: date.toString(),
                                          format: DateFormat('yyyy-MM-dd'));
                                      _.dataAPI(_.page);
                                    }
                                  });
                                },
                              )),
                        ),
                        const SizedBox(
                          width: kPadding,
                        ),
                        Flexible(
                          child: cTextField(
                              title: "To Date",
                              textField: cTextFieldCommon(
                                controller: _.toDate,
                                onTap: () {
                                  showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: _.fromDate.text.isNotEmpty
                                        ? DateTime.parse(_.fromDate.text)
                                        : DateTime(2020, 5, 1),
                                    lastDate: DateTime.now(),
                                  ).then((date) {
                                    if (date != null) {
                                      _.toDate.text = convertDate(
                                          date: date.toString(),
                                          format: DateFormat('yyyy-MM-dd'));
                                      _.dataAPI(_.page);
                                    }
                                  });
                                },
                              )),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    cTextField(
                        title: "Select Type",
                        padding: const EdgeInsets.all(0),
                        textField: cDropDown(
                          borderColor: Colors.transparent,
                          fillColor: const Color.fromRGBO(0, 0, 0, 0),
                          items: ['Income', 'Expense'],
                          onChanged: (p0) {
                            _.selectedType = p0;
                            _.dataAPI(_.page);
                          },
                        )),
                    const SizedBox(
                      height: 12,
                    ),
                    cTextField(
                        title: "Select Bank",
                        padding: const EdgeInsets.all(0),
                        textField: cDropDown(
                          borderColor: Colors.transparent,
                          fillColor: const Color.fromRGBO(0, 0, 0, 0),
                          items: List.generate(
                              _.bankList.length, (i) => _.bankList[i].name),
                          onChanged: (p0) {
                            _.id = _.bankList[p0!].id;
                            _.dataAPI(_.page);
                          },
                        )),
                    const SizedBox(
                      height: 22,
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
                                    subTitle: _.dataList[index]['note'],
                                    title: "Notes"),
                                textWithHeading(
                                    subTitle: _.dataList[index]
                                            ['transaction_type']
                                        .toString(),
                                    title: "Transaction Type"),
                                widgetWithHeading(
                                    title: _.dataList[index]['transaction_mode']
                                        .toString(),
                                    subTitle: cCard(
                                        radius: 6,
                                        height: 25,
                                        color: _.dataList[index]
                                                        ['transaction_mode']
                                                    .toString() ==
                                                'Credit'
                                            ? AppColors.active
                                            : AppColors.inActive,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 4, left: 8, right: 8),
                                          child: ctext(
                                              _.dataList[index][
                                                              'transaction_mode']
                                                          .toString() ==
                                                      'Credit'
                                                  ? _.dataList[index]['credit']
                                                      .toString()
                                                  : _.dataList[index]['debit']
                                                      .toString(),
                                              color: Colors.white),
                                        ))),
                                textWithHeading(
                                    subTitle:
                                        _.dataList[index]['balance'].toString(),
                                    title: "Balance"),
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
}
