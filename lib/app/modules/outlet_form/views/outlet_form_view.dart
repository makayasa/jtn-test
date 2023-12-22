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
                'Keterangan',
                color: Colors.white,
              ).normal,
            ),
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
