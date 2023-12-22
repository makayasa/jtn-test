import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:jtn/app/components/default_text.dart';
import 'package:jtn/config/color_constants.dart';
import 'package:jtn/config/constant.dart';

import '../../../../config/function_utils.dart';
import '../../../components/default_dropdown.dart';
import '../../../components/default_dropdown_menu_item.dart';
import '../components/date_field.dart';
import '../components/nominal_field.dart';
import '../components/outlet_name_field.dart';
import '../controllers/outlet_form_controller.dart';

class OutletFormView extends GetView<OutletFormController> {
  const OutletFormView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(OutletFormController());
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.formKey.currentState!.saveAndValidate();
          final a = controller.formKey.currentState!.value;
          logKey('a', a);
        },
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Get.back();
          },
          tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
        ),
        title: Obx(
          () => DefText(
            controller.transactionType.value,
            color: kPrimaryColor,
            fontWeight: FontWeight.bold,
          ).semilarge,
        ),
      ),
      backgroundColor: kPrimaryColor,
      body: FormBuilder(
        key: controller.formKey,
        child: ListView(
          children: [
            Container(
              constraints: const BoxConstraints(
                minHeight: 100,
              ),
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                kElevationShadow(color: Colors.black.withOpacity(0.6)),
              ]),
              child: const Center(
                child: OutletNameField(),
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: DefText(
                'Start Date',
                color: kBgWhite,
              ).normal,
            ),
            const SizedBox(height: 5),
            const DateField(),
            const SizedBox(height: 10),
            Center(
              child: DefText('Input', color: kBgWhite).normal,
            ),
            const SizedBox(height: 5),
            const NominalField(),
            const SizedBox(height: 10),
            Center(
              child: DefText(
                'Photo',
                color: Colors.white,
              ).normal,
            ),
            const SizedBox(height: 5),
            const PhotoField(),
            const SizedBox(height: 10),
            Center(
              child: DefText(
                'Keterangan',
                color: Colors.white,
              ).normal,
            ),
            const SizedBox(height: 5),
            Container(
              margin: kDefaultScaffoldPadding,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: kDefaultBorderRadius15,
              ),
              child: FormBuilderTextField(
                name: 'desc',
                style: kDefaultTextStyle.copyWith(color: kPrimaryColor),
                decoration: kDefaultInputDecoration(''),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PhotoField extends GetView<OutletFormController> {
  const PhotoField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: kDefaultScaffoldPadding,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      decoration: const BoxDecoration(color: kBgWhite, borderRadius: kDefaultBorderRadius15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Obx(
            () => OutletPhoto(
              isCurrent: true,
              index: 1,
              path: controller.image1Path.value,
            ),
          ),
          Obx(
            () => OutletPhoto(
              index: 2,
              path: controller.image2Path.value,
              isCurrent: isNotEmpty(controller.image1Path.value),
            ),
          ),
          Obx(
            () => OutletPhoto(
              index: 3,
              path: controller.image3Path.value,
              isCurrent: isNotEmpty(controller.image2Path.value),
            ),
          ),
          Obx(
            () => OutletPhoto(
              index: 4,
              path: controller.image4Path.value,
              isCurrent: isNotEmpty(controller.image3Path.value),
            ),
          ),
        ],
      ),
    );
  }
}

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
      return Container(
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
      );
    }
    return GestureDetector(
      onTap: () {
        controller.pickImage(index);
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
