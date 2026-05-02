import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../domain/utils/text_helper.dart';

class ShimmerLoadingLogo extends StatelessWidget {
  const ShimmerLoadingLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade50,
      enabled: true,
      child: AppText(
        "BEAUTISRY",
        textStyle: Styles.customStyle(
          fontSize: 18,
          fontWeight: FontWeight.w800,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
