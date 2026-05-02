// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProfileEvent {
  String get userId;

  /// Create a copy of ProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProfileEventCopyWith<ProfileEvent> get copyWith =>
      _$ProfileEventCopyWithImpl<ProfileEvent>(
          this as ProfileEvent, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProfileEvent &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userId);

  @override
  String toString() {
    return 'ProfileEvent(userId: $userId)';
  }
}

/// @nodoc
abstract mixin class $ProfileEventCopyWith<$Res> {
  factory $ProfileEventCopyWith(
          ProfileEvent value, $Res Function(ProfileEvent) _then) =
      _$ProfileEventCopyWithImpl;
  @useResult
  $Res call({String userId});
}

/// @nodoc
class _$ProfileEventCopyWithImpl<$Res> implements $ProfileEventCopyWith<$Res> {
  _$ProfileEventCopyWithImpl(this._self, this._then);

  final ProfileEvent _self;
  final $Res Function(ProfileEvent) _then;

  /// Create a copy of ProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
  }) {
    return _then(_self.copyWith(
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [ProfileEvent].
extension ProfileEventPatterns on ProfileEvent {
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
    TResult Function(LoadProfile value)? load,
    TResult Function(UpdateProfile value)? update,
    TResult Function(UploadAvatar value)? uploadAvatar,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case LoadProfile() when load != null:
        return load(_that);
      case UpdateProfile() when update != null:
        return update(_that);
      case UploadAvatar() when uploadAvatar != null:
        return uploadAvatar(_that);
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
    required TResult Function(LoadProfile value) load,
    required TResult Function(UpdateProfile value) update,
    required TResult Function(UploadAvatar value) uploadAvatar,
  }) {
    final _that = this;
    switch (_that) {
      case LoadProfile():
        return load(_that);
      case UpdateProfile():
        return update(_that);
      case UploadAvatar():
        return uploadAvatar(_that);
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
    TResult? Function(LoadProfile value)? load,
    TResult? Function(UpdateProfile value)? update,
    TResult? Function(UploadAvatar value)? uploadAvatar,
  }) {
    final _that = this;
    switch (_that) {
      case LoadProfile() when load != null:
        return load(_that);
      case UpdateProfile() when update != null:
        return update(_that);
      case UploadAvatar() when uploadAvatar != null:
        return uploadAvatar(_that);
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
    TResult Function(String userId, UserRole role)? load,
    TResult Function(
            String userId,
            UserRole role,
            String? fullName,
            String? phoneNumber,
            String? dateOfBirth,
            String? gender,
            String? specialization,
            String? licenseNumber)?
        update,
    TResult Function(String userId, File file)? uploadAvatar,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case LoadProfile() when load != null:
        return load(_that.userId, _that.role);
      case UpdateProfile() when update != null:
        return update(
            _that.userId,
            _that.role,
            _that.fullName,
            _that.phoneNumber,
            _that.dateOfBirth,
            _that.gender,
            _that.specialization,
            _that.licenseNumber);
      case UploadAvatar() when uploadAvatar != null:
        return uploadAvatar(_that.userId, _that.file);
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
    required TResult Function(String userId, UserRole role) load,
    required TResult Function(
            String userId,
            UserRole role,
            String? fullName,
            String? phoneNumber,
            String? dateOfBirth,
            String? gender,
            String? specialization,
            String? licenseNumber)
        update,
    required TResult Function(String userId, File file) uploadAvatar,
  }) {
    final _that = this;
    switch (_that) {
      case LoadProfile():
        return load(_that.userId, _that.role);
      case UpdateProfile():
        return update(
            _that.userId,
            _that.role,
            _that.fullName,
            _that.phoneNumber,
            _that.dateOfBirth,
            _that.gender,
            _that.specialization,
            _that.licenseNumber);
      case UploadAvatar():
        return uploadAvatar(_that.userId, _that.file);
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
    TResult? Function(String userId, UserRole role)? load,
    TResult? Function(
            String userId,
            UserRole role,
            String? fullName,
            String? phoneNumber,
            String? dateOfBirth,
            String? gender,
            String? specialization,
            String? licenseNumber)?
        update,
    TResult? Function(String userId, File file)? uploadAvatar,
  }) {
    final _that = this;
    switch (_that) {
      case LoadProfile() when load != null:
        return load(_that.userId, _that.role);
      case UpdateProfile() when update != null:
        return update(
            _that.userId,
            _that.role,
            _that.fullName,
            _that.phoneNumber,
            _that.dateOfBirth,
            _that.gender,
            _that.specialization,
            _that.licenseNumber);
      case UploadAvatar() when uploadAvatar != null:
        return uploadAvatar(_that.userId, _that.file);
      case _:
        return null;
    }
  }
}

/// @nodoc

class LoadProfile implements ProfileEvent {
  const LoadProfile({required this.userId, required this.role});

  @override
  final String userId;
  final UserRole role;

  /// Create a copy of ProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LoadProfileCopyWith<LoadProfile> get copyWith =>
      _$LoadProfileCopyWithImpl<LoadProfile>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LoadProfile &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.role, role) || other.role == role));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userId, role);

  @override
  String toString() {
    return 'ProfileEvent.load(userId: $userId, role: $role)';
  }
}

/// @nodoc
abstract mixin class $LoadProfileCopyWith<$Res>
    implements $ProfileEventCopyWith<$Res> {
  factory $LoadProfileCopyWith(
          LoadProfile value, $Res Function(LoadProfile) _then) =
      _$LoadProfileCopyWithImpl;
  @override
  @useResult
  $Res call({String userId, UserRole role});
}

/// @nodoc
class _$LoadProfileCopyWithImpl<$Res> implements $LoadProfileCopyWith<$Res> {
  _$LoadProfileCopyWithImpl(this._self, this._then);

  final LoadProfile _self;
  final $Res Function(LoadProfile) _then;

  /// Create a copy of ProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? userId = null,
    Object? role = null,
  }) {
    return _then(LoadProfile(
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _self.role
          : role // ignore: cast_nullable_to_non_nullable
              as UserRole,
    ));
  }
}

/// @nodoc

class UpdateProfile implements ProfileEvent {
  const UpdateProfile(
      {required this.userId,
      required this.role,
      this.fullName,
      this.phoneNumber,
      this.dateOfBirth,
      this.gender,
      this.specialization,
      this.licenseNumber});

  @override
  final String userId;
  final UserRole role;
  final String? fullName;
  final String? phoneNumber;
  final String? dateOfBirth;
  final String? gender;
// Doctor-specific fields
  final String? specialization;
  final String? licenseNumber;

  /// Create a copy of ProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UpdateProfileCopyWith<UpdateProfile> get copyWith =>
      _$UpdateProfileCopyWithImpl<UpdateProfile>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UpdateProfile &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.dateOfBirth, dateOfBirth) ||
                other.dateOfBirth == dateOfBirth) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.specialization, specialization) ||
                other.specialization == specialization) &&
            (identical(other.licenseNumber, licenseNumber) ||
                other.licenseNumber == licenseNumber));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userId, role, fullName,
      phoneNumber, dateOfBirth, gender, specialization, licenseNumber);

  @override
  String toString() {
    return 'ProfileEvent.update(userId: $userId, role: $role, fullName: $fullName, phoneNumber: $phoneNumber, dateOfBirth: $dateOfBirth, gender: $gender, specialization: $specialization, licenseNumber: $licenseNumber)';
  }
}

/// @nodoc
abstract mixin class $UpdateProfileCopyWith<$Res>
    implements $ProfileEventCopyWith<$Res> {
  factory $UpdateProfileCopyWith(
          UpdateProfile value, $Res Function(UpdateProfile) _then) =
      _$UpdateProfileCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String userId,
      UserRole role,
      String? fullName,
      String? phoneNumber,
      String? dateOfBirth,
      String? gender,
      String? specialization,
      String? licenseNumber});
}

/// @nodoc
class _$UpdateProfileCopyWithImpl<$Res>
    implements $UpdateProfileCopyWith<$Res> {
  _$UpdateProfileCopyWithImpl(this._self, this._then);

  final UpdateProfile _self;
  final $Res Function(UpdateProfile) _then;

  /// Create a copy of ProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? userId = null,
    Object? role = null,
    Object? fullName = freezed,
    Object? phoneNumber = freezed,
    Object? dateOfBirth = freezed,
    Object? gender = freezed,
    Object? specialization = freezed,
    Object? licenseNumber = freezed,
  }) {
    return _then(UpdateProfile(
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _self.role
          : role // ignore: cast_nullable_to_non_nullable
              as UserRole,
      fullName: freezed == fullName
          ? _self.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _self.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      dateOfBirth: freezed == dateOfBirth
          ? _self.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _self.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      specialization: freezed == specialization
          ? _self.specialization
          : specialization // ignore: cast_nullable_to_non_nullable
              as String?,
      licenseNumber: freezed == licenseNumber
          ? _self.licenseNumber
          : licenseNumber // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class UploadAvatar implements ProfileEvent {
  const UploadAvatar({required this.userId, required this.file});

  @override
  final String userId;
  final File file;

  /// Create a copy of ProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UploadAvatarCopyWith<UploadAvatar> get copyWith =>
      _$UploadAvatarCopyWithImpl<UploadAvatar>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UploadAvatar &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.file, file) || other.file == file));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userId, file);

  @override
  String toString() {
    return 'ProfileEvent.uploadAvatar(userId: $userId, file: $file)';
  }
}

/// @nodoc
abstract mixin class $UploadAvatarCopyWith<$Res>
    implements $ProfileEventCopyWith<$Res> {
  factory $UploadAvatarCopyWith(
          UploadAvatar value, $Res Function(UploadAvatar) _then) =
      _$UploadAvatarCopyWithImpl;
  @override
  @useResult
  $Res call({String userId, File file});
}

/// @nodoc
class _$UploadAvatarCopyWithImpl<$Res> implements $UploadAvatarCopyWith<$Res> {
  _$UploadAvatarCopyWithImpl(this._self, this._then);

  final UploadAvatar _self;
  final $Res Function(UploadAvatar) _then;

  /// Create a copy of ProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? userId = null,
    Object? file = null,
  }) {
    return _then(UploadAvatar(
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      file: null == file
          ? _self.file
          : file // ignore: cast_nullable_to_non_nullable
              as File,
    ));
  }
}

// dart format on
