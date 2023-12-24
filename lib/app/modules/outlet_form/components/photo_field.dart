import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../../config/color_constants.dart';
import '../../../../config/constant.dart';
import '../../../../config/function_utils.dart';
import '../controllers/outlet_form_controller.dart';
import 'outlet_photo.dart';

class PhotoField extends GetView<OutletFormController> {
  const PhotoField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: kDefaultScaffoldPadding,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      decoration: const BoxDecoration(color: kBgWhite, borderRadius: kDefaultBorderRadius15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Obx(
            () => OutletPhoto(
              isCurrent: true,
              index: 1,
              path: controller.image1Path.value,
            ),
          ),
          Obx(
            () => OutletPhoto(
              index: 2,
              path: controller.image2Path.value,
              isCurrent: isNotEmpty(controller.image1Path.value),
            ),
          ),
          Obx(
            () => OutletPhoto(
              index: 3,
              path: controller.image3Path.value,
              isCurrent: isNotEmpty(controller.image2Path.value),
            ),
          ),
          Obx(
            () => OutletPhoto(
              index: 4,
              path: controller.image4Path.value,
              isCurrent: isNotEmpty(controller.image3Path.value),
            ),
          ),
        ],
      ),
    );
  }
}
