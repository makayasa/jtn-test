import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../config/color_constants.dart';
import '../../../../config/constant.dart';
import '../../../../config/function_utils.dart';
import '../../../components/default_text.dart';
import '../controllers/outlet_form_controller.dart';

class OutletPhoto extends GetView<OutletFormController> {
  const OutletPhoto({
    super.key,
    this.isEmpty = true,
    this.isCurrent = false,
    this.path = '',
    required this.index,
  });

  final bool isEmpty;
  final bool isCurrent;
  final String path;
  final int index;

  @override
  Widget build(BuildContext context) {
    if (isNotEmpty(path)) {
      return GestureDetector(
        onLongPress: () {
          controller.deleteImage(index);
        },
        child: Container(
          height: 60,
          width: 75,
          decoration: BoxDecoration(
            color: isCurrent ? kPrimaryColor2 : kPrimaryColor3,
            borderRadius: kDefaultBorderRadius10,
            boxShadow: [
              kElevationShadow(),
            ],
          ),
          child: ClipRRect(
            borderRadius: kDefaultBorderRadius10,
            child: Image.file(
              File(path),
              fit: BoxFit.cover,
            ),
          ),
        ),
      );
    }
    return GestureDetector(
      onTap: () {
        if (isCurrent) {
          controller.pickImage(index);
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        height: 60,
        width: 75,
        decoration: BoxDecoration(
          color: isCurrent ? kPrimaryColor2 : kPrimaryColor3,
          borderRadius: kDefaultBorderRadius10,
          boxShadow: [
            kElevationShadow(),
          ],
        ),
        child: Visibility(
          visible: isCurrent,
          child: Column(
            children: [
              Image.asset(
                // File(path),
                'assets/Union.png',
              ),
              const SizedBox(height: 2),
              DefText(
                'Tambahkan\nFoto',
                textAlign: TextAlign.center,
                color: kPrimaryColor,
              ).small,
            ],
          ),
        ),
      ),
    );
  }
}
