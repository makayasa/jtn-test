import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/outlet_form_controller.dart';

class OutletFormView extends GetView<OutletFormController> {
  const OutletFormView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OutletFormView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'OutletFormView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
