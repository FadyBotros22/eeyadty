import 'package:flutter/material.dart';

import '../../domain/di/dependency_injection.dart';
import '../../domain/utils/ui_constants.dart';
import '../../domain/utils/ui_helper.dart';
import '../feature_profile/bloc/profile_bloc.dart';
import '../feature_profile/bloc/profile_event.dart';

class TabView extends StatefulWidget {
  final List<Widget> views;
  final List<Widget> tabs;
  final TabAlignment? tabAlignment;
  final Color? textColor;
  final Color? underlineColor;
  final double? tabPadding;
  final Function(int index)? onTap;

  final bool addInvisibleView;
  final int? initialActiveItem;
  final bool addTabStartPadding;

  const TabView(
      {super.key,
      required this.views,
      this.addInvisibleView = false,
      required this.tabs,
      this.initialActiveItem,
      this.onTap,
      this.tabAlignment,
      this.tabPadding,
      this.textColor,
      this.underlineColor,
      this.addTabStartPadding = false});

  @override
  State<TabView> createState() => _TabViewState();
}

class _TabViewState extends State<TabView> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late int itemCount;

  int activeItem = 0;

  @override
  void didUpdateWidget(covariant TabView oldWidget) {
    setState(() {
      activeItem = widget.initialActiveItem ?? activeItem;
    });
    if (activeItem >= 0) {
      _tabController.animateTo(activeItem);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    super.initState();

    _tabController = TabController(
      vsync: this,
      length: widget.views.length,
      initialIndex: widget.initialActiveItem ?? 0,
    );
    _tabController.addListener(() {
      // getIt<ProfileBloc>()
      //     .add(ProfileEvent.changeTabs(index: _tabController.index));

      setState(() {
        activeItem = _tabController.index;
      });
    });
    activeItem = widget.initialActiveItem ?? activeItem;
    if (activeItem >= 0) {
      _tabController.animateTo(activeItem);
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 40,
          child: TabBar(
            overlayColor: WidgetStateProperty.all(Colors.transparent),
            tabs: widget.tabs,
            isScrollable: true,
            controller: _tabController,
            tabAlignment: widget.tabAlignment ?? TabAlignment.start,
            labelColor: (widget.textColor != null)
                ? widget.textColor
                : ColorConstants.darkBlue,
            unselectedLabelColor: ColorConstants.primaryColor40,
            labelStyle: const TextStyle(fontWeight: FontWeight.w700),
            unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500),
            indicator: BoxDecoration(
              shape: BoxShape.rectangle,
              border: Border(
                bottom: BorderSide(
                  color: (widget.underlineColor != null)
                      ? widget.underlineColor!
                      : ColorConstants.darkBlue,
                  width: 3,
                ),
              ),
            ),
            labelPadding: EdgeInsetsDirectional.only(
              start: 0,
              end: widget.tabPadding ?? 0,
              bottom: halfPadding,
            ),
            dividerColor: ColorConstants.borderColor,
            onTap: (value) {
              if (widget.onTap != null) {
                // getIt<ProfileBloc>()
                //     .add(ProfileEvent.changeTabs(index: _tabController.index));
              } else {
                _tabController.animateTo(value);
                setState(() => activeItem = value);
              }
            },
          ).respectBodyMargin(addPadding: widget.addTabStartPadding),
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: widget.views,
          ),
        ),
      ],
    );
  }
}
