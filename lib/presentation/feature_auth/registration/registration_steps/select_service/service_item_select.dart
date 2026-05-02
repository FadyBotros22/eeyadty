import 'package:flutter/material.dart';

import '../../../../../domain/utils/text_helper.dart';
import '../../../../../domain/utils/ui_helper.dart';
import '../../../../widgets/app_checkbox.dart';

class ServiceItemSelect extends StatefulWidget {
  final String name;
  final String description;
  final bool checked;
  final Function onChange;

  const ServiceItemSelect(
      {super.key,
      required this.checked,
      required this.description,
      required this.name,
      required this.onChange});

  @override
  State<ServiceItemSelect> createState() => _ServiceItemSelectState();
}

class _ServiceItemSelectState extends State<ServiceItemSelect> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => widget.onChange(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppCheckBox(
            value: widget.checked,
            onChanged: (_) => widget.onChange(),
          ),
          const Width(normalPadding),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Styles.line(),
                ),
                if (widget.description.isNotEmpty) const Height(halfPadding),
                if (widget.description.isNotEmpty)
                  AppText(
                    widget.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textStyle: Styles.subBody(),
                    textAlign: TextAlign.start,
                  ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
