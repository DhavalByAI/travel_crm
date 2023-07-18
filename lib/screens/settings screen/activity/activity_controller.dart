import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../core/utils/fatch_api.dart';
import '../../bank/bank_transfer/bank_transfer_controller.dart';

class ActivityController extends GetxController {
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
  int? selectedType;

  dataAPI(int pageNo) {
    fetchApi(url: "master/activity/list", params: {
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
          destinationList.addIf(element['status'].toString() == '1',
              bankDropDownList(id: element['id'], name: element['name']));
        }
      }
      update();
    });
  }

  deleteAPI({required String id}) {
    fetchApi(
      url: 'master/activity/delete/$id}',
    ).then((value) async => await dataAPI(1));
  }

  addAPI() {
    fetchApi(
      url: 'master/activity/store',
      params: dio.FormData.fromMap({
        'name': a.text,
        'destination': selectedDestination != null
            ? destinationList[selectedDestination!].name
            : '',
        'activity_detail': b.text,
        'activity_photo': hotelPhoto != null
            ? dio.MultipartFile.fromFile(
                hotelPhoto!.path,
              )
            : null,
        'status': status,
        'activity_type': selectedType != null
            ? selectedType == 0
                ? 'PVT'
                : ''
            : ''
      }),
    ).then((value) async {
      if (value != null) {
        Get.back();
        await dataAPI(page);
      }
    });
  }

  updateAPI(String id_) {
    fetchApi(
      url: 'master/activity/update/$id_',
      params: dio.FormData.fromMap({
        'name': a.text,
        'destination': selectedDestination != null
            ? destinationList[selectedDestination!].name
            : '',
        'activity_detail': b.text,
        'activity_photo': hotelPhoto != null
            ? dio.MultipartFile.fromFile(
                hotelPhoto!.path,
              )
            : null,
        'status': status,
        'activity_type': selectedType != null
            ? selectedType == 0
                ? 'PVT'
                : ''
            : ''
      }),
    ).then((value) async {
      if (value != null) {
        Get.back();
        await dataAPI(page);
      }
    });
  }
}
