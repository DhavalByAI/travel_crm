import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_crm/core/constants/constants.dart';
import 'package:travel_crm/screens/Tasks/tasks_controller.dart';
import 'package:travel_crm/widgets/sub_widgets/c_card.dart';
import 'package:travel_crm/widgets/sub_widgets/cbutton.dart';

import '../../core/utils/app_colors.dart';
import '../../widgets/sub_widgets/c_bounce.dart';
import '../../widgets/sub_widgets/ctext.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> queryType = ["Notes", "To Do List", "Reminder"];
    return Scaffold(
      backgroundColor: AppColors.scafflodBackground,
      body: Padding(
        padding: const EdgeInsets.all(kPadding),
        child: Column(
          children: [
            const SizedBox(
              height: kPadding,
            ),
            cCard(
              radius: 12,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    selectedIconAndName(value: 0, iconAndName: queryType[0]),
                    selectedIconAndName(value: 1, iconAndName: queryType[1]),
                    selectedIconAndName(value: 2, iconAndName: queryType[2]),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: kPadding,
            ),
            Row(
              children: [
                cCard(
                    border: true,
                    shadow: false,
                    color: AppColors.white,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        cCard(
                            shadow: false,
                            color: AppColors.teal.withOpacity(0.5),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 14, vertical: 8),
                              child: ctext("Active", fontSize: 11),
                            )),
                        cCard(
                            shadow: false,
                            color: Colors.transparent,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 14, vertical: 8),
                              child: ctext("Resolved",
                                  fontSize: 11, color: AppColors.black50),
                            ))
                      ],
                    )),
                const Spacer(),
                cButton("+ Add Notes", onTap: () {
                  // showDialog(context: context, builder: ())
                })
              ],
            ),
            const SizedBox(
              height: kPadding,
            ),
            cCard(
                border: true,
                color: AppColors.scafflodBackground,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          ctext("Lorem Ipsum",
                              fontSize: 13, fontWeight: FontWeight.w700),
                          const Spacer(),
                          const Icon(
                            Icons.more_horiz_rounded,
                          )
                        ],
                      ),
                      ctext(
                          "Lorem Ipsum is simply dummy text Lorem Ipsum is simply dummy text ",
                          color: AppColors.black50),
                      const SizedBox(
                        height: 8,
                      ),
                      ctext(
                          "when an unknown printer took a galley of type and scrambled it to make a type ",
                          color: AppColors.black),
                      const SizedBox(
                        height: 18,
                      ),
                      Row(
                        children: [
                          cButton("lorem Ipsum",
                              fontSize: 10,
                              btnColor: AppColors.orange20,
                              txtColor: Colors.black),
                          const SizedBox(
                            width: 12,
                          ),
                          cButton("lorem Ipsum",
                              fontSize: 10,
                              btnColor: AppColors.orange20,
                              txtColor: Colors.black)
                        ],
                      )
                    ],
                  ),
                )),
            const SizedBox(
              height: kPadding,
            ),
            cCard(
                border: true,
                color: AppColors.scafflodBackground,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          ctext("Lorem Ipsum",
                              fontSize: 13, fontWeight: FontWeight.w700),
                          const Spacer(),
                          const Icon(
                            Icons.more_horiz_rounded,
                          )
                        ],
                      ),
                      ctext(
                          "Lorem Ipsum is simply dummy text Lorem Ipsum is simply dummy text ",
                          color: AppColors.black50),
                      const SizedBox(
                        height: 8,
                      ),
                      ctext(
                          "when an unknown printer took a galley of type and scrambled it to make a type ",
                          color: AppColors.black),
                      const SizedBox(
                        height: 18,
                      ),
                      Row(
                        children: [
                          cButton("lorem Ipsum",
                              fontSize: 10,
                              btnColor: AppColors.orange20,
                              txtColor: Colors.black),
                          const SizedBox(
                            width: 12,
                          ),
                          cButton("lorem Ipsum",
                              fontSize: 10,
                              btnColor: AppColors.orange20,
                              txtColor: Colors.black)
                        ],
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }

  Widget selectedIconAndName(
      {required String iconAndName, Function()? onTap, int value = 0}) {
    return GetBuilder<TaskController>(
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
}
