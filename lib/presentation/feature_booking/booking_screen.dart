import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../../../domain/utils/app_constants.dart';
import '../../../../data/preferences/user_preferences.dart';
import '../../../../domain/di/dependency_injection.dart';
import '../../domain/models/doctor_list_item/doctor_list_item.dart';
import 'bloc/booking_bloc.dart';
import 'bloc/booking_event.dart';
import 'bloc/booking_state.dart';

class BookAppointmentScreen extends StatefulWidget {
  static const route = '/booking_screen';

  final DoctorListItem doctor;

  const BookAppointmentScreen({super.key, required this.doctor});

  @override
  State<BookAppointmentScreen> createState() =>
      _BookAppointmentScreenState();
}

class _BookAppointmentScreenState
    extends State<BookAppointmentScreen> {
  final _notesCtrl = TextEditingController();
  late String _selectedDate;

  // Generate next 7 days
  late final List<DateTime> _dates = List.generate(
    14,
        (i) => DateTime.now().add(Duration(days: i)),
  );

  @override
  void initState() {
    super.initState();
    _selectedDate = _formatDate(_dates.first);
    _loadSlots(_selectedDate);
  }

  @override
  void dispose() {
    _notesCtrl.dispose();
    super.dispose();
  }

  String _formatDate(DateTime d) => DateFormat('yyyy-MM-dd').format(d);

  void _loadSlots(String date) {
    context.read<BookingBloc>().add(BookingEvent.loadSlots(
      doctorId: widget.doctor.id,
      date: date,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BookingBloc, BookingState>(
      listener: (context, state) {
        if (state.bookingSuccess) {
          _showSuccessSheet(context);
        }
        if (state.errorMessage != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage!),
              backgroundColor: AppColors.error,
            ),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.background,
          appBar: AppBar(
            backgroundColor: AppColors.surface,
            elevation: 0,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new_rounded,
                  size: 18, color: AppColors.textPrimary),
              onPressed: () => Navigator.pop(context),
            ),
            title: Text('Book Appointment',
                style: AppTextStyles.h3),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            padding:
            const EdgeInsets.all(AppDimens.paddingLG),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Doctor summary card
                _DoctorSummaryCard(doctor: widget.doctor),
                const SizedBox(height: 28),

                // Date picker
                Text('Select Date', style: AppTextStyles.h3),
                const SizedBox(height: 12),
                _DateStrip(
                  dates: _dates,
                  selectedDate: _selectedDate,
                  onSelect: (date) {
                    setState(() => _selectedDate = date);
                    context
                        .read<BookingBloc>()
                        .add(BookingEvent.selectDate(date));
                    _loadSlots(date);
                  },
                ),
                const SizedBox(height: 28),

                // Time slots
                Text('Available Times', style: AppTextStyles.h3),
                const SizedBox(height: 12),
                _TimeSlotGrid(state: state),
                const SizedBox(height: 28),

                // Notes
                Text('Notes (optional)', style: AppTextStyles.h3),
                const SizedBox(height: 12),
                TextField(
                  controller: _notesCtrl,
                  maxLines: 3,
                  decoration: InputDecoration(
                    hintText: 'Any details for the doctor...',
                    hintStyle: AppTextStyles.body
                        .copyWith(color: AppColors.textHint),
                    filled: true,
                    fillColor: AppColors.surface,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                          AppDimens.radiusMD),
                      borderSide: const BorderSide(
                          color: AppColors.inputBorder),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                          AppDimens.radiusMD),
                      borderSide: const BorderSide(
                          color: AppColors.inputBorder),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                          AppDimens.radiusMD),
                      borderSide: const BorderSide(
                          color: AppColors.primary, width: 1.5),
                    ),
                  ),
                ),
                const SizedBox(height: 32),

                // Confirm button
                _ConfirmButton(
                  state: state,
                  selectedDate: _selectedDate,
                  notes: _notesCtrl.text,
                  doctor: widget.doctor,
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showSuccessSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isDismissible: false,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
            top: Radius.circular(AppDimens.radiusXL)),
      ),
      builder: (_) => Padding(
        padding: const EdgeInsets.all(AppDimens.paddingXL),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 72,
              height: 72,
              decoration: const BoxDecoration(
                color: AppColors.successLight,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.check_rounded,
                  color: AppColors.success, size: 36),
            ),
            const SizedBox(height: 16),
            Text('Appointment Booked!',
                style: AppTextStyles.h2,
                textAlign: TextAlign.center),
            const SizedBox(height: 8),
            Text(
              'Your appointment with ${widget.doctor.name} on $_selectedDate has been confirmed.',
              style: AppTextStyles.body
                  .copyWith(color: AppColors.textSecondary),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 28),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // close sheet
                  Navigator.pop(context); // close booking
                  Navigator.pop(context); // close detail
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  padding:
                  const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        AppDimens.radiusMD),
                  ),
                ),
                child: const Text('Done',
                    style: AppTextStyles.button),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─── Doctor summary card ──────────────────────────────────────────────────────

class _DoctorSummaryCard extends StatelessWidget {
  final DoctorListItem doctor;

  const _DoctorSummaryCard({required this.doctor});

  String get _initials {
    final parts = doctor.name.trim().split(' ');
    if (parts.length == 1) return parts[0][0].toUpperCase();
    return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppDimens.paddingMD),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppDimens.radiusLG),
        border: Border.all(color: AppColors.divider),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 28,
            backgroundColor: AppColors.primary.withValues(alpha: 0.1),
            backgroundImage: doctor.avatarUrl != null
                ? NetworkImage(doctor.avatarUrl!)
                : null,
            child: doctor.avatarUrl == null
                ? Text(_initials,
                style: AppTextStyles.h3
                    .copyWith(color: AppColors.primary))
                : null,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(doctor.name,
                    style: AppTextStyles.body
                        .copyWith(fontWeight: FontWeight.w600)),
                const SizedBox(height: 2),
                Text(doctor.specialty,
                    style: AppTextStyles.bodySmall),
              ],
            ),
          ),
          Text(
            'EGP ${doctor.consultationPrice.toStringAsFixed(0)}',
            style: AppTextStyles.body.copyWith(
                color: AppColors.primary,
                fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}

// ─── Date strip ───────────────────────────────────────────────────────────────

class _DateStrip extends StatelessWidget {
  final List<DateTime> dates;
  final String selectedDate;
  final ValueChanged<String> onSelect;

  const _DateStrip({
    required this.dates,
    required this.selectedDate,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 72,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: dates.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (_, i) {
          final date = dates[i];
          final formatted = DateFormat('yyyy-MM-dd').format(date);
          final isSelected = formatted == selectedDate;
          return GestureDetector(
            onTap: () => onSelect(formatted),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 180),
              width: 56,
              decoration: BoxDecoration(
                color: isSelected
                    ? AppColors.primary
                    : AppColors.surface,
                borderRadius:
                BorderRadius.circular(AppDimens.radiusMD),
                border: Border.all(
                  color: isSelected
                      ? AppColors.primary
                      : AppColors.divider,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    DateFormat('EEE').format(date),
                    style: AppTextStyles.label.copyWith(
                      color: isSelected
                          ? Colors.white70
                          : AppColors.textSecondary,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    DateFormat('d').format(date),
                    style: AppTextStyles.h3.copyWith(
                      color: isSelected
                          ? Colors.white
                          : AppColors.textPrimary,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

// ─── Time slot grid ───────────────────────────────────────────────────────────

class _TimeSlotGrid extends StatelessWidget {
  final BookingState state;

  const _TimeSlotGrid({required this.state});

  @override
  Widget build(BuildContext context) {
    if (state.isLoadingSlots) {
      return const Center(
          child: CircularProgressIndicator());
    }

    if (state.slots.isEmpty) {
      return Container(
        padding: const EdgeInsets.all(AppDimens.paddingLG),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(AppDimens.radiusLG),
          border: Border.all(color: AppColors.divider),
        ),
        child: Center(
          child: Text(
            'No available slots for this day',
            style: AppTextStyles.body
                .copyWith(color: AppColors.textSecondary),
          ),
        ),
      );
    }

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 2.4,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: state.slots.length,
      itemBuilder: (_, i) {
        final slot = state.slots[i];
        final isSelected = state.selectedSlotId == slot.id;
        return GestureDetector(
          onTap: () => context
              .read<BookingBloc>()
              .add(BookingEvent.selectSlot(slot.id)),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 180),
            decoration: BoxDecoration(
              color: isSelected
                  ? AppColors.primary
                  : AppColors.surface,
              borderRadius:
              BorderRadius.circular(AppDimens.radiusMD),
              border: Border.all(
                color: isSelected
                    ? AppColors.primary
                    : AppColors.divider,
              ),
            ),
            alignment: Alignment.center,
            child: Text(
              // Format "09:00:00" → "9:00 AM"
              _formatTime(slot.time),
              style: AppTextStyles.label.copyWith(
                color: isSelected
                    ? Colors.white
                    : AppColors.textPrimary,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        );
      },
    );
  }

  String _formatTime(String raw) {
    try {
      final parts = raw.split(':');
      final hour = int.parse(parts[0]);
      final minute = parts[1];
      final suffix = hour >= 12 ? 'PM' : 'AM';
      final displayHour = hour > 12 ? hour - 12 : (hour == 0 ? 12 : hour);
      return '$displayHour:$minute $suffix';
    } catch (_) {
      return raw;
    }
  }
}

// ─── Confirm button ───────────────────────────────────────────────────────────

class _ConfirmButton extends StatelessWidget {
  final BookingState state;
  final String selectedDate;
  final String notes;
  final DoctorListItem doctor;

  const _ConfirmButton({
    required this.state,
    required this.selectedDate,
    required this.notes,
    required this.doctor,
  });

  @override
  Widget build(BuildContext context) {
    final slot = state.selectedSlotId != null
        ? state.slots.firstWhere((s) => s.id == state.selectedSlotId,
        orElse: () => state.slots.first)
        : null;

    final canBook = slot != null && !state.isBooking;

    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: canBook
            ? () {
          final clientId =
              getIt<UserPreferences>().currentUser.id ?? '';
          context.read<BookingBloc>().add(
            BookingEvent.confirm(
              clientId: clientId,
              doctorId: doctor.id,
              slotId: slot.id,
              date: selectedDate,
              time: slot.time,
              notes: notes,
            ),
          );
        }
            : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          disabledBackgroundColor: AppColors.inputBorder,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimens.radiusMD),
          ),
        ),
        child: state.isBooking
            ? const SizedBox(
          height: 20,
          width: 20,
          child: CircularProgressIndicator(
              strokeWidth: 2, color: Colors.white),
        )
            : const Text('Confirm Appointment',
            style: AppTextStyles.button),
      ),
    );
  }
}