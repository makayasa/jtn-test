import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../config/color_constants.dart';
import '../../../../config/constant.dart';
import '../controllers/home_controller.dart';
import 'outlet_name_card.dart';
import 'slider_outlet.dart';

class OutletCard extends GetView<HomeController> {
  const OutletCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      width: double.infinity,
      margin: kDefaultScaffoldPadding,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: kDefaultBorderRadius15,
        boxShadow: [
          kElevationShadow(color: Colors.black),
        ],
      ),
      child: Center(
        child: ClipRRect(
          borderRadius: kDefaultBorderRadius15,
          child: Stack(
            fit: StackFit.loose,
            clipBehavior: Clip.hardEdge,
            children: [
              Obx(
                () => AnimatedOpacity(
                  duration: kDefaultFastDuration,
                  curve: kDefaultCurve,
                  // opacity: controller.listBoolSlider[index].value ? 0.5 : 1,
                  opacity: controller.isSlideOpen.value ? 0.5 : 1,
                  child: const OutletNameCard(),
                ),
              ),
              Obx(
                () => AnimatedPositioned(
                  duration: kDefaultFastDuration,
                  curve: kDefaultCurve,
                  // right: !controller.isSlideOpen.value ? controller.constPotioned.value : 0,
                  right: !controller.isSlideOpen.value ? -(Get.mediaQuery.size.width - kDefaultScaffoldPadding.horizontal / 2) + 10 + 125 : 0,

                  child: Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: Get.mediaQuery.size.width - kDefaultScaffoldPadding.horizontal - 75,
                      child: const SliderOutlet(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
