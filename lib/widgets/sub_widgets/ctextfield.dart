import 'package:flutter/material.dart';

import 'c_card.dart';
import 'ctext.dart';

Widget cTextField({
  required String title,
  required Widget textField,
  EdgeInsetsGeometry? padding,
}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisSize: MainAxisSize.min,
    children: [
      ctext(" $title", fontSize: 14),
      const SizedBox(
        height: 4,
      ),
      cCard(
          shadow: false,
          color: Colors.grey.withOpacity(0.2),
          child: Padding(
            padding: padding ?? const EdgeInsets.all(8.0),
            child: textField,
          )),
    ],
  );
}
