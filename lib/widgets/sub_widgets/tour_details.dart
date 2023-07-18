import 'package:flutter/material.dart';
import 'package:travel_crm/widgets/sub_widgets/c_card_with_corner_title.dart';
import '../../core/utils/image_constant.dart';
import 'text_with_heading.dart';

Widget tourDetails() {
  return cCardWithCornerTitle(
      cornerTitle: "Tour Details",
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        child: Wrap(
          runSpacing: 12,
          spacing: 12,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  IconConstant.orangeTriangle,
                  height: 12,
                  width: 12,
                ),
                const SizedBox(
                  width: 6,
                ),
                Center(
                  child: textWithHeading(
                      bottomSpace: 0,
                      title: "From Date",
                      subTitle: '2023-05-10'),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  IconConstant.orangeTriangle,
                  height: 12,
                  width: 12,
                ),
                const SizedBox(
                  width: 6,
                ),
                Center(
                  child: textWithHeading(
                      bottomSpace: 0, title: "To Date", subTitle: '2023-05-10'),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  IconConstant.orangeTriangle,
                  height: 12,
                  width: 12,
                ),
                const SizedBox(
                  width: 6,
                ),
                Center(
                  child: textWithHeading(
                      bottomSpace: 0,
                      title: "Pax",
                      subTitle: 'Adult:10, Child:0, Infant:0'),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  IconConstant.orangeTriangle,
                  height: 12,
                  width: 12,
                ),
                const SizedBox(
                  width: 6,
                ),
                Center(
                  child: textWithHeading(
                      bottomSpace: 0, title: "Destination", subTitle: 'DUBAI'),
                )
              ],
            ),
          ],
        ),
      ));
}
