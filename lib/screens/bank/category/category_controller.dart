import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_crm/core/constants/constants.dart';

import '../../../core/utils/fatch_api.dart';

class CategoryController extends GetxController {
  int page = 1;
  var data;
  TextEditingController searchController = TextEditingController();

  @override
  void onInit() {
    dataAPI(1);
    super.onInit();
  }

  List categoryList = [];
  int? selectedCat;
  TextEditingController categoryName = TextEditingController();
  int? status;
  dataAPI(int pageNo) {
    fetchApi(url: "category/list", params: {
      'page': pageNo,
      'search': searchController.text,
    }).then((value) {
      if (value != null) {
        data = value;
        List tmpList = data['data'];
        if (pageNo > 1) {
          (tmpList.isNotEmpty) ? page = pageNo : null;
          categoryList.addAll(tmpList);
        } else {
          page = pageNo;
          categoryList = tmpList;
        }
        update();
      }
    });
  }

  deleteAPI({required String id}) {
    fetchApi(
      get: true,
      url: 'category/delete/$id}',
    ).then((value) async => await dataAPI(1));
  }

  addCategory() {
    fetchApi(
      url: 'category/add',
      params: {
        'name': categoryName.text,
        'category_type': selectedCat! == 0 ? 'Income' : 'Expense',
        'user_id': box.get('userId').toString()
      },
    ).then((value) async {
      if (value != null) {
        Get.back();
        await dataAPI(page);
      }
    });
  }

  updateCategory(String id_) {
    fetchApi(
      url: 'category/update/$id_',
      params: {
        'name': categoryName.text,
        'category_type': selectedCat! == 0 ? 'Income' : 'Expense',
        'status': (status ?? 1).toString()
      },
    ).then((value) async {
      if (value != null) {
        Get.back();
        await dataAPI(page);
      }
    });
  }
}
