import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

import '../../../../config/color_constants.dart';
import '../../../../config/constant.dart';
import '../../../components/default_dropdown.dart';
import '../../../components/default_dropdown_menu_item.dart';
import '../controllers/outlet_form_controller.dart';

class NominalField extends GetView<OutletFormController> {
  const NominalField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      margin: kDefaultScaffoldPadding,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: const BoxDecoration(
        color: kBgWhite,
        borderRadius: kDefaultBorderRadius15,
      ),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: FormBuilderTextField(
              name: 'nominal',
              textAlign: TextAlign.right,
              decoration: kDefaultInputDecoration('0'),
              style: kDefaultTextStyle.copyWith(color: kPrimaryColor),
            ),
          ),
          const SizedBox(width: 5),
          const SizedBox(
            height: 20,
            width: 10,
            child: DottedLine(
              direction: Axis.vertical,
              dashColor: kPrimaryColor,
            ),
          ),
          // const SizedBox(width: 5),
          Image.asset(
            'assets/IconDollar.png',
          ),
          Container(
            width: 70,
            constraints: const BoxConstraints(
              minWidth: 100,
            ),
            // color: Colors.amber,
            color: kBgWhite,
            child: DefaultDropdown(
              name: 'currency',
              initialValue: controller.listCurrencyType.first.id,
              items: controller.listCurrencyType
                  .map(
                    (element) => DropdownMenuItem(
                      value: element.id,
                      child: DefaultDropMenuItem(
                        label: element.name,
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
