import 'package:flutter/material.dart';
import 'package:jtn/config/color_constants.dart';

import '../../../components/default_text.dart';

class SlideIconItem extends StatelessWidget {
  const SlideIconItem({
    super.key,
    required this.asset,
    required this.label,
    this.onTap,
  });

  final String asset;
  final String label;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        child: Column(
          children: [
            Image.asset(
              asset,
            ),
            DefText(
              // 'Masuk',
              label,
              color: kPrimaryColor,
            ).small,
          ],
        ),
      ),
    );
  }
}
