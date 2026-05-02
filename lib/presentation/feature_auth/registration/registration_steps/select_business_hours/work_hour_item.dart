import 'package:beautisry_merchant/domain/utils/ui_constants.dart';
import 'package:beautisry_merchant/domain/utils/ui_helper.dart';
import 'package:beautisry_merchant/presentation/widgets/buttons/app_elevated_button.dart';
import 'package:beautisry_merchant/presentation/widgets/modals/modals.dart';
import 'package:flutter/material.dart';
import 'package:wheel_chooser/wheel_chooser.dart';

import '../../../../../domain/utils/text_helper.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../../../gen/locale_keys.g.dart';
import '../../../../utils/formatter.dart';
import '../../../../widgets/close_icon.dart';
import '../../../../widgets/svg_icon.dart';

class WorkHourItem extends StatefulWidget {
  final TimeOfDay initTime;
  final Function(TimeOfDay) onTimeChange;
  final bool available;
  final String label;

  const WorkHourItem({
    super.key,
    required this.initTime,
    required this.onTimeChange,
    this.available = true,
    required this.label,
  });

  @override
  State<WorkHourItem> createState() => _WorkHourItemState();
}

class _WorkHourItemState extends State<WorkHourItem> {
  late TimeOfDay _selectedTime;

  @override
  void initState() {
    _selectedTime = widget.initTime;
    super.initState();
  }

  List<WheelChoice> halfHoursChoices = List.generate(48, (index) {
    int hour = index ~/ 2;
    int minutes = index % 2 == 0 ? 0 : 30;
    TimeOfDay timeOfDay = TimeOfDay(hour: hour, minute: minutes);
    return WheelChoice(
        value: timeOfDay,
        title: Formatter.formattedTime12AndDayPeriod(timeOfDay));
  });


  void _showHoursChooser(
      BuildContext context, Function(dynamic) onChoiceChanged, String label) {

    int indexOfCurrentHalfHour =
        _selectedTime.hour * 2 + (_selectedTime.minute ~/ 30);
    TimeOfDay selectedTime = halfHoursChoices[indexOfCurrentHalfHour].value;

    showAppModal(
      context,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                AppText(
                  label,
                  textStyle: Styles.customStyle(
                    color: ColorConstants.darkBlue,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(),
                CloseIcon(
                  parentContext: context,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 161,
            child: WheelChooser.choices(
              onChoiceChanged: (value) {
                selectedTime = value;
              },
              choices: halfHoursChoices,
              selectTextStyle: Styles.customStyle(
                color: ColorConstants.darkBlue,
                fontSize: 24,
                fontWeight: FontWeight.normal,
              ),
              unSelectTextStyle: Styles.customStyle(
                color: ColorConstants.primaryColor10,
                fontSize: 24,
                fontWeight: FontWeight.normal,
              ),
              startPosition: indexOfCurrentHalfHour, // Set the initial position
            ),
          ),
          const Height(29),
          AppElevatedButton(
                  onTap: () {
                    onChoiceChanged(selectedTime);
                    Navigator.pop(context);
                  },
                  text: LocaleKeys.add)
              .respectBodyMargin()
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: GestureDetector(
        onTap: widget.available
            ? () {
                _showHoursChooser(context, (value) {
                  setState(() {
                    _selectedTime = value;
                    widget.onTimeChange(value);
                  });
                }, widget.label);
              }
            : null,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          decoration: _boxDecoration,
          child: Row(
            children: <Widget>[
              Text(
                Formatter.formattedTime12(_selectedTime),
                style: Styles.subBody(
                  fontWeight: FontWeight.w500,
                  color: ColorConstants.darkBlue,
                ),
              ),
              const Spacer(),
              AppText(
                _selectedTime.period == DayPeriod.am
                    ? LocaleKeys.am
                    : LocaleKeys.pm,
                textStyle: Styles.subBody(
                  color: ColorConstants.darkBlue,
                ),
              ),
              const Spacer(),
              SvgIcon(path: MyAssets.images.svg.arrowDown.path, size: 15)
            ],
          ),
        ),
      ),
    );
  }

  BoxDecoration get _boxDecoration {
    if (widget.available) {
      return BoxDecoration(
        border: Border.all(
          width: 1,
          color: ColorConstants.borderColor,
        ),
        borderRadius: BorderRadius.circular(8),
      );
    }

    return BoxDecoration(
      color: ColorConstants.primaryColor4,
      border: Border.all(
        width: 1,
        color: ColorConstants.primaryColor4,
      ),
      borderRadius: BorderRadius.circular(8),
    );
  }
}
