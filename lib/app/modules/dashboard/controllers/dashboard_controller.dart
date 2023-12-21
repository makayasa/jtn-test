import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController with GetSingleTickerProviderStateMixin {
  // TabController tabController = TabController(
  //   length: length,
  //   vsync: vsync,
  // );

  late TabController tabController;

  final tabIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(
      length: 4,
      vsync: this,
    );
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
