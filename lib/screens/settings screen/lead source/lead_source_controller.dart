import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/utils/fatch_api.dart';

class LeadSourceController extends GetxController {
  int page = 1;
  var data;
  TextEditingController searchController = TextEditingController();
  @override
  void onInit() {
    dataAPI(1);
    super.onInit();
  }

  List dataList = [];

  TextEditingController name = TextEditingController();
  int? status;

  dataAPI(int pageNo) {
    fetchApi(url: "master/lead-source/list", params: {
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
      url: 'master/lead-source/delete/$id}',
    ).then((value) async => await dataAPI(1));
  }

  addAPI() {
    fetchApi(
      url: 'master/lead-source/store',
      params: {'name': name.text, 'status': status},
    ).then((value) async {
      if (value != null) {
        Get.back();
        await dataAPI(page);
      }
    });
  }

  updateAPI(String id_) {
    fetchApi(
      url: 'master/lead-source/update/$id_',
      params: {'name': name.text, 'status': status},
    ).then((value) async {
      if (value != null) {
        Get.back();
        await dataAPI(page);
      }
    });
  }
}
