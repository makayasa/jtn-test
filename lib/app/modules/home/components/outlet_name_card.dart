import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../config/color_constants.dart';
import '../../../components/default_text.dart';
import '../controllers/home_controller.dart';
import 'outlet_row.dart';

class OutletNameCard extends GetView<HomeController> {
  const OutletNameCard({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      // width: 100,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Obx(
            () => DefText(
              // 'Nama Outlet',
              // controller.initData.value.data.outlet.outletName,
              index == 0 ? controller.initData.value.data.outlet.outletName : controller.initData.value.data.outletSubs[index - 1].outletName,
              color: kPrimaryColor,
              fontWeight: FontWeight.bold,
            ).semilarge,
          ),
          const SizedBox(height: 10),
          const OutletRow(
            currencyName: 'IDR',
            number: 500000,
          ),
          const SizedBox(height: 10),
          const OutletRow(
            currencyName: 'USD',
            number: 0,
          ),
          const SizedBox(height: 10),
          const OutletRow(
            currencyName: 'EUR',
            number: 20000,
          ),
          const SizedBox(height: 10),
          const OutletRow(
            currencyName: 'SGD',
            number: 6000,
          ),
        ],
      ),
    );
  }
}
