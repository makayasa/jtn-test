import 'package:flutter/material.dart';

import '../../config/color_constants.dart';
import 'default_text.dart';

class DefaultDropMenuItem extends StatelessWidget {
  const DefaultDropMenuItem({
    super.key,
    required this.label,
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    return DefText(
      label,
      color: kPrimaryColor,
      fontWeight: FontWeight.bold,
    ).large;
  }
}
