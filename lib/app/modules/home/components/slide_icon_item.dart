import 'package:flutter/material.dart';

import '../../../components/default_text.dart';

class SlideIconItem extends StatelessWidget {
  const SlideIconItem({
    super.key,
    required this.asset,
    required this.label,
  });

  final String asset;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          // 'assets/ButtonInputMasuk.png',
          asset,
        ),
        DefText(
          // 'Masuk',
          label,
        ).small,
      ],
    );
  }
}
