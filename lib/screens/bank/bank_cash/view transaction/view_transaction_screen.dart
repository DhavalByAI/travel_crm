import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:travel_crm/core/constants/constants.dart';
import 'package:travel_crm/core/utils/app_colors.dart';
import 'package:travel_crm/widgets/main_widgets/btm_nav_bar.dart';
import 'package:travel_crm/widgets/main_widgets/drawer.dart';
import 'package:travel_crm/widgets/sub_widgets/c_card.dart';
import 'package:travel_crm/widgets/sub_widgets/ctext.dart';
import 'package:travel_crm/widgets/sub_widgets/list_view_pegination.dart';
import 'package:travel_crm/widgets/sub_widgets/search_button.dart';
import 'package:travel_crm/widgets/sub_widgets/text_with_heading.dart';

import 'visa_transaction_controller.dart';

class ViewTransactionScreen extends StatelessWidget {
  ViewTransactionScreen({super.key});
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
          title: GetBuilder<ViewTransactionController>(
            initState: (_) {},
            builder: (_) {
              return Hero(
                  tag: _.id!,
                  child: ctext("Bank History",
                      fontSize: 20, fontWeight: FontWeight.w700));
            },
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: AppColors.scafflodBackground),
      bottomNavigationBar: btmNavBar(context),
      body: GetBuilder<ViewTransactionController>(
        initState: (_) {},
        builder: (_) {
          if (_.dataList.isNotEmpty) {
            return ListViewPagination(
              controller: refreshController,
              scrollController: scrollController,
              onLoad: () {
                _.dataAPI(_.page + 1, _.id!);
              },
              onRefresh: () {
                _.page = 1;
                _.dataAPI(1, _.id!);
              },
              child: Padding(
                padding: const EdgeInsets.all(kPadding),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    searchButton(
                        onPressed: () {
                          _.page = 1;
                          _.dataAPI(_.page, _.id!);
                        },
                        searchController: _.searchController),
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
                                    subTitle:
                                        _.dataList[index]['note'].toString(),
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
                                                "Credit"
                                            ? AppColors.active
                                            : AppColors.inActive,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 4, left: 8, right: 8),
                                          child: ctext(
                                              _.dataList[index][
                                                              'transaction_mode']
                                                          .toString() ==
                                                      "Credit"
                                                  ? _.dataList[index]['credit']
                                                      .toString()
                                                  : _.dataList[index]['debit']
                                                      .toString(),
                                              color: Colors.white),
                                        ))),
                                // textWithHeading(
                                //     subTitle:
                                //         _.dataList[index]['by'].toString(),
                                //     title: "By"),
                                // textWithHeading(
                                //     subTitle: convertDate(
                                //       date: _.dataList[index]['created_at'],
                                //     ),
                                //     title: "Created At"),
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
