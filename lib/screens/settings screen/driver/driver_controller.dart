import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../core/utils/fatch_api.dart';
import '../../bank/bank_transfer/bank_transfer_controller.dart';

class DriverController extends GetxController {
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
  TimeOfDay? fromTime;
  TimeOfDay? toTime;

  dataAPI(int pageNo) {
    fetchApi(url: "master/transfer/list", params: {
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
      url: 'master/transfer/delete/$id}',
    ).then((value) async => await dataAPI(1));
  }

  addAPI() {
    fetchApi(
      url: 'master/transfer/store',
      params: dio.FormData.fromMap({
        'name': a.text,
        'mobile': b.text,
        'destination': selectedDestination != null
            ? destinationList[selectedDestination!].name
            : '',
        'details': c.text,
        'photo': hotelPhoto != null
            ? dio.MultipartFile.fromFile(
                hotelPhoto!.path,
              )
            : null,
        'from_time':
            '${fromTime!.hour.toString()}:${fromTime!.minute.toString()}',
        'to_time': '${toTime!.hour.toString()}:${toTime!.minute.toString()}',
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
      url: 'master/transfer/update/$id_',
      params: dio.FormData.fromMap({
        'name': a.text,
        'mobile': b.text,
        'destination': selectedDestination != null
            ? destinationList[selectedDestination!].name
            : '',
        'details': c.text,
        'photo': hotelPhoto != null
            ? dio.MultipartFile.fromFile(
                hotelPhoto!.path,
              )
            : null,
        'from_time':
            '${fromTime!.hour.toString()}:${fromTime!.minute.toString()}',
        'to_time': '${toTime!.hour.toString()}:${toTime!.minute.toString()}',
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
