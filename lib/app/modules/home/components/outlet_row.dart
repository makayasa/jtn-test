import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

import '../../../../config/color_constants.dart';
import '../../../../config/function_utils.dart';
import '../../../components/default_text.dart';

class OutletRow extends StatelessWidget {
  const OutletRow({
    super.key,
    required this.currencyName,
    required this.number,
  });
  final String currencyName;
  final int number;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 45),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset('assets/IconDollar.png'),
              const SizedBox(width: 5),
              DefText(currencyName).normal,
              const SizedBox(width: 10),
              const Expanded(
                child: DottedLine(
                  dashColor: kPrimaryColor,
                ),
              ),
              const SizedBox(width: 10),
              DefText(
                currencyFormat(number),
                color: kPrimaryColor,
                fontWeight: FontWeight.bold,
              ).normal,
            ],
          ),
        ],
      ),
    );
  }
}
