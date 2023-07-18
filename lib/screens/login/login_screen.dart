import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:travel_crm/core/constants/constants.dart';
import 'package:travel_crm/core/utils/image_constant.dart';
import 'package:travel_crm/screens/login/login_controller.dart';
import 'package:travel_crm/widgets/sub_widgets/c_card.dart';
import 'package:travel_crm/widgets/sub_widgets/cbutton.dart';
import 'package:travel_crm/widgets/sub_widgets/ctext.dart';
import 'package:travel_crm/widgets/sub_widgets/ctextfield_common.dart';

import '../../core/utils/app_colors.dart';
import '../../core/utils/fatch_api.dart';
import '../../routes/app_routes.dart';
import '../../widgets/sub_widgets/c_bounce.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final LoginController _ = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(children: [
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(ImageConstant.loginBG), fit: BoxFit.cover)),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: cCard(
                width: dwidth,
                color: AppColors.black50,
                child: Padding(
                  padding: const EdgeInsets.all(kPadding),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: ctext("Sign In",
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: kPadding,
                      ),
                      ctext(
                        "Email",
                        color: Colors.white,
                        fontSize: 14,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      cCard(
                        border: true,
                        borderColor: Colors.white,
                        radius: 8,
                        color: Colors.transparent,
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: cTextFieldCommon(
                            controller: email,
                            fontColor: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      ctext(
                        "Password",
                        color: Colors.white,
                        fontSize: 14,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      cCard(
                        border: true,
                        borderColor: Colors.white,
                        radius: 8,
                        color: Colors.transparent,
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: cTextFieldCommon(
                            controller: password,
                            fontColor: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 0,
                      ),
                      Row(
                        children: [
                          Obx(() => Checkbox(
                              activeColor: AppColors.orange,
                              tristate: false,
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              value: _.isKeepMeLogin.value,
                              onChanged: (value) {
                                _.isKeepMeLogin.value = value ?? false;
                              })),
                          ctext(
                            "Keep Me Logged in",
                            color: Colors.white,
                            fontSize: 10,
                          ),
                          const Spacer(),
                          cBounce(
                            child: ctext(
                              "Forgot Password?",
                              color: Colors.white,
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      cButton("Login", onTap: () {
                        (email.text.isNotEmpty && password.text.isNotEmpty)
                            ? fetchApi(
                                url: "login",
                                params: {
                                  'email': email.text,
                                  'password': password.text
                                },
                              ).then((value) => {
                                  if (value['status'])
                                    {
                                      _.isKeepMeLogin.value
                                          ? box.put('email', email.text)
                                          : null,
                                      _.isKeepMeLogin.value
                                          ? box.put('password', password.text)
                                          : null,
                                      box.put('token', value['data']['token']),
                                      box.put('userId', value['data']['id']),
                                      box.put('role', value['data']['role']),
                                      dio.options.headers["Authorization"] =
                                          "Bearer " + value['data']['token'],
                                      Get.offAllNamed(AppRoutes.dashboard)
                                    }
                                  else
                                    {EasyLoading.showError(value['msg'])}
                                })
                            : EasyLoading.showError(
                                "Enter Correct Email & Password");
                      })
                    ],
                  ),
                )),
          ),
        ),
        Align(
          alignment: const Alignment(0, 0.9),
          child: Container(
            width: dwidth,
            color: AppColors.orange,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ctext("Design By ", color: Colors.white),
                  ctext("Softieons Technologies",
                      decoration: TextDecoration.underline,
                      color: Colors.white),
                ],
              ),
            ),
          ),
        )
      ]),
    );
  }
}
