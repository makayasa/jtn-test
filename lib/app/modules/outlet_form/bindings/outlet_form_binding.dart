import 'package:get/get.dart';

import '../controllers/outlet_form_controller.dart';

class OutletFormBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OutletFormController>(
      () => OutletFormController(),
    );
  }
}
