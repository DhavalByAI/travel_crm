import 'package:flutter/material.dart';

import '../../core/constants/constants.dart';
import '../../core/utils/image_constant.dart';
import 'c_bounce.dart';
import 'c_card.dart';
import 'ctextfield_common.dart';

Widget searchButton(
    {required Function() onPressed,
    required TextEditingController searchController}) {
  return cCard(
      radius: kPadding,
      shadow: false,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: cTextFieldCommon(
                controller: searchController,
                hint: 'search',
              ),
            ),
            const SizedBox(
              width: 6,
            ),
            cBounce(
              onPressed: onPressed,
              child: Image.asset(
                IconConstant.search,
                height: 20,
                width: 20,
              ),
            ),
          ],
        ),
      ));
}
