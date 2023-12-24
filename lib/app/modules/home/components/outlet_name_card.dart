import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../config/color_constants.dart';
import '../../../components/default_text.dart';
import '../controllers/home_controller.dart';
import 'outlet_row.dart';

class OutletNameCard extends GetView<HomeController> {
  const OutletNameCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      // width: 100,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Obx(
            () => DefText(
              // 'Nama Outlet',
              // controller.initData.value.data.outlet.outletName,
              // index == 0 ? controller.initData.value.data.outlet.outletName : controller.initData.value.data.outletSubs[index - 1].outletName,
              controller.initData.value.data.outlet.outletName,
              color: kPrimaryColor,
              fontWeight: FontWeight.bold,
            ).semilarge,
          ),
          const SizedBox(height: 10),
          Obx(
            () => OutletRow(
              currencyName: 'IDR',
              number: controller.totalIdr.value,
            ),
          ),
          const SizedBox(height: 10),
          Obx(
            () => OutletRow(
              currencyName: 'USD',
              number: controller.totalUsd.value,
            ),
          ),
          const SizedBox(height: 10),
          Obx(
            () => OutletRow(
              currencyName: 'EUR',
              number: controller.totalEur.value,
            ),
          ),
          const SizedBox(height: 10),
          Obx(
            () => OutletRow(
              currencyName: 'SGD',
              number: controller.totalSgd.value,
            ),
          ),
        ],
      ),
    );
  }
}
