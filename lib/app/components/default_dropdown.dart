import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../config/color_constants.dart';
import '../../config/constant.dart';

class DefaultDropdown extends StatelessWidget {
  const DefaultDropdown({
    super.key,
    required this.name,
    required this.items,
    this.hintText = '',
    this.initialValue,
  });
  final String name;
  final List<DropdownMenuItem<Object?>>? items;
  final String hintText;
  final Object? initialValue;

  @override
  Widget build(BuildContext context) {
    return FormBuilderField(
        initialValue: initialValue,
        name: name,
        validator: FormBuilderValidators.compose([
          FormBuilderValidators.required(),
        ]),
        builder: (FormFieldState<dynamic> field) {
          return DropdownButtonHideUnderline(
            child: DropdownButtonFormField2(
              iconStyleData: const IconStyleData(
                icon: Icon(
                  Icons.expand_more_outlined,
                  color: kPrimaryColor,
                ),
              ),
              decoration: kDefaultInputDecoration(hintText),
              onChanged: (value) {
                field.didChange(value);
              },
              value: field.value,
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(),
              ]),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              dropdownStyleData: kDropdownStyleData,
              items: items,
            ),
          );
        });
  }
}
