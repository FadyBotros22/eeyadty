import 'package:flutter/material.dart';
import 'package:store_redirect/store_redirect.dart';

import '../../../app_config.dart';
import '../../../domain/utils/text_helper.dart';
import '../../../domain/utils/ui_constants.dart';
import '../../../domain/utils/ui_helper.dart';
import '../../../gen/assets.gen.dart';
import '../../../gen/locale_keys.g.dart';
import '../../widgets/buttons/app_clear_background_button.dart';
import '../../widgets/buttons/app_elevated_button.dart';
import '../../widgets/modals/modals.dart';
import '../../widgets/svg_icon.dart';

void showMinimumAppVersionDialog({
  required BuildContext buildContext,
  bool isDismiss = true,
  String? message,
}) {
  showAppModal(buildContext,
      isDismissible: isDismiss,
      enableDrag: isDismiss,
      child: Padding(
        padding: const EdgeInsets.only(top: 24, left: 24, right: 24),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                AppText(
                  LocaleKeys.appVersionBottomSheetTitle,
                  maxLines: 1,
                  textStyle: Styles.customStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                    color: ColorConstants.darkBlue,
                  ),
                ),
                if (isDismiss)
                  InkWell(
                    onTap: () {
                      Navigator.of(buildContext).pop();
                    },
                    child: SvgIcon(
                      path: MyAssets.images.svg.icClose.path,
                      size: 16,
                    ),
                  ),
              ],
            ),
            const Height(24),
            AppText(
              message ?? LocaleKeys.appVersionBottomSheetSubTitle,
              textAlign: TextAlign.start,
              textStyle: Styles.customStyle(
                fontWeight: FontWeight.w400,
                fontSize: 13,
                color: ColorConstants.primaryColor60,
              ),
            ),
            const Height(20),
            AppElevatedButton(
              onTap: () {
                StoreRedirect.redirect(
                  androidAppId: AppConfig.shared.bundleId,
                  iOSAppId: AppConfig.shared.appleAppId,
                );
              },
              text: LocaleKeys.appVersionBottomSheetUpdateButton,
            ),
            if (isDismiss) const Height(8),
            if (isDismiss)
              AppClearBackgroundButton(
                onTap: () {
                  Navigator.of(buildContext).pop();
                },
                text: LocaleKeys.appVersionBottomSheetMaybeLaterButton,
                textStyle: Styles.customStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 13,
                ),
              ),
          ],
        ),
      ));
}
