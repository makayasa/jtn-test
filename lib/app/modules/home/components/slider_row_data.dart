import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

import '../../../../config/color_constants.dart';
import '../../../../config/function_utils.dart';
import '../../../components/default_text.dart';

class SliderRowData extends StatelessWidget {
  const SliderRowData({
    super.key,
    required this.label,
    required this.number,
    this.isCurrency = true,
    this.currencyPrefix = r"$",
  });

  final String label;
  final int number;
  final bool isCurrency;
  final String currencyPrefix;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        DefText(
          label,
          color: isCurrency ? kPrimaryColor : kBgBlack,
        ).small,
        const Expanded(
          child: DottedLine(
            dashColor: kPrimaryColor2,
          ),
        ),
        DefText(
          isCurrency ? '$currencyPrefix ${currencyFormat(number)}' : '$number',
          color: isCurrency ? kPrimaryColor : kBgBlack,
        ).small,
      ],
    );
  }
}
