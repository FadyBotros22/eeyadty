import 'package:flutter/material.dart';

import '../../../domain/utils/ui_constants.dart';
import '../../../domain/utils/ui_helper.dart';

enum ModalSize { big, small, tiny, medium, midSmall }

Future<dynamic> showAppModal(
  BuildContext ctx, {
  required Widget child,
  ModalSize? modalSize,
  double? bottomPadding,
  bool isDismissible = true,
  bool enableDrag = true,
}) async {
  return showModalBottomSheet(
    context: ctx,
    isDismissible: isDismissible,
    enableDrag: enableDrag,
    isScrollControlled: true,
    barrierColor: ColorConstants.primaryColor72,
    builder: (ctx) => ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: modalSize == null
          ? Padding(
              padding: EdgeInsets.only(
                  bottom: bottomPadding ??
                      MediaQuery.of(ctx).viewInsets.bottom + triplePadding),
              child: Wrap(
                children: [child],
              ),
            )
          : FractionallySizedBox(
              heightFactor: getBottomSheetSize(modalSize),
              child: child,
            ),
    ),
  );
}

double getBottomSheetSize(ModalSize size) {
  switch (size) {
    case ModalSize.tiny:
      return 0.25;
    case ModalSize.midSmall:
      return 0.4;
    case ModalSize.small:
      return 0.5;
    case ModalSize.medium:
      return 0.65;
    case ModalSize.big:
      return 0.9;
  }
}
