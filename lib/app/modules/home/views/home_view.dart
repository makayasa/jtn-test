import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jtn/app/components/default_text.dart';
import 'package:jtn/config/color_constants.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColorDarker,
      body: CustomScrollView(
        slivers: [
          // SliverAppBar(
          //   backgroundColor: Colors.white,
          //   title: DefText(
          //     'APP KEUANGAN',
          //   ).semilarge,
          //   centerTitle: true,
          //   bottom: PreferredSize(
          //     preferredSize: Size.fromHeight(0),
          //     child: TabBar(
          //       tabs: [
          //         Tab(),
          //         Tab(),
          //         Tab(),
          //         Tab(),
          //       ],
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
