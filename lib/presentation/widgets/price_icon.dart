import 'package:eeyadty/presentation/utils/extensions.dart';
import 'package:eeyadty/presentation/widgets/svg_icon.dart';
import 'package:flutter/cupertino.dart';

import '../../domain/utils/locale_helper.dart';
import '../../domain/utils/text_helper.dart';
import '../../domain/utils/ui_constants.dart';
import '../../domain/utils/ui_helper.dart';
import '../../gen/assets.gen.dart';
import '../utils/formatter.dart';

class PriceIcon extends StatelessWidget {
  const PriceIcon({
    super.key,
    required this.price,
    this.style,
    this.iconColor,
    this.iconSize,
    this.isPercentage,
  });
  final double? price;
  final TextStyle? style;
  final Color? iconColor;
  final double? iconSize;
  final bool? isPercentage;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (isPercentage == true || getLocaleString() == 'ar')
          AppText(
            Formatter.convertToArabicNumbers(price?.formatDecimal()) ??
                Formatter.convertToArabicNumbers('0')!,
            textStyle: style,
          ),
        if (isPercentage != true && getLocaleString() == 'ar') const Width(4),
        SvgIcon(
          path: isPercentage == true
              ? MyAssets.images.svg.icPercentage.path
              : MyAssets.images.svg.icReal.path,
          color: iconColor ?? ColorConstants.darkBlue,
          size: iconSize ?? 18,
        ),
        if (isPercentage != true && getLocaleString() == 'en') const Width(4),
        if (isPercentage != true && getLocaleString() == 'en')
          AppText(
            Formatter.convertToArabicNumbers(price?.formatDecimal()) ??
                Formatter.convertToArabicNumbers('0')!,
            textStyle: style,
          )
      ],
    );
  }
}
