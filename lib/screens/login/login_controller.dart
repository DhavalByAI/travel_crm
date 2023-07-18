import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:travel_crm/core/utils/fatch_api.dart';

import '../../core/constants/constants.dart';
import '../../routes/app_routes.dart';

class LoginController extends GetxController {
 
  @override
  void onInit() async {
    box.get('email') != null
        ? fetchApi(url: 'login', params: {
            'email': box.get('email'),
            'password': box.get('password')
          }).then((value) => {
              if (value['status'])
                {
                  EasyLoading.dismiss(),
                  box.put('token', value['data']['token']),
                  box.put('userId', value['data']['id']),
                  box.put('role', value['data']['role']),
                  dio.options.headers["Authorization"] =
                      "Bearer " + value['data']['token'],
                  Get.offAllNamed(AppRoutes.dashboard)
                }
              // else
              //   {EasyLoading.showError(value['msg'])}
            })
        : null;
    super.onInit();
  }

  RxBool isKeepMeLogin = true.obs;
}
