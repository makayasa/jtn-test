import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jtn/app/components/default_text.dart';
import 'package:jtn/app/modules/home/views/home_view.dart';
import 'package:jtn/app/modules/reports/views/reports_view.dart';
import 'package:jtn/app/modules/tools/views/tools_view.dart';
import 'package:jtn/app/modules/transaction/views/transaction_view.dart';
import 'package:jtn/config/color_constants.dart';
import 'package:jtn/config/constant.dart';

import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(DashboardController());
    return Scaffold(
      appBar: AppBar(
        title: DefText(
          'APP KEUANGAN',
          fontWeight: FontWeight.bold,
          color: kPrimaryColor,
        ).semilarge,
        actions: [
          Image.asset(
            'assets/ButtonNotifikasi.png',
          ),
          const SizedBox(width: 10),
        ],
        centerTitle: true,
        backgroundColor: Colors.white,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          // preferredSize: Size(Get.mediaQuery.size.width, 80),
          child: Container(
            color: Colors.white,
            child: TabBar(
              controller: controller.tabController,
              indicatorColor: Colors.transparent,
              onTap: (value) {
                controller.tabIndex.value = value;
              },
              dividerColor: Colors.transparent,
              tabs: [
                Obx(
                  () => TabItem(
                    assets: controller.tabIndex.value == 0 ? 'assets/IconHome.png' : 'assets/ButtonHomeTidakAktif.png',
                    label: 'HOME',
                    textColor: controller.tabIndex.value == 0 ? kPrimaryColor : kInactiveColor,
                  ),
                ),
                Obx(
                  () => TabItem(
                    assets: controller.tabIndex.value == 1 ? 'assets/ButtonTransaksiAktif.png' : 'assets/ButtonTransaksiTidakAktif.png',
                    label: 'TRANSAKSI',
                    textColor: controller.tabIndex.value == 1 ? kPrimaryColor : kInactiveColor,
                  ),
                ),
                Obx(
                  () => TabItem(
                    assets: controller.tabIndex.value == 2 ? 'assets/ButtonLaporanAktif.png' : 'assets/ButtonLaporanTidak Aktif.png',
                    label: 'LAPORAN',
                    textColor: controller.tabIndex.value == 2 ? kPrimaryColor : kInactiveColor,
                  ),
                ),
                Obx(
                  () => TabItem(
                    assets: controller.tabIndex.value == 3 ? 'assets/ButtonToolsAktif.png' : 'assets/ButtonToolsTidakAktif.png',
                    label: 'TOOLS',
                    textColor: controller.tabIndex.value == 3 ? kPrimaryColor : kInactiveColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: kPrimaryColor,
      body: Column(
        children: [
          Container(
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(20),
                  ),
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: const BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                      ),
                    ),
                  ),
                ),
                Container(
                  color: kPrimaryColor,
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(14),
                        bottomRight: Radius.circular(14),
                      ),
                    ),
                    child: Image.asset(
                      'assets/ButtonRefresh.png',
                    ),
                  ),
                ),
                Container(
                  height: 40,
                  width: 40,
                  decoration: const BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: controller.tabController,
              children: const [
                HomeView(),
                TransactionView(),
                ReportsView(),
                ToolsView(),
              ],
            ),
          ),
          // Expanded(
          //   child: PageView(
          //     children: const [
          //       HomeView(),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}

class TabItem extends GetView<DashboardController> {
  const TabItem({
    super.key,
    required this.assets,
    required this.label,
    this.textColor,
  });

  final String assets;
  final String label;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Tab(
      height: 60,
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(assets),
            DefText(
              label,
              color: textColor ?? kBgBlack,
            ).small,
          ],
        ),
      ),
    );
  }
}
