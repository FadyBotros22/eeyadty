import 'package:flutter/material.dart';
import '../../domain/models/doctor/doctor_appointment.dart';
import '../../domain/utils/app_constants.dart';

class AppointmentStatusBadge extends StatelessWidget {
  final AppointmentStatus status;

  const AppointmentStatusBadge({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    Color bg;
    Color textColor;

    switch (status) {
      case AppointmentStatus.completed:
        bg = AppColors.successLight;
        textColor = AppColors.success;
        break;
      case AppointmentStatus.cancelled:
        bg = const Color(0xFFFFE4E6);
        textColor = AppColors.error;
        break;
      default:
        bg = AppColors.confirmedBg;
        textColor = AppColors.confirmedText;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(AppDimens.radiusCircle),
      ),
      child: Text(
        status.name,
        style: TextStyle(
          fontFamily: 'Outfit',
          fontSize: 13,
          fontWeight: FontWeight.w600,
          color: textColor,
        ),
      ),
    );
  }
}
