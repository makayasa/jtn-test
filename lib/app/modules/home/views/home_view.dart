import 'dart:ffi';

import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jtn/app/components/default_text.dart';
import 'package:jtn/config/color_constants.dart';
import 'package:jtn/config/constant.dart';
import 'package:jtn/config/function_utils.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 15),
          Container(
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
            child: Stack(
              fit: StackFit.loose,
              children: [
                OutletNameCard(),
                Obx(
                  () => AnimatedPositioned(
                    // duration: kDefaultDuration,
                    duration: kDefaultFastDuration,
                    curve: kDefaultCurve,
                    right: controller.positioned.value,
                    child: Align(
                      alignment: Alignment.center,
                      child: Container(
                        width: Get.mediaQuery.size.width - kDefaultScaffoldPadding.horizontal - 75,
                        child: Slider(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
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

class OutletNameCard extends StatelessWidget {
  const OutletNameCard({
    super.key,
  });

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
          DefText(
            'Nama Outlet',
            color: kPrimaryColor,
            fontWeight: FontWeight.bold,
          ).semilarge,
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

class Slider extends GetView<HomeController> {
  const Slider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 100,
      padding: const EdgeInsets.symmetric(vertical: 10),
      height: 160,
      decoration: const BoxDecoration(
        // color: kPrimaryColor2,
        borderRadius: kDefaultBorderRadius15,
        image: DecorationImage(
            image: AssetImage(
              'assets/TraySlide.png',
            ),
            fit: BoxFit.fill),
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              if (controller.positioned.value == 0) {
                controller.positioned.value = controller.constPotioned;
              } else {
                controller.positioned.value = 0;
              }
            },
            child: Container(
              alignment: Alignment.centerRight,
              width: 40,
              height: 40,
              child: Icon(
                Icons.add_circle_outline_outlined,
                size: 20,
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SlideIconItem(
                      asset: 'assets/ButtonInputMasuk.png',
                      label: 'MASUK',
                    ),
                    SlideIconItem(
                      asset: 'assets/ButtonInputKeluar.png',
                      label: 'KELUAR',
                    ),
                    SlideIconItem(
                      asset: 'assets/ButtonInputPindah.png',
                      label: 'PINDAH',
                    ),
                    SlideIconItem(
                      asset: 'assets/ButtonInputMutasi.png',
                      label: 'MUTASI',
                    ),
                    SlideIconItem(
                      asset: 'assets/ButtonInputKurs.png',
                      label: 'KURS',
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: kDefaultBorderRadius10,
                  ),
                  child: const Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SliderRowData(
                        label: 'Jumlah Barang',
                        isCurrency: false,
                        number: 16,
                      ),
                      SliderRowData(
                        label: 'Total IDR',
                        number: 100000000,
                        currencyPrefix: 'Rp',
                      ),
                      SliderRowData(
                        label: 'Total USD',
                        number: 2000,
                      ),
                      SliderRowData(
                        label: 'Total EUR',
                        currencyPrefix: '€',
                        number: 200,
                      ),
                      SliderRowData(
                        label: 'Total SGD',
                        currencyPrefix: r'S$',
                        number: 1000,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SliderRowData extends StatelessWidget {
  const SliderRowData({
    super.key,
    required this.label,
    required this.number,
    this.isCurrency = true,
    this.currencyPrefix = r"$",
  });

  final String label;
  final int number;
  final bool isCurrency;
  final String currencyPrefix;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        DefText(
          label,
          color: isCurrency ? kPrimaryColor : kBgBlack,
        ).small,
        const Expanded(
          child: DottedLine(
            dashColor: kPrimaryColor2,
          ),
        ),
        DefText(
          isCurrency ? '$currencyPrefix ${currencyFormat(number)}' : '$number',
          color: isCurrency ? kPrimaryColor : kBgBlack,
        ).small,
      ],
    );
  }
}

class SlideIconItem extends StatelessWidget {
  const SlideIconItem({
    super.key,
    required this.asset,
    required this.label,
  });

  final String asset;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          // 'assets/ButtonInputMasuk.png',
          asset,
        ),
        DefText(
          // 'Masuk',
          label,
        ).small,
      ],
    );
  }
}

class OutletRow extends StatelessWidget {
  const OutletRow({
    super.key,
    required this.currencyName,
    required this.number,
  });
  final String currencyName;
  final int number;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 45),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset('assets/IconDollar.png'),
              const SizedBox(width: 5),
              DefText(currencyName).normal,
              const SizedBox(width: 10),
              const Expanded(
                child: DottedLine(
                  dashColor: kPrimaryColor,
                ),
              ),
              const SizedBox(width: 10),
              DefText(
                currencyFormat(number),
                color: kPrimaryColor,
                fontWeight: FontWeight.bold,
              ).normal,
            ],
          ),
        ],
      ),
    );
  }
}

class MySeparator extends StatelessWidget {
  const MySeparator({Key? key, this.height = 1, this.color = Colors.black}) : super(key: key);
  final double height;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = constraints.constrainWidth();
        const dashWidth = 10.0;
        final dashHeight = height;
        final dashCount = (boxWidth / (2 * dashWidth)).floor();
        return Flex(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.horizontal,
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: dashWidth,
              height: dashHeight,
              child: DecoratedBox(
                decoration: BoxDecoration(color: color),
              ),
            );
          }),
        );
      },
    );
  }
}
