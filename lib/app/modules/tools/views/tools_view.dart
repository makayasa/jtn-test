import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jtn/config/color_constants.dart';

import '../controllers/tools_controller.dart';

class ToolsView extends GetView<ToolsController> {
  const ToolsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kPrimaryColor,
      body: Center(
        child: Text(
          'ToolsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
