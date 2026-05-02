import 'package:easy_localization/easy_localization.dart';
import 'package:eeyadty/presentation/widgets/svg_icon.dart';
import 'package:flutter/material.dart';

import '../../domain/utils/text_helper.dart';
import '../../domain/utils/ui_constants.dart';
import '../../domain/utils/ui_helper.dart';
import '../../gen/assets.gen.dart';
import '../../gen/locale_keys.g.dart';

class BottomNavbar extends StatelessWidget {
  final Function(int) onChange;
  final int activePage;

  const BottomNavbar({
    super.key,
    required this.onChange,
    required this.activePage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: ColorConstants.borderColor)),
      ),
      padding: const EdgeInsets.only(top: 12),
      child: BottomNavigationBar(
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        enableFeedback: true,
        selectedItemColor: ColorConstants.primaryAppColor,
        unselectedItemColor: ColorConstants.grey,
        selectedLabelStyle: Styles.line(fontSize: 12, color: ColorConstants.primaryAppColor),
        unselectedLabelStyle: Styles.line(fontSize: 12, color: ColorConstants.grey),
        items: [
          _navItem(MyAssets.images.svg.icAppointments.path,
              LocaleKeys.homeNavBarAppointments, 0),
          _navItem(MyAssets.images.svg.icClients.path,
              LocaleKeys.homeNavBarClients, 1),
          _navItem(MyAssets.images.svg.icProfile.path,
              LocaleKeys.homeNavBarProfile, 2),
        ],
        currentIndex: activePage,
        onTap: onChange,
      ),
    );
  }

  BottomNavigationBarItem _navItem(String path, String label, int page) {
    return BottomNavigationBarItem(
      icon: Container(
        padding: const EdgeInsets.only(bottom: halfPadding),
        child: SvgIcon(
          path: path,
          size: 24,
          color: activePage == page
              ? null
              : ColorConstants.grey,
        ),
      ),
      label: label.tr(),
    );
  }
}
