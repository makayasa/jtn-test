import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jtn/config/color_constants.dart';

import '../controllers/reports_controller.dart';

class ReportsView extends GetView<ReportsController> {
  const ReportsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kPrimaryColor,
      body: Center(
        child: Text(
          'ReportsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
