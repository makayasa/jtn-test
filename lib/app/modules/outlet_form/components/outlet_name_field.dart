import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../config/color_constants.dart';
import '../../../../config/constant.dart';
import '../../../components/default_dropdown.dart';
import '../../../components/default_dropdown_menu_item.dart';
import '../controllers/outlet_form_controller.dart';

class OutletNameField extends GetView<OutletFormController> {
  const OutletNameField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      width: 200,
      decoration: BoxDecoration(
        color: kPrimaryColor2,
        borderRadius: kDefaultBorderRadius15,
        boxShadow: [
          kElevationShadow(),
        ],
      ),
      child: DefaultDropdown(
        name: 'outlet',
        hintText: 'Nama Outlet',
        items: controller.listOutlets
            .map(
              (e) => DropdownMenuItem(
                value: e.id,
                child: DefaultDropMenuItem(
                  label: e.outletName,
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
