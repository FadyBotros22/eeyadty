// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AuthEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is AuthEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AuthEvent()';
  }
}

/// @nodoc
class $AuthEventCopyWith<$Res> {
  $AuthEventCopyWith(AuthEvent _, $Res Function(AuthEvent) __);
}

/// Adds pattern-matching-related methods to [AuthEvent].
extension AuthEventPatterns on AuthEvent {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SendOtp value)? sendOtp,
    TResult Function(VerifyOtp value)? verifyOtp,
    TResult Function(UploadEmployeeImageAndGetUrl value)?
        uploadEmployeeImageAndGetUrl,
    TResult Function(PatchEmployeeProfile value)? patchEmployeeProfile,
    TResult Function(RemoveImageUrl value)? removeImageUrl,
    TResult Function(GetServices value)? getServices,
    TResult Function(PostServices value)? postServices,
    TResult Function(StartedRegistrationSteps value)? startedRegistrationSteps,
    TResult Function(EndedRegistrationSteps value)? endedRegistrationSteps,
    TResult Function(GetTimeSlots value)? getTimeSlots,
    TResult Function(PostTimeSlots value)? postTimeSlots,
    TResult Function(UpdateDeviceId value)? updateDeviceId,
    TResult Function(ResetActivePage value)? resetActivePage,
    TResult Function(Logout value)? logout,
    TResult Function(RemoteLogout value)? remoteLogout,
    TResult Function(PatchLanguage value)? patchLanguage,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case SendOtp() when sendOtp != null:
        return sendOtp(_that);
      case VerifyOtp() when verifyOtp != null:
        return verifyOtp(_that);
      case UploadEmployeeImageAndGetUrl()
          when uploadEmployeeImageAndGetUrl != null:
        return uploadEmployeeImageAndGetUrl(_that);
      case PatchEmployeeProfile() when patchEmployeeProfile != null:
        return patchEmployeeProfile(_that);
      case RemoveImageUrl() when removeImageUrl != null:
        return removeImageUrl(_that);
      case GetServices() when getServices != null:
        return getServices(_that);
      case PostServices() when postServices != null:
        return postServices(_that);
      case StartedRegistrationSteps() when startedRegistrationSteps != null:
        return startedRegistrationSteps(_that);
      case EndedRegistrationSteps() when endedRegistrationSteps != null:
        return endedRegistrationSteps(_that);
      case GetTimeSlots() when getTimeSlots != null:
        return getTimeSlots(_that);
      case PostTimeSlots() when postTimeSlots != null:
        return postTimeSlots(_that);
      case UpdateDeviceId() when updateDeviceId != null:
        return updateDeviceId(_that);
      case ResetActivePage() when resetActivePage != null:
        return resetActivePage(_that);
      case Logout() when logout != null:
        return logout(_that);
      case RemoteLogout() when remoteLogout != null:
        return remoteLogout(_that);
      case PatchLanguage() when patchLanguage != null:
        return patchLanguage(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SendOtp value) sendOtp,
    required TResult Function(VerifyOtp value) verifyOtp,
    required TResult Function(UploadEmployeeImageAndGetUrl value)
        uploadEmployeeImageAndGetUrl,
    required TResult Function(PatchEmployeeProfile value) patchEmployeeProfile,
    required TResult Function(RemoveImageUrl value) removeImageUrl,
    required TResult Function(GetServices value) getServices,
    required TResult Function(PostServices value) postServices,
    required TResult Function(StartedRegistrationSteps value)
        startedRegistrationSteps,
    required TResult Function(EndedRegistrationSteps value)
        endedRegistrationSteps,
    required TResult Function(GetTimeSlots value) getTimeSlots,
    required TResult Function(PostTimeSlots value) postTimeSlots,
    required TResult Function(UpdateDeviceId value) updateDeviceId,
    required TResult Function(ResetActivePage value) resetActivePage,
    required TResult Function(Logout value) logout,
    required TResult Function(RemoteLogout value) remoteLogout,
    required TResult Function(PatchLanguage value) patchLanguage,
  }) {
    final _that = this;
    switch (_that) {
      case SendOtp():
        return sendOtp(_that);
      case VerifyOtp():
        return verifyOtp(_that);
      case UploadEmployeeImageAndGetUrl():
        return uploadEmployeeImageAndGetUrl(_that);
      case PatchEmployeeProfile():
        return patchEmployeeProfile(_that);
      case RemoveImageUrl():
        return removeImageUrl(_that);
      case GetServices():
        return getServices(_that);
      case PostServices():
        return postServices(_that);
      case StartedRegistrationSteps():
        return startedRegistrationSteps(_that);
      case EndedRegistrationSteps():
        return endedRegistrationSteps(_that);
      case GetTimeSlots():
        return getTimeSlots(_that);
      case PostTimeSlots():
        return postTimeSlots(_that);
      case UpdateDeviceId():
        return updateDeviceId(_that);
      case ResetActivePage():
        return resetActivePage(_that);
      case Logout():
        return logout(_that);
      case RemoteLogout():
        return remoteLogout(_that);
      case PatchLanguage():
        return patchLanguage(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SendOtp value)? sendOtp,
    TResult? Function(VerifyOtp value)? verifyOtp,
    TResult? Function(UploadEmployeeImageAndGetUrl value)?
        uploadEmployeeImageAndGetUrl,
    TResult? Function(PatchEmployeeProfile value)? patchEmployeeProfile,
    TResult? Function(RemoveImageUrl value)? removeImageUrl,
    TResult? Function(GetServices value)? getServices,
    TResult? Function(PostServices value)? postServices,
    TResult? Function(StartedRegistrationSteps value)? startedRegistrationSteps,
    TResult? Function(EndedRegistrationSteps value)? endedRegistrationSteps,
    TResult? Function(GetTimeSlots value)? getTimeSlots,
    TResult? Function(PostTimeSlots value)? postTimeSlots,
    TResult? Function(UpdateDeviceId value)? updateDeviceId,
    TResult? Function(ResetActivePage value)? resetActivePage,
    TResult? Function(Logout value)? logout,
    TResult? Function(RemoteLogout value)? remoteLogout,
    TResult? Function(PatchLanguage value)? patchLanguage,
  }) {
    final _that = this;
    switch (_that) {
      case SendOtp() when sendOtp != null:
        return sendOtp(_that);
      case VerifyOtp() when verifyOtp != null:
        return verifyOtp(_that);
      case UploadEmployeeImageAndGetUrl()
          when uploadEmployeeImageAndGetUrl != null:
        return uploadEmployeeImageAndGetUrl(_that);
      case PatchEmployeeProfile() when patchEmployeeProfile != null:
        return patchEmployeeProfile(_that);
      case RemoveImageUrl() when removeImageUrl != null:
        return removeImageUrl(_that);
      case GetServices() when getServices != null:
        return getServices(_that);
      case PostServices() when postServices != null:
        return postServices(_that);
      case StartedRegistrationSteps() when startedRegistrationSteps != null:
        return startedRegistrationSteps(_that);
      case EndedRegistrationSteps() when endedRegistrationSteps != null:
        return endedRegistrationSteps(_that);
      case GetTimeSlots() when getTimeSlots != null:
        return getTimeSlots(_that);
      case PostTimeSlots() when postTimeSlots != null:
        return postTimeSlots(_that);
      case UpdateDeviceId() when updateDeviceId != null:
        return updateDeviceId(_that);
      case ResetActivePage() when resetActivePage != null:
        return resetActivePage(_that);
      case Logout() when logout != null:
        return logout(_that);
      case RemoteLogout() when remoteLogout != null:
        return remoteLogout(_that);
      case PatchLanguage() when patchLanguage != null:
        return patchLanguage(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PhoneNumber? phone, bool isValid, bool? isFromOtpScreen)?
        sendOtp,
    TResult Function(String otp, String phoneNumber, String countryCode)?
        verifyOtp,
    TResult Function(File image)? uploadEmployeeImageAndGetUrl,
    TResult Function(Employee? employee)? patchEmployeeProfile,
    TResult Function()? removeImageUrl,
    TResult Function(String? employeeId, ServiceType? serviceType)? getServices,
    TResult Function(String? employeeId, List<String> serviceIds)? postServices,
    TResult Function()? startedRegistrationSteps,
    TResult Function()? endedRegistrationSteps,
    TResult Function(String? employeeId)? getTimeSlots,
    TResult Function(String? employeeId, List<BusinessHour> businessHours)?
        postTimeSlots,
    TResult Function()? updateDeviceId,
    TResult Function()? resetActivePage,
    TResult Function()? logout,
    TResult Function()? remoteLogout,
    TResult Function(String language)? patchLanguage,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case SendOtp() when sendOtp != null:
        return sendOtp(_that.phone, _that.isValid, _that.isFromOtpScreen);
      case VerifyOtp() when verifyOtp != null:
        return verifyOtp(_that.otp, _that.phoneNumber, _that.countryCode);
      case UploadEmployeeImageAndGetUrl()
          when uploadEmployeeImageAndGetUrl != null:
        return uploadEmployeeImageAndGetUrl(_that.image);
      case PatchEmployeeProfile() when patchEmployeeProfile != null:
        return patchEmployeeProfile(_that.employee);
      case RemoveImageUrl() when removeImageUrl != null:
        return removeImageUrl();
      case GetServices() when getServices != null:
        return getServices(_that.employeeId, _that.serviceType);
      case PostServices() when postServices != null:
        return postServices(_that.employeeId, _that.serviceIds);
      case StartedRegistrationSteps() when startedRegistrationSteps != null:
        return startedRegistrationSteps();
      case EndedRegistrationSteps() when endedRegistrationSteps != null:
        return endedRegistrationSteps();
      case GetTimeSlots() when getTimeSlots != null:
        return getTimeSlots(_that.employeeId);
      case PostTimeSlots() when postTimeSlots != null:
        return postTimeSlots(_that.employeeId, _that.businessHours);
      case UpdateDeviceId() when updateDeviceId != null:
        return updateDeviceId();
      case ResetActivePage() when resetActivePage != null:
        return resetActivePage();
      case Logout() when logout != null:
        return logout();
      case RemoteLogout() when remoteLogout != null:
        return remoteLogout();
      case PatchLanguage() when patchLanguage != null:
        return patchLanguage(_that.language);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            PhoneNumber? phone, bool isValid, bool? isFromOtpScreen)
        sendOtp,
    required TResult Function(
            String otp, String phoneNumber, String countryCode)
        verifyOtp,
    required TResult Function(File image) uploadEmployeeImageAndGetUrl,
    required TResult Function(Employee? employee) patchEmployeeProfile,
    required TResult Function() removeImageUrl,
    required TResult Function(String? employeeId, ServiceType? serviceType)
        getServices,
    required TResult Function(String? employeeId, List<String> serviceIds)
        postServices,
    required TResult Function() startedRegistrationSteps,
    required TResult Function() endedRegistrationSteps,
    required TResult Function(String? employeeId) getTimeSlots,
    required TResult Function(
            String? employeeId, List<BusinessHour> businessHours)
        postTimeSlots,
    required TResult Function() updateDeviceId,
    required TResult Function() resetActivePage,
    required TResult Function() logout,
    required TResult Function() remoteLogout,
    required TResult Function(String language) patchLanguage,
  }) {
    final _that = this;
    switch (_that) {
      case SendOtp():
        return sendOtp(_that.phone, _that.isValid, _that.isFromOtpScreen);
      case VerifyOtp():
        return verifyOtp(_that.otp, _that.phoneNumber, _that.countryCode);
      case UploadEmployeeImageAndGetUrl():
        return uploadEmployeeImageAndGetUrl(_that.image);
      case PatchEmployeeProfile():
        return patchEmployeeProfile(_that.employee);
      case RemoveImageUrl():
        return removeImageUrl();
      case GetServices():
        return getServices(_that.employeeId, _that.serviceType);
      case PostServices():
        return postServices(_that.employeeId, _that.serviceIds);
      case StartedRegistrationSteps():
        return startedRegistrationSteps();
      case EndedRegistrationSteps():
        return endedRegistrationSteps();
      case GetTimeSlots():
        return getTimeSlots(_that.employeeId);
      case PostTimeSlots():
        return postTimeSlots(_that.employeeId, _that.businessHours);
      case UpdateDeviceId():
        return updateDeviceId();
      case ResetActivePage():
        return resetActivePage();
      case Logout():
        return logout();
      case RemoteLogout():
        return remoteLogout();
      case PatchLanguage():
        return patchLanguage(_that.language);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PhoneNumber? phone, bool isValid, bool? isFromOtpScreen)?
        sendOtp,
    TResult? Function(String otp, String phoneNumber, String countryCode)?
        verifyOtp,
    TResult? Function(File image)? uploadEmployeeImageAndGetUrl,
    TResult? Function(Employee? employee)? patchEmployeeProfile,
    TResult? Function()? removeImageUrl,
    TResult? Function(String? employeeId, ServiceType? serviceType)?
        getServices,
    TResult? Function(String? employeeId, List<String> serviceIds)?
        postServices,
    TResult? Function()? startedRegistrationSteps,
    TResult? Function()? endedRegistrationSteps,
    TResult? Function(String? employeeId)? getTimeSlots,
    TResult? Function(String? employeeId, List<BusinessHour> businessHours)?
        postTimeSlots,
    TResult? Function()? updateDeviceId,
    TResult? Function()? resetActivePage,
    TResult? Function()? logout,
    TResult? Function()? remoteLogout,
    TResult? Function(String language)? patchLanguage,
  }) {
    final _that = this;
    switch (_that) {
      case SendOtp() when sendOtp != null:
        return sendOtp(_that.phone, _that.isValid, _that.isFromOtpScreen);
      case VerifyOtp() when verifyOtp != null:
        return verifyOtp(_that.otp, _that.phoneNumber, _that.countryCode);
      case UploadEmployeeImageAndGetUrl()
          when uploadEmployeeImageAndGetUrl != null:
        return uploadEmployeeImageAndGetUrl(_that.image);
      case PatchEmployeeProfile() when patchEmployeeProfile != null:
        return patchEmployeeProfile(_that.employee);
      case RemoveImageUrl() when removeImageUrl != null:
        return removeImageUrl();
      case GetServices() when getServices != null:
        return getServices(_that.employeeId, _that.serviceType);
      case PostServices() when postServices != null:
        return postServices(_that.employeeId, _that.serviceIds);
      case StartedRegistrationSteps() when startedRegistrationSteps != null:
        return startedRegistrationSteps();
      case EndedRegistrationSteps() when endedRegistrationSteps != null:
        return endedRegistrationSteps();
      case GetTimeSlots() when getTimeSlots != null:
        return getTimeSlots(_that.employeeId);
      case PostTimeSlots() when postTimeSlots != null:
        return postTimeSlots(_that.employeeId, _that.businessHours);
      case UpdateDeviceId() when updateDeviceId != null:
        return updateDeviceId();
      case ResetActivePage() when resetActivePage != null:
        return resetActivePage();
      case Logout() when logout != null:
        return logout();
      case RemoteLogout() when remoteLogout != null:
        return remoteLogout();
      case PatchLanguage() when patchLanguage != null:
        return patchLanguage(_that.language);
      case _:
        return null;
    }
  }
}

/// @nodoc

class SendOtp implements AuthEvent {
  const SendOtp({this.phone, required this.isValid, this.isFromOtpScreen});

  final PhoneNumber? phone;
  final bool isValid;
  final bool? isFromOtpScreen;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SendOtpCopyWith<SendOtp> get copyWith =>
      _$SendOtpCopyWithImpl<SendOtp>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SendOtp &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.isValid, isValid) || other.isValid == isValid) &&
            (identical(other.isFromOtpScreen, isFromOtpScreen) ||
                other.isFromOtpScreen == isFromOtpScreen));
  }

  @override
  int get hashCode => Object.hash(runtimeType, phone, isValid, isFromOtpScreen);

  @override
  String toString() {
    return 'AuthEvent.sendOtp(phone: $phone, isValid: $isValid, isFromOtpScreen: $isFromOtpScreen)';
  }
}

/// @nodoc
abstract mixin class $SendOtpCopyWith<$Res>
    implements $AuthEventCopyWith<$Res> {
  factory $SendOtpCopyWith(SendOtp value, $Res Function(SendOtp) _then) =
      _$SendOtpCopyWithImpl;
  @useResult
  $Res call({PhoneNumber? phone, bool isValid, bool? isFromOtpScreen});
}

/// @nodoc
class _$SendOtpCopyWithImpl<$Res> implements $SendOtpCopyWith<$Res> {
  _$SendOtpCopyWithImpl(this._self, this._then);

  final SendOtp _self;
  final $Res Function(SendOtp) _then;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? phone = freezed,
    Object? isValid = null,
    Object? isFromOtpScreen = freezed,
  }) {
    return _then(SendOtp(
      phone: freezed == phone
          ? _self.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as PhoneNumber?,
      isValid: null == isValid
          ? _self.isValid
          : isValid // ignore: cast_nullable_to_non_nullable
              as bool,
      isFromOtpScreen: freezed == isFromOtpScreen
          ? _self.isFromOtpScreen
          : isFromOtpScreen // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

class VerifyOtp implements AuthEvent {
  const VerifyOtp(this.otp, this.phoneNumber, this.countryCode);

  final String otp;
  final String phoneNumber;
  final String countryCode;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $VerifyOtpCopyWith<VerifyOtp> get copyWith =>
      _$VerifyOtpCopyWithImpl<VerifyOtp>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is VerifyOtp &&
            (identical(other.otp, otp) || other.otp == otp) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.countryCode, countryCode) ||
                other.countryCode == countryCode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, otp, phoneNumber, countryCode);

  @override
  String toString() {
    return 'AuthEvent.verifyOtp(otp: $otp, phoneNumber: $phoneNumber, countryCode: $countryCode)';
  }
}

/// @nodoc
abstract mixin class $VerifyOtpCopyWith<$Res>
    implements $AuthEventCopyWith<$Res> {
  factory $VerifyOtpCopyWith(VerifyOtp value, $Res Function(VerifyOtp) _then) =
      _$VerifyOtpCopyWithImpl;
  @useResult
  $Res call({String otp, String phoneNumber, String countryCode});
}

/// @nodoc
class _$VerifyOtpCopyWithImpl<$Res> implements $VerifyOtpCopyWith<$Res> {
  _$VerifyOtpCopyWithImpl(this._self, this._then);

  final VerifyOtp _self;
  final $Res Function(VerifyOtp) _then;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? otp = null,
    Object? phoneNumber = null,
    Object? countryCode = null,
  }) {
    return _then(VerifyOtp(
      null == otp
          ? _self.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as String,
      null == phoneNumber
          ? _self.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      null == countryCode
          ? _self.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class UploadEmployeeImageAndGetUrl implements AuthEvent {
  const UploadEmployeeImageAndGetUrl({required this.image});

  final File image;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UploadEmployeeImageAndGetUrlCopyWith<UploadEmployeeImageAndGetUrl>
      get copyWith => _$UploadEmployeeImageAndGetUrlCopyWithImpl<
          UploadEmployeeImageAndGetUrl>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UploadEmployeeImageAndGetUrl &&
            (identical(other.image, image) || other.image == image));
  }

  @override
  int get hashCode => Object.hash(runtimeType, image);

  @override
  String toString() {
    return 'AuthEvent.uploadEmployeeImageAndGetUrl(image: $image)';
  }
}

/// @nodoc
abstract mixin class $UploadEmployeeImageAndGetUrlCopyWith<$Res>
    implements $AuthEventCopyWith<$Res> {
  factory $UploadEmployeeImageAndGetUrlCopyWith(
          UploadEmployeeImageAndGetUrl value,
          $Res Function(UploadEmployeeImageAndGetUrl) _then) =
      _$UploadEmployeeImageAndGetUrlCopyWithImpl;
  @useResult
  $Res call({File image});
}

/// @nodoc
class _$UploadEmployeeImageAndGetUrlCopyWithImpl<$Res>
    implements $UploadEmployeeImageAndGetUrlCopyWith<$Res> {
  _$UploadEmployeeImageAndGetUrlCopyWithImpl(this._self, this._then);

  final UploadEmployeeImageAndGetUrl _self;
  final $Res Function(UploadEmployeeImageAndGetUrl) _then;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? image = null,
  }) {
    return _then(UploadEmployeeImageAndGetUrl(
      image: null == image
          ? _self.image
          : image // ignore: cast_nullable_to_non_nullable
              as File,
    ));
  }
}

/// @nodoc

class PatchEmployeeProfile implements AuthEvent {
  const PatchEmployeeProfile({this.employee});

  final Employee? employee;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PatchEmployeeProfileCopyWith<PatchEmployeeProfile> get copyWith =>
      _$PatchEmployeeProfileCopyWithImpl<PatchEmployeeProfile>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PatchEmployeeProfile &&
            (identical(other.employee, employee) ||
                other.employee == employee));
  }

  @override
  int get hashCode => Object.hash(runtimeType, employee);

  @override
  String toString() {
    return 'AuthEvent.patchEmployeeProfile(employee: $employee)';
  }
}

/// @nodoc
abstract mixin class $PatchEmployeeProfileCopyWith<$Res>
    implements $AuthEventCopyWith<$Res> {
  factory $PatchEmployeeProfileCopyWith(PatchEmployeeProfile value,
          $Res Function(PatchEmployeeProfile) _then) =
      _$PatchEmployeeProfileCopyWithImpl;
  @useResult
  $Res call({Employee? employee});

  $EmployeeCopyWith<$Res>? get employee;
}

/// @nodoc
class _$PatchEmployeeProfileCopyWithImpl<$Res>
    implements $PatchEmployeeProfileCopyWith<$Res> {
  _$PatchEmployeeProfileCopyWithImpl(this._self, this._then);

  final PatchEmployeeProfile _self;
  final $Res Function(PatchEmployeeProfile) _then;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? employee = freezed,
  }) {
    return _then(PatchEmployeeProfile(
      employee: freezed == employee
          ? _self.employee
          : employee // ignore: cast_nullable_to_non_nullable
              as Employee?,
    ));
  }

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $EmployeeCopyWith<$Res>? get employee {
    if (_self.employee == null) {
      return null;
    }

    return $EmployeeCopyWith<$Res>(_self.employee!, (value) {
      return _then(_self.copyWith(employee: value));
    });
  }
}

/// @nodoc

class RemoveImageUrl implements AuthEvent {
  const RemoveImageUrl();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is RemoveImageUrl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AuthEvent.removeImageUrl()';
  }
}

/// @nodoc

class GetServices implements AuthEvent {
  const GetServices({this.employeeId, this.serviceType});

  final String? employeeId;
  final ServiceType? serviceType;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GetServicesCopyWith<GetServices> get copyWith =>
      _$GetServicesCopyWithImpl<GetServices>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GetServices &&
            (identical(other.employeeId, employeeId) ||
                other.employeeId == employeeId) &&
            (identical(other.serviceType, serviceType) ||
                other.serviceType == serviceType));
  }

  @override
  int get hashCode => Object.hash(runtimeType, employeeId, serviceType);

  @override
  String toString() {
    return 'AuthEvent.getServices(employeeId: $employeeId, serviceType: $serviceType)';
  }
}

/// @nodoc
abstract mixin class $GetServicesCopyWith<$Res>
    implements $AuthEventCopyWith<$Res> {
  factory $GetServicesCopyWith(
          GetServices value, $Res Function(GetServices) _then) =
      _$GetServicesCopyWithImpl;
  @useResult
  $Res call({String? employeeId, ServiceType? serviceType});
}

/// @nodoc
class _$GetServicesCopyWithImpl<$Res> implements $GetServicesCopyWith<$Res> {
  _$GetServicesCopyWithImpl(this._self, this._then);

  final GetServices _self;
  final $Res Function(GetServices) _then;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? employeeId = freezed,
    Object? serviceType = freezed,
  }) {
    return _then(GetServices(
      employeeId: freezed == employeeId
          ? _self.employeeId
          : employeeId // ignore: cast_nullable_to_non_nullable
              as String?,
      serviceType: freezed == serviceType
          ? _self.serviceType
          : serviceType // ignore: cast_nullable_to_non_nullable
              as ServiceType?,
    ));
  }
}

/// @nodoc

class PostServices implements AuthEvent {
  const PostServices({this.employeeId, required final List<String> serviceIds})
      : _serviceIds = serviceIds;

  final String? employeeId;
  final List<String> _serviceIds;
  List<String> get serviceIds {
    if (_serviceIds is EqualUnmodifiableListView) return _serviceIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_serviceIds);
  }

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PostServicesCopyWith<PostServices> get copyWith =>
      _$PostServicesCopyWithImpl<PostServices>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PostServices &&
            (identical(other.employeeId, employeeId) ||
                other.employeeId == employeeId) &&
            const DeepCollectionEquality()
                .equals(other._serviceIds, _serviceIds));
  }

  @override
  int get hashCode => Object.hash(runtimeType, employeeId,
      const DeepCollectionEquality().hash(_serviceIds));

  @override
  String toString() {
    return 'AuthEvent.postServices(employeeId: $employeeId, serviceIds: $serviceIds)';
  }
}

/// @nodoc
abstract mixin class $PostServicesCopyWith<$Res>
    implements $AuthEventCopyWith<$Res> {
  factory $PostServicesCopyWith(
          PostServices value, $Res Function(PostServices) _then) =
      _$PostServicesCopyWithImpl;
  @useResult
  $Res call({String? employeeId, List<String> serviceIds});
}

/// @nodoc
class _$PostServicesCopyWithImpl<$Res> implements $PostServicesCopyWith<$Res> {
  _$PostServicesCopyWithImpl(this._self, this._then);

  final PostServices _self;
  final $Res Function(PostServices) _then;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? employeeId = freezed,
    Object? serviceIds = null,
  }) {
    return _then(PostServices(
      employeeId: freezed == employeeId
          ? _self.employeeId
          : employeeId // ignore: cast_nullable_to_non_nullable
              as String?,
      serviceIds: null == serviceIds
          ? _self._serviceIds
          : serviceIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class StartedRegistrationSteps implements AuthEvent {
  const StartedRegistrationSteps();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is StartedRegistrationSteps);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AuthEvent.startedRegistrationSteps()';
  }
}

/// @nodoc

class EndedRegistrationSteps implements AuthEvent {
  const EndedRegistrationSteps();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is EndedRegistrationSteps);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AuthEvent.endedRegistrationSteps()';
  }
}

/// @nodoc

class GetTimeSlots implements AuthEvent {
  const GetTimeSlots({this.employeeId});

  final String? employeeId;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GetTimeSlotsCopyWith<GetTimeSlots> get copyWith =>
      _$GetTimeSlotsCopyWithImpl<GetTimeSlots>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GetTimeSlots &&
            (identical(other.employeeId, employeeId) ||
                other.employeeId == employeeId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, employeeId);

  @override
  String toString() {
    return 'AuthEvent.getTimeSlots(employeeId: $employeeId)';
  }
}

/// @nodoc
abstract mixin class $GetTimeSlotsCopyWith<$Res>
    implements $AuthEventCopyWith<$Res> {
  factory $GetTimeSlotsCopyWith(
          GetTimeSlots value, $Res Function(GetTimeSlots) _then) =
      _$GetTimeSlotsCopyWithImpl;
  @useResult
  $Res call({String? employeeId});
}

/// @nodoc
class _$GetTimeSlotsCopyWithImpl<$Res> implements $GetTimeSlotsCopyWith<$Res> {
  _$GetTimeSlotsCopyWithImpl(this._self, this._then);

  final GetTimeSlots _self;
  final $Res Function(GetTimeSlots) _then;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? employeeId = freezed,
  }) {
    return _then(GetTimeSlots(
      employeeId: freezed == employeeId
          ? _self.employeeId
          : employeeId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class PostTimeSlots implements AuthEvent {
  const PostTimeSlots(
      {this.employeeId, required final List<BusinessHour> businessHours})
      : _businessHours = businessHours;

  final String? employeeId;
  final List<BusinessHour> _businessHours;
  List<BusinessHour> get businessHours {
    if (_businessHours is EqualUnmodifiableListView) return _businessHours;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_businessHours);
  }

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PostTimeSlotsCopyWith<PostTimeSlots> get copyWith =>
      _$PostTimeSlotsCopyWithImpl<PostTimeSlots>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PostTimeSlots &&
            (identical(other.employeeId, employeeId) ||
                other.employeeId == employeeId) &&
            const DeepCollectionEquality()
                .equals(other._businessHours, _businessHours));
  }

  @override
  int get hashCode => Object.hash(runtimeType, employeeId,
      const DeepCollectionEquality().hash(_businessHours));

  @override
  String toString() {
    return 'AuthEvent.postTimeSlots(employeeId: $employeeId, businessHours: $businessHours)';
  }
}

/// @nodoc
abstract mixin class $PostTimeSlotsCopyWith<$Res>
    implements $AuthEventCopyWith<$Res> {
  factory $PostTimeSlotsCopyWith(
          PostTimeSlots value, $Res Function(PostTimeSlots) _then) =
      _$PostTimeSlotsCopyWithImpl;
  @useResult
  $Res call({String? employeeId, List<BusinessHour> businessHours});
}

/// @nodoc
class _$PostTimeSlotsCopyWithImpl<$Res>
    implements $PostTimeSlotsCopyWith<$Res> {
  _$PostTimeSlotsCopyWithImpl(this._self, this._then);

  final PostTimeSlots _self;
  final $Res Function(PostTimeSlots) _then;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? employeeId = freezed,
    Object? businessHours = null,
  }) {
    return _then(PostTimeSlots(
      employeeId: freezed == employeeId
          ? _self.employeeId
          : employeeId // ignore: cast_nullable_to_non_nullable
              as String?,
      businessHours: null == businessHours
          ? _self._businessHours
          : businessHours // ignore: cast_nullable_to_non_nullable
              as List<BusinessHour>,
    ));
  }
}

/// @nodoc

class UpdateDeviceId implements AuthEvent {
  const UpdateDeviceId();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is UpdateDeviceId);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AuthEvent.updateDeviceId()';
  }
}

/// @nodoc

class ResetActivePage implements AuthEvent {
  const ResetActivePage();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ResetActivePage);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AuthEvent.resetActivePage()';
  }
}

/// @nodoc

class Logout implements AuthEvent {
  const Logout();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is Logout);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AuthEvent.logout()';
  }
}

/// @nodoc

class RemoteLogout implements AuthEvent {
  const RemoteLogout();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is RemoteLogout);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AuthEvent.remoteLogout()';
  }
}

/// @nodoc

class PatchLanguage implements AuthEvent {
  const PatchLanguage({required this.language});

  final String language;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PatchLanguageCopyWith<PatchLanguage> get copyWith =>
      _$PatchLanguageCopyWithImpl<PatchLanguage>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PatchLanguage &&
            (identical(other.language, language) ||
                other.language == language));
  }

  @override
  int get hashCode => Object.hash(runtimeType, language);

  @override
  String toString() {
    return 'AuthEvent.patchLanguage(language: $language)';
  }
}

/// @nodoc
abstract mixin class $PatchLanguageCopyWith<$Res>
    implements $AuthEventCopyWith<$Res> {
  factory $PatchLanguageCopyWith(
          PatchLanguage value, $Res Function(PatchLanguage) _then) =
      _$PatchLanguageCopyWithImpl;
  @useResult
  $Res call({String language});
}

/// @nodoc
class _$PatchLanguageCopyWithImpl<$Res>
    implements $PatchLanguageCopyWith<$Res> {
  _$PatchLanguageCopyWithImpl(this._self, this._then);

  final PatchLanguage _self;
  final $Res Function(PatchLanguage) _then;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? language = null,
  }) {
    return _then(PatchLanguage(
      language: null == language
          ? _self.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
