import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuotationController extends GetxController {
  int selectedQueryType = 0;
  int selectedFeesType = 0;
  int selectedButton = 0;
  final List<bool> _checkedItems = List<bool>.filled(5, false);
}
