import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jtn/config/color_constants.dart';
import 'package:jtn/config/constant.dart';

import '../components/outlet_card.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Obx(
        () => AnimatedCrossFade(
          crossFadeState: controller.isLoading.value || controller.initData.value.data.outletSubs.isEmpty || controller.listTrx.isEmpty
              ? CrossFadeState.showFirst
              : CrossFadeState.showSecond,
          duration: kDefaultDuration,
          firstCurve: kDefaultCurve,
          firstChild: const SizedBox(
            child: Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            ),
          ),
          layoutBuilder: (topChild, topChildKey, bottomChild, bottomChildKey) {
            return topChild;
          },
          secondChild: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 15),
              OutletCard(),
            ],
          ),
        ),
      ),
    );
  }
}
