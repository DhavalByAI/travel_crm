// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

Widget ListViewPagination(
    {required Widget child,
    required RefreshController controller,
    ScrollController? scrollController,
    Function()? onLoad,
    Function()? onRefresh}) {
  return SmartRefresher(
    controller: controller,
    scrollController: scrollController,
    header: BezierHeader(
      child: Center(
        child: Icon(
          Icons.rocket,
          size: 62,
          color: Colors.black.withOpacity(0.8),
        ),
      ),
    ),
    onLoading: () {
      onLoad != null ? onLoad() : null;
      controller.loadComplete();
      controller.refreshCompleted();
    },
    onRefresh: () {
      onRefresh != null ? onRefresh() : null;
      controller.refreshCompleted();
      controller.loadComplete();
    },
    enablePullUp: true,
    primary: false,
    child: child,
  );
}
