import 'package:flutter/material.dart';
import 'package:form_builder_validators/localization/l10n.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'package:jtn/app/controllers/dio_controller.dart';
import 'package:jtn/config/color_constants.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage().initStorage;
  await initializeDateFormatting();
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      initialBinding: InitialBindings(),
      getPages: AppPages.routes,
      theme: kPrimaryTheme,
      defaultTransition: Transition.cupertino,
      localizationsDelegates: const [
        FormBuilderLocalizationsDelegate(),
      ],
    ),
  );
}

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(DioController());
  }
}
