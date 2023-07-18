import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/utils/fatch_api.dart';
import '../../bank/bank_transfer/bank_transfer_controller.dart';

class DestinationAreaController extends GetxController {
  int page = 1;
  var data;
  TextEditingController searchController = TextEditingController();
  @override
  void onInit() {
    dataAPI(1);
    getDestinations();
    super.onInit();
  }

  List dataList = [];
  List<bankDropDownList> destinationList = [];
  TextEditingController area = TextEditingController();
  int? status;
  int? selectedDestination;
  dataAPI(int pageNo) {
    fetchApi(url: "master/destination-area/list", params: {
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

  Future<dynamic> getDestinations() {
    return fetchApi(url: 'master/destination/list').then((value) {
      if (value != null) {
        List tmpList = value['data'];
        for (var element in tmpList) {
          destinationList.addIf(element['status'] == 1,
              bankDropDownList(id: element['id'], name: element['name']));
        }
      }
      update();
    });
  }

  deleteAPI({required String id}) {
    fetchApi(
      url: 'master/destination-area/delete/$id}',
    ).then((value) async => await dataAPI(1));
  }

  addAPI() {
    fetchApi(
      url: 'master/destination-area/store',
      params: {
        'destination': selectedDestination != null
            ? destinationList[selectedDestination!].name
            : '',
        'area_name': area.text,
        'status': status
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
      url: 'master/destination-area/update/$id_',
      params: {
        'destination': selectedDestination != null
            ? destinationList[selectedDestination!].name
            : '',
        'area_name': area.text,
        'status': status
      },
    ).then((value) async {
      if (value != null) {
        Get.back();
        await dataAPI(page);
      }
    });
  }
}
