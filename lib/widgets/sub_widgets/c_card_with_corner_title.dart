import 'package:flutter/material.dart';
import '../../core/constants/constants.dart';
import '../../core/utils/app_colors.dart';
import 'ctext.dart';

Widget cCardWithCornerTitle(
    {required Widget child,
    required String cornerTitle,
    String? suffix,
    double? height,
    double? width,
    Color? color,
    Color? borderColor,
    bool border = false,
    bool shadowPadding = false,
    bool? shadow = true,
    double? borderWidth,
    BorderRadiusGeometry? borderRadius,
    DecorationImage? image,
    Gradient? gradient,
    Color? suffixColor,
    Color? prefixColor,
    bool? childCornerPadding = true,
    double? radius}) {
  return SizedBox(
    child: Padding(
      padding:
          shadowPadding ? const EdgeInsets.all(4) : const EdgeInsets.all(0),
      child: Container(
          height: height,
          width: width ?? double.maxFinite,
          decoration: BoxDecoration(
              gradient: gradient,
              image: image,
              border: border
                  ? Border.all(
                      color: borderColor ?? AppColors.black20,
                      width: borderWidth ?? 1)
                  : null,
              borderRadius: borderRadius ?? BorderRadius.circular(radius ?? 12),
              color: color ?? Colors.white,
              boxShadow: [
                BoxShadow(
                  color: shadow!
                      ? Colors.grey.withOpacity(0.2)
                      : Colors.transparent,
                  spreadRadius: 2,
                  blurRadius: 10,
                )
              ]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      decoration: BoxDecoration(
                          color: prefixColor ?? AppColors.orange,
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(6),
                              bottomRight: Radius.circular(6))),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 14, vertical: 8),
                        child: ctext(cornerTitle,
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                            color: Colors.white),
                      )),
                  suffix != null
                      ? Container(
                          decoration: BoxDecoration(
                              color: suffixColor ?? AppColors.orange,
                              borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(6),
                                  bottomLeft: Radius.circular(6))),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 14, vertical: 8),
                            child: ctext(suffix,
                                fontWeight: FontWeight.w700,
                                fontSize: 14,
                                color: Colors.white),
                          ))
                      : const SizedBox()
                ],
              ),
              SizedBox(
                height: childCornerPadding! ? kPadding / 2 : 0,
              ),
              child,
              const SizedBox(
                height: 10,
              )
            ],
          )),
    ),
  );
}
