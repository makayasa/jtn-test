import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:intl/intl.dart';

import '../../../../config/color_constants.dart';
import '../../../../config/constant.dart';

class DateField extends StatelessWidget {
  const DateField({
    super.key,
    this.isRequired = false,
  });
  final bool isRequired;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: kDefaultScaffoldPadding,
      decoration: const BoxDecoration(
        color: kBgWhite,
        borderRadius: kDefaultBorderRadius15,
      ),
      child: Center(
        child: FormBuilderDateTimePicker(
          name: 'start_date',
          style: kDefaultTextStyle.copyWith(
            color: kPrimaryColor,
            fontWeight: FontWeight.bold,
          ),
          validator: FormBuilderValidators.compose([
            if (isRequired) FormBuilderValidators.required(),
          ]),
          inputType: InputType.date,
          textAlign: TextAlign.center,
          // format: DateFormat(kDateFormat2, "ID"),
        ),
      ),
    );
  }
}
