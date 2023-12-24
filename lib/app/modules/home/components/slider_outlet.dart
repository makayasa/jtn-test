import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
      padding: const EdgeInsets.symmetric(vertical: 10),
      height: 160,
      decoration: const BoxDecoration(
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
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Obx(
                        () => SliderRowData(
                          label: 'Jumlah Barang',
                          isCurrency: false,
                          number: controller.totalItems.value,
                        ),
                      ),
                      Obx(
                        () => SliderRowData(
                          label: 'Total IDR',
                          currencyPrefix: 'Rp',
                          number: controller.totalIdr.value,
                        ),
                      ),
                      Obx(
                        () => SliderRowData(
                          label: 'Total USD',
                          number: controller.totalUsd.value,
                        ),
                      ),
                      Obx(
                        () => SliderRowData(
                          label: 'Total EUR',
                          currencyPrefix: '€',
                          number: controller.totalEur.value,
                        ),
                      ),
                      Obx(
                        () => SliderRowData(
                          label: 'Total SGD',
                          currencyPrefix: r'S$',
                          number: controller.totalSgd.value,
                        ),
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
