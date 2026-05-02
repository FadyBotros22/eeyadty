import 'package:beautisry_merchant/domain/models/employee/employee.dart';
import 'package:beautisry_merchant/domain/models/enums/active_auth_page.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/models/business_hour/business_hour.dart';
import '../../../domain/models/service/service.dart';

part 'auth_state.freezed.dart';

@freezed
abstract class AuthState with _$AuthState {
  const AuthState._();

  const factory AuthState({
    @Default(false) bool isLoading,
    @Default(false) bool inRegistrationSteps,
    @Default(false) bool shouldResetTimer,
    @Default('') String phoneNumber,
    Employee? employee,
    String? imageUrl,
    double? imageLoadingProgress,
    ActiveAuthPage? activePage,
    @Default([]) List<Service> services,
    @Default([]) List<BusinessHour> businessHours,
  }) = _AuthState;

  factory AuthState.initial() => const AuthState();
}
