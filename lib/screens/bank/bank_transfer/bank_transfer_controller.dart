import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/fatch_api.dart';

class BankTransferController extends GetxController {
  int page = 1;
  var data;
  TextEditingController searchController = TextEditingController();
  @override
  void onInit() {
    dataAPI(1);
    getBank();
    super.onInit();
  }

  List bankTransferList = [];
  List<bankDropDownList> bankList = [];
  int? selectedTo;
  int? selectedFrom;
  TextEditingController amount = TextEditingController();
  TextEditingController note = TextEditingController();

  dataAPI(int pageNo) {
    fetchApi(url: "banking/bank_to_bank_transfer/list", params: {
      'page': pageNo,
      'search': searchController.text,
    }).then((value) {
      if (value != null) {
        data = value;
        List tmpList = data['data'];
        if (pageNo > 1) {
          (tmpList.isNotEmpty) ? page = pageNo : null;
          bankTransferList.addAll(tmpList);
        } else {
          page = pageNo;
          bankTransferList = tmpList;
        }
        update();
      }
    });
  }

  deleteAPI({required String id}) {
    fetchApi(
      url: 'banking/bank_to_bank_transfer/delete/$id}',
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

  String getString(dynamic element) {
    String name = element['bank_name'].toString();
    String number = element['account_number'].toString();
    number = number.length >= 4 ? number.substring(number.length - 4) : "";
    return "$name $number";
  }

  addBankTransfer() {
    fetchApi(
      url: 'banking/bank_to_bank_transfer/add',
      params: {
        'from_bank': selectedFrom != null ? bankList[selectedFrom!].id : '',
        'to_bank': selectedTo != null ? bankList[selectedTo!].id : '',
        'amount': amount.text,
        'note': note.text,
      },
    ).then((value) async {
      if (value != null) {
        Get.back();
        await dataAPI(page);
      }
    });
  }

  updateBankTransfer(String id_) {
    fetchApi(
      url: 'banking/bank_to_bank_transfer/update/$id_',
      params: {
        'from_bank': selectedFrom != null ? bankList[selectedFrom!].id : '',
        'to_bank': selectedTo != null ? bankList[selectedTo!].id : '',
        'amount': amount.text,
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

class bankDropDownList {
  String name;
  int id;
  bankDropDownList({required this.id, required this.name});
}
