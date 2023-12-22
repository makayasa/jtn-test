import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jtn/app/controllers/dio_controller.dart';
import 'package:jtn/config/function_utils.dart';

class DashboardController extends GetxController with GetSingleTickerProviderStateMixin {
  final dioC = Get.find<DioController>();
  // TabController tabController = TabController(
  //   length: length,
  //   vsync: vsync,
  // );

  void initialFunction() async {
    tabController = TabController(
      length: 4,
      vsync: this,
    );
    final res = await dioC.checkConnection();
    logKey('res', res);
  }

  late TabController tabController;

  final tabIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    initialFunction();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
