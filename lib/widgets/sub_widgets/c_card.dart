import 'package:flutter/material.dart';
import '../../core/utils/app_colors.dart';

Widget cCard(
    {Widget? child,
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
    double? radius}) {
  return SizedBox(
    child: Padding(
      padding:
          shadowPadding ? const EdgeInsets.all(4) : const EdgeInsets.all(0),
      child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
              gradient: gradient,
              image: image,
              border: border
                  ? Border.all(
                      color: borderColor ?? AppColors.black20,
                      width: borderWidth ?? 1)
                  : null,
              borderRadius: borderRadius ?? BorderRadius.circular(radius ?? 8),
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
          child: child),
    ),
  );
}
