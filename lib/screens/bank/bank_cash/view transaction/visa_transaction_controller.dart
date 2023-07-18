import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../core/utils/fatch_api.dart';
import '../../bank_transfer/bank_transfer_controller.dart';

class ViewTransactionController extends GetxController {
  int page = 1;
  var data;
  String? id;
  TextEditingController searchController = TextEditingController();
  @override
  void onInit() {
    id = Get.arguments;
    id != null
        ? dataAPI(1, id!)
        : EasyLoading.showError("Something Went Wrong! Please Try Again Later");
    super.onInit();
  }

  List dataList = [];
  List<bankDropDownList> destinationList = [];
  TextEditingController a = TextEditingController();
  TextEditingController b = TextEditingController();
  TextEditingController c = TextEditingController();
  TextEditingController d = TextEditingController();
  TextEditingController e = TextEditingController();
  TextEditingController f = TextEditingController();
  TextEditingController g = TextEditingController();
  TextEditingController h = TextEditingController();
  int? status;
  int? selectedDestination;
  int? rating;
  XFile? hotelPhoto;
  TimeOfDay? fromTime;
  TimeOfDay? toTime;

  dataAPI(int pageNo, String id) {
    fetchApi(url: "banking/view_bank_transaction_history/$id", params: {
      // 'page': pageNo,
      'start': 0,
      'limit': 10,
      'search': searchController.text,
    }).then((value) {
      if (value != null) {
        data = value;
        List tmpList = data['data'];
        if (pageNo > 1) {
          (tmpList.isNotEmpty) ? page = pageNo : null;
          dataList.addAll(tmpList);
        } else {
          page = pageNo;
          dataList = tmpList;
        }
        update();
      }
    });
  }
}
