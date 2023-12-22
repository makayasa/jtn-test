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
    required this.index,
  });
  final int index;

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
              OutletNameCard(index: index),
              Obx(
                () => AnimatedPositioned(
                  duration: kDefaultFastDuration,
                  curve: kDefaultCurve,
                  // right: controller.positioned.value,
                  right: !controller.listBoolSlider[index].value ? controller.constPotioned : 0,
                  child: Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: Get.mediaQuery.size.width - kDefaultScaffoldPadding.horizontal - 75,
                      child: SliderOutlet(index: index),
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
