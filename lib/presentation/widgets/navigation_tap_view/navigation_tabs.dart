import 'package:flutter/material.dart';

import '../../../domain/utils/ui_constants.dart';

class NavigationTabs extends StatefulWidget {
  final List<Widget> views;
  final List<Widget> tabs;
  final Function(int index)? onTap;
  final int? initialActiveItem;

  const NavigationTabs(
      {super.key,
      required this.views,
      required this.tabs,
      this.initialActiveItem,
      this.onTap});

  @override
  State<NavigationTabs> createState() => _NavigationMenu();
}

class _NavigationMenu extends State<NavigationTabs>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late int itemCount;

  int activeItem = 0;

  @override
  void initState() {
    _tabController = TabController(
      vsync: this,
      length: widget.tabs.length,
    );

    activeItem = widget.initialActiveItem ?? activeItem;
    if (activeItem >= 0) {
      _tabController.animateTo(activeItem);
    }
    super.initState();
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
        LayoutBuilder(
          builder: (context, constraints) {
            double tabWidth = constraints.maxWidth / widget.tabs.length;
            return SizedBox(
              width: double.infinity,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                child: Container(
                    height: 52,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Color(0x0a050a30),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: TabBar(
                        overlayColor:
                            WidgetStateProperty.all(Colors.transparent),
                        tabs: widget.tabs.map((tab) {
                          return SizedBox(
                            width: tabWidth,
                            child: Center(child: tab),
                          );
                        }).toList(),
                        isScrollable: false,
                        // Not scrollable as we want fixed width
                        controller: _tabController,
                        labelColor: ColorConstants.white,
                        indicatorSize: TabBarIndicatorSize.tab,
                        unselectedLabelColor: const Color(0x66050a30),
                        indicator: const BoxDecoration(
                          color: Color(0xff050A30),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        dividerColor: Colors.transparent,
                        onTap: (value) {
                          if (widget.onTap != null) {
                            widget.onTap!(value);
                          } else {
                            _tabController.animateTo(value);
                            setState(() => activeItem = value);
                          }
                        },
                      ),
                    )),
              ),
            );
          },
        ),
        Expanded(
          child: TabBarView(
            physics: null,
            controller: _tabController,
            children: widget.views,
          ),
        ),
      ],
    );
  }
}
