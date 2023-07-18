import 'package:flutter/material.dart';
import 'package:travel_crm/core/utils/image_constant.dart';
import '../../core/utils/app_colors.dart';
import 'ctext.dart';

Widget textWithHeading(
    {String? subTitle,
    required String title,
    double? bottomSpace,
    int? maxLines,
    double? fontSize}) {
  return Padding(
    padding: EdgeInsets.only(bottom: bottomSpace ?? 16),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: 85,
          child: ctext(title,
              fontWeight: FontWeight.w600,
              fontSize: fontSize ?? 12,
              maxLines: 3),
        ),
        ctext(' :',
            fontWeight: FontWeight.w700, fontSize: fontSize ?? 12, maxLines: 2),
        const SizedBox(
          width: 6,
        ),
        Expanded(
          child: ctext(subTitle ?? '',
              color: AppColors.black50,
              fontSize: fontSize ?? 12,
              maxLines: maxLines ?? 100,
              fontWeight: FontWeight.w400),
        ),
      ],
    ),
  );
}

Widget textWithHeading1(
    {required String title,
    required String subTitle,
    bool isValue = false,
    double? bottomSpace,
    int? maxLines,
    double? fontSize}) {
  return Padding(
    padding: EdgeInsets.only(bottom: bottomSpace ?? 16),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
            width: 85,
            child: ctext(title,
                color: AppColors.black50,
                fontWeight: FontWeight.w400,
                fontSize: fontSize ?? 12,
                maxLines: 3)),
        ctext(' :',
            fontWeight: FontWeight.w700, fontSize: fontSize ?? 12, maxLines: 2),
        const SizedBox(
          width: 6,
        ),
        Expanded(
          child: Row(
            children: [
              ctext(subTitle,
                  fontSize: fontSize ?? 12,
                  maxLines: maxLines ?? 100,
                  fontWeight: FontWeight.w600),
              isValue
                  ? Image.asset(
                      IconConstant.dirham,
                      scale: 3,
                    )
                  : const SizedBox(),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget widgetWithHeading({
  required String title,
  required Widget subTitle,
  double? bottomSpace,
}) {
  return Padding(
    padding: EdgeInsets.only(bottom: bottomSpace ?? 16),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
            width: 85,
            child: ctext(title, fontWeight: FontWeight.w600, fontSize: 12)),
        ctext(' :', fontWeight: FontWeight.w700, fontSize: 12, maxLines: 2),
        const SizedBox(
          width: 6,
        ),
        Flexible(
          child: subTitle,
        )
      ],
    ),
  );
}
