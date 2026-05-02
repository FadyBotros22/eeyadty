import 'package:eeyadty/presentation/widgets/svg_icon.dart';
import 'package:flutter/cupertino.dart';

import '../../domain/utils/ui_constants.dart';
import '../../gen/assets.gen.dart';

class RatingStars extends StatefulWidget {
  final int starsNumber;
  const RatingStars({super.key, required this.starsNumber});

  @override
  State<RatingStars> createState() => _RatingStarsState();
}

class _RatingStarsState extends State<RatingStars> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: List<Widget>.generate(5, (index) {
        return Padding(
          padding: const EdgeInsetsDirectional.only(end: 2),
          child: SvgIcon(
            path: MyAssets.images.svg.icStar.path,
            size: 16,
            color: index < widget.starsNumber? null : ColorConstants.secondaryAppColor,
          ),
        );
      }),
    );
  }
}
