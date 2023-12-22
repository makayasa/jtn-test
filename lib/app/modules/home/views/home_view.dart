import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jtn/config/color_constants.dart';
import 'package:jtn/config/constant.dart';
import 'package:jtn/config/function_utils.dart';

import '../components/outlet_card.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.getTrx();
        },
      ),
      backgroundColor: kPrimaryColor,
      body: Obx(
        () => AnimatedCrossFade(
          crossFadeState:
              controller.isLoading.value && isEmpty(controller.initData.value.data.outletSubs) ? CrossFadeState.showFirst : CrossFadeState.showSecond,
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
              // Expanded(
              //   child: Obx(
              //     () => ListView.separated(
              //       padding: const EdgeInsets.symmetric(vertical: 10),
              //       itemCount: controller.initData.value.data.outletSubs.length + 1,
              //       separatorBuilder: (context, index) {
              //         return const SizedBox(height: 10);
              //       },
              //       itemBuilder: (context, index) {
              //         return OutletCard();
              //       },
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
      // body: CustomScrollView(
      //   slivers: [
      //     const SliverToBoxAdapter(
      //       child: SizedBox(height: 10),
      //     ),
      //     SliverToBoxAdapter(
      //       child: Container(
      //         // height: 200,
      //         // padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      //         margin: kDefaultScaffoldPadding,
      //         decoration: BoxDecoration(
      //           color: Colors.white,
      //           borderRadius: kDefaultBorderRadius15,
      //           boxShadow: [
      //             kElevationShadow(color: Colors.black),
      //           ],
      //         ),
      //         child: Container(
      //           child: Stack(
      //             fit: StackFit.loose,
      //             // clipBehavior: Clip.none,
      //             children: [
      //               OutletNameCard(),
      //               Positioned(
      //                 right: -15,
      //                 child: Slider(),
      //               ),
      //             ],
      //           ),
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}
