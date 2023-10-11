// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:travel_crm/core/utils/app_colors.dart';
import 'package:travel_crm/core/utils/initial_bindings.dart';
import 'package:travel_crm/routes/app_routes.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDirectory = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  await Hive.openBox('myBox');
  runApp(const MyApp());

  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.chasingDots
    ..loadingStyle = EasyLoadingStyle.light
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.yellow
    ..backgroundColor = Colors.green
    ..indicatorColor = Colors.yellow
    ..textColor = Colors.yellow
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = false
    ..maskType = EasyLoadingMaskType.black
    ..maskType = EasyLoadingMaskType.black
    ..dismissOnTap = false;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Travel CRM',
      scrollBehavior: const ScrollBehavior()
          .copyWith(physics: const BouncingScrollPhysics()),
      theme: ThemeData(
              primarySwatch: Colors.orange,
              colorScheme: ColorScheme.fromSwatch(
                  backgroundColor: AppColors.scafflodBackground))
          .copyWith(
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      initialBinding: InitialBindings(),
      initialRoute: AppRoutes.login,
      getPages: AppRoutes.pages,
      builder: EasyLoading.init(),
    );
  }
}
