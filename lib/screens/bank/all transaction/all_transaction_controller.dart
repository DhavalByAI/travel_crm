import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/utils/fatch_api.dart';
import '../bank_transfer/bank_transfer_controller.dart';

class AllTransactionController extends GetxController {
  int page = 1;
  var data;
  TextEditingController searchController = TextEditingController();
  @override
  void onInit() {
    getBank().then((value) => dataAPI(1));
    super.onInit();
  }

  List dataList = [];
  List<bankDropDownList> bankList = [];
  List<bankDropDownList> catList = [];
  int? selectedType;
  int? selectedCat;
  int? status;
  int id = 0;

  TextEditingController amount = TextEditingController();
  TextEditingController note = TextEditingController();
  TextEditingController toDate = TextEditingController();
  TextEditingController fromDate = TextEditingController();

  dataAPI(
    int pageNo,
  ) {
    fetchApi(url: "banking/get_all_bank_transction", params: {
      'page': pageNo,
      'bank_id': id.toString(),
      'report_type': selectedType == 0
          ? 'Income'
          : selectedType == 1
              ? 'Expense'
              : '',
      'start_date': fromDate.text,
      'to_date': toDate.text,
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

  Future<dynamic> getBank() {
    return fetchApi(url: 'banking/getAllBank', get: true).then((value) {
      if (value != null) {
        List tmpList = value['data'];
        for (var element in tmpList) {
          bankList.addIf(element['status'].toString() == '1',
              bankDropDownList(id: element['id'], name: getString(element)));
        }
        id = bankList[0].id;
      }
      log(bankList.toString());
      update();
    });
  }

  String getString(dynamic element) {
    String name = element['bank_name'].toString();
    String number = element['account_number'].toString();
    number = number.length >= 4 ? number.substring(number.length - 4) : "";
    return "$name $number";
  }
}
