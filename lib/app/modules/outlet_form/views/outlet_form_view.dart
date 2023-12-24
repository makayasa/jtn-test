import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:jtn/app/components/default_button.dart';
import 'package:jtn/app/components/default_text.dart';
import 'package:jtn/app/helpers/transaction_type_helper.dart';
import 'package:jtn/config/color_constants.dart';
import 'package:jtn/config/constant.dart';

import '../components/date_field.dart';
import '../components/nominal_field.dart';
import '../components/outlet_name_field.dart';
import '../components/photo_field.dart';
import '../controllers/outlet_form_controller.dart';

class OutletFormView extends GetView<OutletFormController> {
  const OutletFormView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(OutletFormController());
    return Scaffold(
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
      resizeToAvoidBottomInset: false,
      body: FormBuilder(
        key: controller.formKey,
        child: Column(
          children: [
            Container(
              constraints: const BoxConstraints(
                minHeight: 100,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  kElevationShadow(color: Colors.black.withOpacity(0.6)),
                ],
              ),
              child: Center(
                child: Obx(
                  () => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const SizedBox(
                        width: 150,
                        child: OutletNameField(
                          isFrom: true,
                          isRequired: true,
                        ),
                      ),
                      if (TransactionTypeHelper.helperString(controller.transactionType.value) == TransactionTypeHelper.PINDAH)
                        const SizedBox(
                          width: 150,
                          child: OutletNameField(
                            isFrom: false,
                            isRequired: true,
                          ),
                        ),
                    ],
                  ),
                ),
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
            const DateField(isRequired: true),
            Obx(
              () => Visibility(
                visible: TransactionTypeHelper.helperString(controller.transactionType.value) == TransactionTypeHelper.KELUAR,
                child: const TitleField(),
              ),
            ),
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
            const SizedBox(height: 20),
            const Spacer(),
            Center(
              child: DefaultButton(
                width: 125,
                color: kPrimaryColor2,
                child: DefText(
                  'Submit',
                  textAlign: TextAlign.center,
                  color: kPrimaryColor,
                ).normal,
                onTap: () {
                  controller.submit();
                },
              ),
            ),
            // const SizedBox(height: 200),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

class TitleField extends StatelessWidget {
  const TitleField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        Center(
          child: DefText(
            'Judul',
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
            name: 'title',
            style: kDefaultTextStyle.copyWith(color: kPrimaryColor),
            decoration: kDefaultInputDecoration(''),
          ),
        ),
      ],
    );
  }
}
