import 'package:beautisry_merchant/domain/models/business_hour/business_hour.dart';
import 'package:beautisry_merchant/domain/models/time_range/time_range.dart';
import 'package:beautisry_merchant/presentation/feature_auth/registration/registration_steps/select_business_hours/work_hour_item.dart';
import 'package:beautisry_merchant/presentation/widgets/svg_icon.dart';
import 'package:flutter/material.dart';

import '../../../../../domain/utils/text_helper.dart';
import '../../../../../domain/utils/ui_helper.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../../../gen/locale_keys.g.dart';
import '../../../../utils/formatter.dart';
import '../../../../widgets/app_checkbox.dart';

class BusinessHourItem extends StatefulWidget {
  final BusinessHour item;
  final Function(bool) onIsAvailableChanged;
  final Function onAddMoreTap;
  final Function(int slotIndex) onDeleteSlot;
  final Function(TimeRange, int) onTimeRangeChange;

  const BusinessHourItem({
    super.key,
    required this.item,
    required this.onAddMoreTap,
    required this.onDeleteSlot,
    required this.onIsAvailableChanged,
    required this.onTimeRangeChange,
  });

  @override
  State<BusinessHourItem> createState() => _BusinessHourItemState();
}

class _BusinessHourItemState extends State<BusinessHourItem> {
  bool showAddMoreSlot(int index) {
    return index == 1 && widget.item.isAvailable;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 3,
          child: Padding(
            padding: const EdgeInsets.only(top: oneAndHalfPadding),
            child: Row(
              children: [
                AppCheckBox(
                  value: widget.item.isAvailable,
                  onChanged: (v) => widget.onIsAvailableChanged(v!),
                ),
                const Width(5),
                GestureDetector(
                  onTap: () =>
                      widget.onIsAvailableChanged(!widget.item.isAvailable),
                  child: AppText(
                    getAbbrDays(widget.item.day),
                    textStyle: Styles.line(),
                  ),
                ),
              ],
            ),
          ),
        ),
        const Width(5),
        widget.item.timeRanges != null &&
                widget.item.timeRanges?.isNotEmpty == true
            ? Expanded(
                flex: 15,
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: widget.item.timeRanges!.length,
                  itemBuilder: (context, slotIndex) {
                    return _WorkHoursItem(
                      available: widget.item.isAvailable,
                      startTime: widget.item.timeRanges![slotIndex].from!,
                      endTime: widget.item.timeRanges![slotIndex].to!,
                      shouldShowDelete: widget.item.timeRanges!.length > 1,
                      onStartChange: (time) {
                        widget.onTimeRangeChange(
                            TimeRange(
                              from: time.toMinutes(),
                              to: widget.item.timeRanges![slotIndex].to,
                            ),
                            slotIndex);
                      },
                      onEndChange: (time) {
                        widget.onTimeRangeChange(
                            TimeRange(
                              from: widget.item.timeRanges![slotIndex].from,
                              to: time.toMinutes(),
                            ),
                            slotIndex);
                      },
                      delete: () => widget.onDeleteSlot(slotIndex),
                      onAdd: () => widget.onAddMoreTap(),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const Height(10);
                  },
                ),
              )
            : Container(),
      ],
    );
  }
}

class _WorkHoursItem extends StatelessWidget {
  final bool available;
  final int startTime;
  final int endTime;
  final Function(TimeOfDay) onStartChange;
  final Function(TimeOfDay) onEndChange;
  final bool shouldShowDelete;
  final Function delete;
  final Function onAdd;

  const _WorkHoursItem({
    required this.available,
    required this.startTime,
    required this.endTime,
    required this.onStartChange,
    required this.onEndChange,
    required this.delete,
    required this.onAdd,
    this.shouldShowDelete = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: halfPadding),
      child: Row(
        children: [
          WorkHourItem(
            initTime: TimeOfDay.now().fromMinutes(startTime),
            available: available,
            onTimeChange: (time) => onStartChange(time),
            label: LocaleKeys.from,
          ),
          const Width(halfPadding),
          AppText(
            LocaleKeys.registrationScreenSelectWorkingHoursTo,
            textStyle: Styles.subBody(),
          ),
          const Width(halfPadding),
          WorkHourItem(
            initTime: TimeOfDay.now().fromMinutes(endTime),
            available: available,
            onTimeChange: (time) => onEndChange(time),
            label: LocaleKeys.to,
          ),
          const Width(normalPadding),
          GestureDetector(
            onTap: () {
              onAdd();
            },
            child: SvgIcon(
              path: MyAssets.images.svg.icAddButton.path,
              size: 25,
            ),
          ),
          const Width(10),
          if (shouldShowDelete)
            GestureDetector(
              onTap: () => delete(),
              child: SvgIcon(
                path: MyAssets.images.svg.icBin.path,
                size: 20,
              ),
            ),
        ],
      ),
    );
  }
}
