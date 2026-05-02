import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../domain/utils/ui_constants.dart';
import '../../gen/locale_keys.g.dart';

Future<TimeOfDay?> showAppTimePicker(BuildContext context) async {
  return await showTimePicker(
    context: context,
    initialTime: TimeOfDay.fromDateTime(DateTime.now()),
    initialEntryMode: TimePickerEntryMode.inputOnly,
    builder: (BuildContext context, Widget? child) {
      return child!;
    },
  );
}

void showPermissionDialog(
    {required BuildContext context,
    required String content,
    required String actionButtonTitle}) {
  showCupertinoDialog(
    context: context,
    builder: (context) => CupertinoAlertDialog(
      content: Text(
        content,
        style: const TextStyle(fontSize: 16),
      ),
      actions: [
        CupertinoDialogAction(
          child: Text(
            LocaleKeys.bookingDetailsCancel.tr(),
            style: TextStyle(color: ColorConstants.primaryAppColor),
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        CupertinoDialogAction(
          child: Text(
            actionButtonTitle,
            style: TextStyle(color: ColorConstants.darkBlue),
          ),
          onPressed: () {
            Navigator.of(context).pop();
            openAppSettings();
          },
        ),
      ],
    ),
  );
}
