import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jtn/app/controllers/dio_controller.dart';
import 'package:jtn/config/color_constants.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      initialBinding: InitialBindings(),
      getPages: AppPages.routes,
      theme: kPrimaryTheme,
    ),
  );
}

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(DioController());
  }
}
