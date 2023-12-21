import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jtn/config/color_constants.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: kPrimaryTheme,
    ),
  );  
}
