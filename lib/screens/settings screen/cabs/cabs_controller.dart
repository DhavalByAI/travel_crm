import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../core/utils/fatch_api.dart';
import '../../bank/bank_transfer/bank_transfer_controller.dart';

class CabsController extends GetxController {
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
  int? selectedType;
  int? rating;
  XFile? hotelPhoto;

  dataAPI(int pageNo) {
    fetchApi(url: "master/cabs/list", params: {
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
      url: 'master/cabs/delete/$id}',
    ).then((value) async => await dataAPI(1));
  }

  addAPI() {
    fetchApi(
      url: 'master/cabs/store',
      params: dio.FormData.fromMap({
        'cab_name': a.text,
        'destination': selectedDestination != null
            ? destinationList[selectedDestination!].name
            : '',
        'details': b.text,
        'cab_type': selectedType == 0
            ? 'PVT'
            : selectedType == 1
                ? 'SIC'
                : '',
        'photo': hotelPhoto != null
            ? dio.MultipartFile.fromFile(
                hotelPhoto!.path,
              )
            : null,
        'status': status
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
      url: 'master/cabs/update/$id_',
      params: dio.FormData.fromMap({
        'cab_name': a.text,
        'destination': selectedDestination != null
            ? destinationList[selectedDestination!].name
            : '',
        'details': b.text,
        'cab_type': selectedType == 0
            ? 'PVT'
            : selectedType == 1
                ? 'SIC'
                : '',
        'photo': hotelPhoto != null
            ? dio.MultipartFile.fromFile(
                hotelPhoto!.path,
              )
            : null,
        'status': status
      }),
    ).then((value) async {
      if (value != null) {
        Get.back();
        await dataAPI(page);
      }
    });
  }
}
