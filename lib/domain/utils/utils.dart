import 'package:eeyadty/domain/utils/text_helper.dart';
import 'package:eeyadty/domain/utils/ui_constants.dart';
import 'package:flash/flash.dart';
import 'package:flutter/material.dart';

Future<DateTime?> showAppDatePicker(
  BuildContext context, {
  DateTime? initDate,
  DateTime? firstDate,
  DateTime? lastDate,
}) async {
  final DateTime? selectedDate = await showDatePicker(
    context: context,
    initialDate: initDate ?? DateTime(2002),
    firstDate: firstDate ?? DateTime(1900),
    lastDate: lastDate ?? DateTime(2050),
    builder: (context, child) {
      return Theme(
        data: Theme.of(context).copyWith(
          colorScheme: ColorScheme.light(
            primary: ColorConstants.darkBlue,
          ),
        ),
        child: child!,
      );
    },
  );

  return selectedDate;
}

Future<void> showBottomFlash(
  BuildContext context, {
  required String message,
  Color? backgroundColor,
  bool isError = false,
}) async {
  await showFlash(
    context: context,
    duration: const Duration(seconds: 3),
    builder: (_, controller) {
      return FlashBar(
        surfaceTintColor: ColorConstants.transparent,
        controller: controller,
        backgroundColor: backgroundColor ??
            (isError
                ? ColorConstants.lightOrange
                : ColorConstants.secondaryAppColor),
        content: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: Text(message,
                    style: Styles.textNormal14MainColor()
                        .copyWith(color: ColorConstants.snackBarTextColor)),
              ),
            ),
          ],
        ),
      );
    },
  );
}
