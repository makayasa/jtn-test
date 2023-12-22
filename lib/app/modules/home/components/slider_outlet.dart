import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jtn/config/function_utils.dart';

import '../../../../config/constant.dart';
import '../controllers/home_controller.dart';
import 'slide_icon_item.dart';
import 'slider_row_data.dart';

class SliderOutlet extends GetView<HomeController> {
  const SliderOutlet({
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
          fit: BoxFit.fill,
        ),
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              // if (controller.positioned.value == 0) {
              //   controller.positioned.value = controller.constPotioned;
              // } else {
              //   controller.positioned.value = 0;
              // }
              controller.switchSlider();
            },
            child: Container(
              alignment: Alignment.centerRight,
              width: 40,
              height: 40,
              child: Obx(
                () => AnimatedCrossFade(
                  // crossFadeState: controller.listBoolSlider[index].value ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                  crossFadeState: controller.isSlideOpen.value ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                  duration: kDefaultFastDuration,
                  firstChild: const Icon(
                    Icons.add_circle_outline_outlined,
                  ),
                  secondChild: const Icon(
                    Icons.arrow_back_ios_new_outlined,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SlideIconItem(
                      asset: 'assets/ButtonInputMasuk.png',
                      label: 'MASUK',
                      onTap: () {
                        controller.goToForm(1);
                      },
                    ),
                    SlideIconItem(
                      asset: 'assets/ButtonInputKeluar.png',
                      label: 'KELUAR',
                      onTap: () {
                        controller.goToForm(2);
                      },
                    ),
                    SlideIconItem(
                      asset: 'assets/ButtonInputPindah.png',
                      label: 'PINDAH',
                      onTap: () {
                        controller.goToForm(3);
                      },
                    ),
                    const SlideIconItem(
                      asset: 'assets/ButtonInputMutasi.png',
                      label: 'MUTASI',
                      // onTap: () {
                      //   controller.goToForm(index, 1);
                      // },
                    ),
                    const SlideIconItem(
                      asset: 'assets/ButtonInputKurs.png',
                      label: 'KURS',
                      // onTap: () {
                      //   controller.goToForm(index, 1);
                      // },
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
