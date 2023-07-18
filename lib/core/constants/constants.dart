import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class AppConst {
  static const int bounceDuration = 110;
  static const String rupee = "₹";
  static const String baseUrl = "https://softieons.in/travel-crm/api/";
}

var box = Hive.box('myBox');
final dio = Dio();
const double kPadding = 24;
var dheight = Get.height;
var dwidth = Get.width;
