import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/utils/fatch_api.dart';

class AgentController extends GetxController {
  int page = 1;
  var data;
  TextEditingController searchController = TextEditingController();
  @override
  void onInit() {
    dataAPI(1);
    super.onInit();
  }

  List dataList = [];
  int? status;
  List<String> titleList = ['Mr.', 'Mrs.', 'Ms.', 'Dr.', 'Prof.'];
  List<String> countryList = [
    'India - (INR)',
    'United Arab Emirates - (AED)',
    'United State of America - (USD)',
  ];
  int selectedTitle = 0;
  int selectedCountry = 0;
  TextEditingController companyName = TextEditingController();
  TextEditingController title = TextEditingController();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController mobile = TextEditingController();
  TextEditingController dob = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController gstNo = TextEditingController();
  TextEditingController country = TextEditingController();

  dataAPI(int pageNo) {
    fetchApi(url: "master/agent/list", params: {
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
      url: 'master/agent/delete/$id}',
    ).then((value) async => await dataAPI(1));
  }

  addAPI() {
    fetchApi(
      url: 'master/agent/store',
      params: {
        'company_name': companyName.text,
        'title': titleList[selectedTitle],
        'firstname': firstName.text,
        'lastname': lastName.text,
        'email': email.text,
        'mobile': mobile.text,
        'address': address.text,
        'status': '1',
        'city': city.text,
        'gst_no': gstNo.text,
        'dob': dob.text,
        'currency_id': (selectedCountry + 1).toString()
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
      url: 'master/agent/update/$id_',
      params: {
        'company_name': companyName.text,
        'title': titleList[selectedTitle],
        'firstname': firstName.text,
        'lastname': lastName.text,
        'email': email.text,
        'mobile': mobile.text,
        'address': address.text,
        'status': '1',
        'city': city.text,
        'gst_no': gstNo.text,
        'dob': dob.text,
        'currency_id': (selectedCountry + 1).toString()
      },
    ).then((value) async {
      if (value != null) {
        Get.back();
        await dataAPI(page);
      }
    });
  }
}
