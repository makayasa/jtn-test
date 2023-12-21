import 'package:get/get.dart';

import '../../../../config/constant.dart';

class HomeController extends GetxController {
  final positioned = 0.0.obs;
  final double constPotioned = -(Get.mediaQuery.size.width - kDefaultScaffoldPadding.horizontal / 2) + 10 + 125;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    positioned.value = constPotioned;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
