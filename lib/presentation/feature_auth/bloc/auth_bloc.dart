import 'dart:async';

import 'package:beautisry_merchant/domain/models/enums/active_auth_page.dart';
import 'package:beautisry_merchant/domain/models/enums/worker_type.dart';
import 'package:beautisry_merchant/presentation/feature_profile/bloc/profile_bloc.dart';
import 'package:beautisry_merchant/presentation/feature_profile/bloc/profile_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import '../../../data/preferences/user_preferences.dart';
import '../../../data/remote/network/failure/failure.dart';
import '../../../data/remote/network/failure/failure_bloc.dart';
import '../../../domain/aws/amplify_config.dart';
import '../../../domain/di/dependency_injection.dart';
import '../../../domain/repositories/auth_repository.dart';
import '../../../domain/repositories/employee_repository.dart';
import '../../../domain/utils/locale_helper.dart';
import '../../feature_appointments/bloc/appointments_bloc.dart';
import '../../feature_appointments/bloc/appointments_event.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final FailureBloc _failureBloc;
  final AuthRepository _authRepository;
  final EmployeeRepository _employeeRepository;
  final UserPreferences _userPreferences;

  AuthBloc(this._failureBloc, this._authRepository, this._employeeRepository,
      this._userPreferences)
      : super(AuthState.initial()) {
    on<SendOtp>(sendOtp);
    on<VerifyOtp>(verifyOtp);
    on<UploadEmployeeImageAndGetUrl>(uploadEmployeeImageAndGetUrl);
    on<PatchEmployeeProfile>(patchEmployeeProfile);
    on<GetServices>(getServices);
    on<PostServices>(postServices);
    on<StartedRegistrationSteps>(startedRegistrationSteps);
    on<EndedRegistrationSteps>(endedRegistrationSteps);
    on<GetTimeSlots>(getTimeslots);
    on<PostTimeSlots>(postTimeSlots);
    on<Logout>(logout);
    on<RemoteLogout>(remoteLogout);
    on<RemoveImageUrl>(removeImageUrl);
    on<PatchLanguage>(patchLanguage);
    on<UpdateDeviceId>(updateDeviceId);
    on<ResetActivePage>(resetActivePage);
  }

  FutureOr<void> sendOtp(SendOtp event, Emitter<AuthState> emit) async {
    emit(state.copyWith(isLoading: true));

    String? phoneNumber = _ensurePhoneIsValid(event.isValid, event.phone);

    if (phoneNumber != null && phoneNumber.isNotEmpty) {
      var result = await _authRepository.sendOtp(phoneNumber: phoneNumber);

      if (result.isSuccess) {
        emit(state.copyWith(
            isLoading: false,
            activePage:
                event.isFromOtpScreen == true ? null : ActiveAuthPage.verifyOtp,
            shouldResetTimer: event.isFromOtpScreen ?? false));
      } else {
        emit(state.copyWith(isLoading: false, activePage: null));
        _failureBloc.add(FailureEvent.showFailure(result.error!));
      }
      emit(state.copyWith(shouldResetTimer: false));
    }
  }

  FutureOr<void> verifyOtp(VerifyOtp event, Emitter<AuthState> emit) async {
    emit(state.copyWith(isLoading: true));
    var result = await _authRepository.verifyOtp(
        otp: event.otp,
        phoneNumber: event.phoneNumber,
        countryCode: event.countryCode);

    if (result.isSuccess) {
      getIt<UserPreferences>().deviceRemoteId = result.data?.device?.id ?? '';
      var isFirstLogin = result.data?.user?.isFirstTimeRegister ?? false;
      var isAdmin = result.data?.user?.workerType == WorkerType.ADMIN;
      emit(
        state.copyWith(
          isLoading: false,
          employee: result.data?.user,
          activePage: isFirstLogin && !isAdmin
              ? ActiveAuthPage.addImage
              : ActiveAuthPage.goHome,
        ),
      );
      add(AuthEvent.patchLanguage(language: getLocaleString()));
    } else {
      emit(state.copyWith(isLoading: false));
      _failureBloc.add(FailureEvent.showFailure(result.error!));
    }
  }

  String? _ensurePhoneIsValid(bool isValid, PhoneNumber? phone) {
    String phoneNumber = '';
    try {
      phoneNumber = phone!.phoneNumber!;
      return phoneNumber;
    } catch (e) {
      _failureBloc.add(const FailureEvent.showFailure(
        Failure(
          methodName: '[CustomerAuthBloc] checkPhoneStatus',
          userMessage: 'Invalid Phone Number',
        ),
      ));
      return '';
    }
  }

  FutureOr<void> getServices(GetServices event, Emitter<AuthState> emit) async {
    emit(state.copyWith(isLoading: true));
    var result = await _employeeRepository.getServices(
        employeeId: event.employeeId, serviceType: event.serviceType);

    if (result.isSuccess) {
      emit(state.copyWith(
          isLoading: false, services: result.data?.services ?? []));
    } else {
      emit(state.copyWith(isLoading: false));
      _failureBloc.add(FailureEvent.showFailure(result.error!));
    }
  }

  FutureOr<void> postServices(
      PostServices event, Emitter<AuthState> emit) async {
    emit(state.copyWith(isLoading: true));
    var result = await _employeeRepository.postServices(
        employeeId: event.employeeId, serviceIds: event.serviceIds);

    if (result.isSuccess) {
      emit(state.copyWith(
          isLoading: false,
          services: result.data?.services ?? [],
          activePage: ActiveAuthPage.addSchedule));
    } else {
      emit(state.copyWith(isLoading: false));
      _failureBloc.add(FailureEvent.showFailure(result.error!));
    }
  }

  FutureOr<void> startedRegistrationSteps(
      StartedRegistrationSteps event, Emitter<AuthState> emit) {
    emit(state.copyWith(inRegistrationSteps: true));
  }

  FutureOr<void> endedRegistrationSteps(
      EndedRegistrationSteps event, Emitter<AuthState> emit) {
    emit(state.copyWith(inRegistrationSteps: false));
  }

  FutureOr<void> getTimeslots(
      GetTimeSlots event, Emitter<AuthState> emit) async {
    emit(state.copyWith(isLoading: true));

    var result =
        await _employeeRepository.getTimeSlots(employeeId: event.employeeId);

    if (result.isSuccess) {
      emit(
        state.copyWith(
          isLoading: false,
          businessHours: result.data?.businessHours ?? [],
        ),
      );
    } else {
      emit(state.copyWith(isLoading: false));
      _failureBloc.add(FailureEvent.showFailure(result.error!));
    }
  }

  FutureOr<void> postTimeSlots(
      PostTimeSlots event, Emitter<AuthState> emit) async {
    emit(state.copyWith(isLoading: true));
    var result = await _employeeRepository.postTimeSlots(
        employeeId: event.employeeId, businessHours: event.businessHours);

    if (result.isSuccess) {
      emit(state.copyWith(isLoading: false, activePage: ActiveAuthPage.goHome));
      _userPreferences.isUserRegistered = true;
      add(const AuthEvent.endedRegistrationSteps());
    } else {
      emit(state.copyWith(isLoading: false));
      _failureBloc.add(FailureEvent.showFailure(result.error!));
    }
  }

  FutureOr<void> uploadEmployeeImageAndGetUrl(
      UploadEmployeeImageAndGetUrl event, Emitter<AuthState> emit) async {
    emit(state.copyWith(isLoading: true));
    await uploadProfilePhoto(
        photo: event.image,
        onSuccess: (imageUrl) {
          _employeeRepository.patchProfile(
              state.employee?.copyWith(imageUrl: imageUrl) ??
                  _userPreferences.currentUser.copyWith(imageUrl: imageUrl));
          emit(
            state.copyWith(
                isLoading: false,
                employee: state.employee?.copyWith(
                  imageUrl: imageUrl,
                ),
                imageLoadingProgress: null,
                activePage: ActiveAuthPage.addServices),
          );
        },
        onFail: (error) {
          emit(state.copyWith(
              isLoading: false, imageLoadingProgress: null, imageUrl: null));
          _failureBloc.add(
            FailureEvent.showFailure(
              Failure(
                methodName: 'Upload profile image',
                userMessage: error,
              ),
            ),
          );
        });
  }

  FutureOr<void> patchEmployeeProfile(
      PatchEmployeeProfile event, Emitter<AuthState> emit) async {
    emit(state.copyWith(isLoading: true));

    var result = await _employeeRepository.patchProfile(event.employee!);

    if (result.isSuccess) {
      emit(state.copyWith(isLoading: false, employee: result.data?.user));
    } else {
      emit(state.copyWith(isLoading: false));
      _failureBloc.add(FailureEvent.showFailure(result.error!));
    }
  }

  FutureOr<void> removeImageUrl(RemoveImageUrl event, Emitter<AuthState> emit) {
    emit(
      state.copyWith(
        employee: state.employee?.copyWith(
          imageUrl: null,
        ),
      ),
    );
  }

  FutureOr<void> resetActivePage(
      ResetActivePage event, Emitter<AuthState> emit) {
    emit(
      state.copyWith(
        activePage: null,
      ),
    );
  }

  FutureOr<void> updateDeviceId(
      UpdateDeviceId event, Emitter<AuthState> emit) async {
    var result = await _authRepository.updateDeviceId();

    if (result.isSuccess) {
      getIt<UserPreferences>().isDeviceIdUpdated = true;
    }
    if (!result.isSuccess) {
      _failureBloc.add(FailureEvent.showFailure(result.error!));
    }
  }

  FutureOr<void> logout(Logout event, Emitter<AuthState> emit) async {
    emit(AuthState.initial());
    getIt<ProfileBloc>().add(const ProfileEvent.reset());
    getIt<AppointmentsBloc>().add(const AppointmentsEvent.reset());
    _userPreferences.logout();
  }

  FutureOr<void> remoteLogout(
      RemoteLogout event, Emitter<AuthState> emit) async {
    var result = await _authRepository.logout();

    if (result.isSuccess) {
      add(const AuthEvent.logout());
    } else {
      emit(state.copyWith(isLoading: false));
      _failureBloc.add(FailureEvent.showFailure(result.error!));
    }
  }

  FutureOr<void> patchLanguage(
      PatchLanguage event, Emitter<AuthState> emit) async {
    String? deviceId = getIt<UserPreferences>().deviceRemoteId;
    if (deviceId != '') {
      var result = await _employeeRepository.patchLanguage(
        language: event.language,
        deviceId: deviceId,
      );
      if (!result.isSuccess) {
        _failureBloc.add(FailureEvent.showFailure(result.error!));
      }
    }
  }
}
