import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jtn/config/color_constants.dart';

import '../controllers/transaction_controller.dart';

class TransactionView extends GetView<TransactionController> {
  const TransactionView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kPrimaryColor,
      body: Center(
        child: Text(
          'TransactionView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
