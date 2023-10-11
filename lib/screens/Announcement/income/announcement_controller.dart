import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/utils/fatch_api.dart';
import '../../bank/bank_transfer/bank_transfer_controller.dart';

class AnnController extends GetxController {
  int page = 1;
  var data;
  TextEditingController searchController = TextEditingController();
  @override
  void onInit() {
    dataAPI(1);
    getBank();
    super.onInit();
  }

  List dataList = [];
  List<bankDropDownList> bankList = [];
  int? selectedFrom;
  int? status;
  TextEditingController amount = TextEditingController();
  TextEditingController note = TextEditingController();
  dataAPI(int pageNo) {
    fetchApi(url: "marketing/bulk-announcement-list", params: {
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
      url: 'marketing/bulk-announcement-delete/$id}',
    ).then((value) async => await dataAPI(1));
  }

  Future<dynamic> getBank() {
    return fetchApi(url: 'common/get-all-user', get: true).then((value) {
      if (value != null) {
        List tmpList = value['data'];
        for (var element in tmpList) {
          bankList.addIf(
              element['status'].toString() == '1',
              bankDropDownList(
                  id: int.parse(element['id'].toString()),
                  name: element['name'].toString()));
        }
      }
      log(bankList.toString());
      update();
    });
  }

  addAPI() {
    fetchApi(
      url: 'marketing/bulk-announcement-store',
      params: {
        'user_id': selectedFrom != null ? bankList[selectedFrom!].id : '',
        'title': amount.text,
        'content': note.text,
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
      url: 'marketing/bulk-announcement-edit/$id_',
      params: {
        'user_id': selectedFrom != null ? bankList[selectedFrom!].id : '',
        'title': amount.text,
        'content': note.text,
      },
    ).then((value) async {
      if (value != null) {
        Get.back();
        await dataAPI(page);
      }
    });
  }
}
