import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../../../config/color_constants.dart';
import '../../../../config/constant.dart';

class DateField extends StatelessWidget {
  const DateField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: kDefaultScaffoldPadding,
      decoration: const BoxDecoration(
        color: kBgWhite,
        borderRadius: kDefaultBorderRadius15,
      ),
      child: FormBuilderDateTimePicker(
        name: 'start_date',
      ),
    );
  }
}
