import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../core/utils/date_conversion.dart';
import '../../../core/utils/fatch_api.dart';
import '../bank_transfer/bank_transfer_controller.dart';

class ExpencesController extends GetxController {
  int page = 1;
  var data;
  TextEditingController searchController = TextEditingController();
  @override
  void onInit() {
    dataAPI(1);
    getBank();
    getCat();
    super.onInit();
  }

  List dataList = [];
  List<bankDropDownList> bankList = [];
  List<bankDropDownList> catList = [];
  int? selectedFrom;
  int? selectedCat;
  int? status;
  TextEditingController amount = TextEditingController();
  TextEditingController note = TextEditingController();
  TextEditingController date = TextEditingController(
      text: convertDate(
          date: DateTime.now().toString(), format: DateFormat('yyyy-MM-dd')));

  dataAPI(int pageNo) {
    fetchApi(url: "expense/list", params: {
      'page': pageNo,
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

  deleteAPI({required String id}) {
    fetchApi(
      url: 'expense/delete/$id}',
    ).then((value) async => await dataAPI(1));
  }

  Future<dynamic> getBank() {
    return fetchApi(url: 'banking/getAllBank', get: true).then((value) {
      if (value != null) {
        List tmpList = value['data'];
        for (var element in tmpList) {
          bankList.addIf(element['status'].toString() == '1',
              bankDropDownList(id: element['id'], name: getString(element)));
        }
      }
      log(bankList.toString());
      update();
    });
  }

  Future<dynamic> getCat() {
    return fetchApi(url: 'category/type/Expense', get: true).then((value) {
      if (value != null) {
        List tmpList = value['data'];
        for (var element in tmpList) {
          catList.addIf(element['status'].toString() == '1',
              bankDropDownList(id: element['id'], name: element['name']));
        }
      }
      update();
    });
  }

  String getString(dynamic element) {
    String name = element['bank_name'].toString();
    String number = element['account_number'].toString();
    number = number.length >= 4 ? number.substring(number.length - 4) : "";
    return "$name $number";
  }

  addAPI() {
    fetchApi(
      url: 'expense/add',
      params: {
        'bank_id': selectedFrom != null ? bankList[selectedFrom!].id : '',
        'category_id': selectedCat != null ? catList[selectedCat!].id : '',
        'amount': amount.text,
        'date': date.text,
        'note': note.text,
      },
    ).then((value) async {
      if (value != null) {
        Get.back();
        await dataAPI(page);
      }
    });
  }

  updateAPI(String id_) {
    fetchApi(
      url: 'expense/update/$id_',
      params: {
        'bank_id': selectedFrom != null ? bankList[selectedFrom!].id : '',
        'category_id': selectedCat != null ? catList[selectedCat!].id : '',
        'amount': amount.text,
        'date': date.text,
        'note': note.text,
      },
    ).then((value) async {
      if (value != null) {
        Get.back();
        await dataAPI(page);
      }
    });
  }
}
