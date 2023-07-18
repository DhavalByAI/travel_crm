import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/constants/constants.dart';
import '../../core/utils/app_colors.dart';
import 'c_bounce.dart';
import 'c_card.dart';
import 'ctext.dart';

Future<dynamic> bottomSheet(
    {required BuildContext context,
    required String title,
    required Widget child,
    ScrollController? controller}) {
  return showModalBottomSheet(
    enableDrag: true,
    isScrollControlled: true,
    useSafeArea: true,
    backgroundColor: Colors.transparent,
    context: context,
    builder: (BuildContext context) {
      return SingleChildScrollView(
        controller: controller,
        child: Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: cCard(
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(0),
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(
                    height: kPadding - 4,
                  ),
                  cCard(color: Colors.grey, height: 4, width: 45),
                  const SizedBox(
                    height: kPadding,
                  ),
                  cCard(
                      radius: 0,
                      color: AppColors.orange,
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ctext(title, color: Colors.white, fontSize: 14),
                            cBounce(
                              onPressed: () {
                                Get.back();
                              },
                              child: const Icon(
                                Icons.cancel_rounded,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      )),
                  child
                ],
              )),
        ),
      );
    },
  );
}
