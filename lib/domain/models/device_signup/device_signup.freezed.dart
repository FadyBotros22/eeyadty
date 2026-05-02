// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'device_signup.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DeviceSignup {
  OS get os;
  String get deviceId;
  String? get fcmToken;

  /// Create a copy of DeviceSignup
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DeviceSignupCopyWith<DeviceSignup> get copyWith =>
      _$DeviceSignupCopyWithImpl<DeviceSignup>(
          this as DeviceSignup, _$identity);

  /// Serializes this DeviceSignup to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DeviceSignup &&
            (identical(other.os, os) || other.os == os) &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId) &&
            (identical(other.fcmToken, fcmToken) ||
                other.fcmToken == fcmToken));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, os, deviceId, fcmToken);

  @override
  String toString() {
    return 'DeviceSignup(os: $os, deviceId: $deviceId, fcmToken: $fcmToken)';
  }
}

/// @nodoc
abstract mixin class $DeviceSignupCopyWith<$Res> {
  factory $DeviceSignupCopyWith(
          DeviceSignup value, $Res Function(DeviceSignup) _then) =
      _$DeviceSignupCopyWithImpl;
  @useResult
  $Res call({OS os, String deviceId, String? fcmToken});
}

/// @nodoc
class _$DeviceSignupCopyWithImpl<$Res> implements $DeviceSignupCopyWith<$Res> {
  _$DeviceSignupCopyWithImpl(this._self, this._then);

  final DeviceSignup _self;
  final $Res Function(DeviceSignup) _then;

  /// Create a copy of DeviceSignup
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? os = null,
    Object? deviceId = null,
    Object? fcmToken = freezed,
  }) {
    return _then(_self.copyWith(
      os: null == os
          ? _self.os
          : os // ignore: cast_nullable_to_non_nullable
              as OS,
      deviceId: null == deviceId
          ? _self.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String,
      fcmToken: freezed == fcmToken
          ? _self.fcmToken
          : fcmToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [DeviceSignup].
extension DeviceSignupPatterns on DeviceSignup {
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
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_DeviceSignup value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DeviceSignup() when $default != null:
        return $default(_that);
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
  TResult map<TResult extends Object?>(
    TResult Function(_DeviceSignup value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DeviceSignup():
        return $default(_that);
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
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_DeviceSignup value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DeviceSignup() when $default != null:
        return $default(_that);
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
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(OS os, String deviceId, String? fcmToken)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DeviceSignup() when $default != null:
        return $default(_that.os, _that.deviceId, _that.fcmToken);
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
  TResult when<TResult extends Object?>(
    TResult Function(OS os, String deviceId, String? fcmToken) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DeviceSignup():
        return $default(_that.os, _that.deviceId, _that.fcmToken);
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
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(OS os, String deviceId, String? fcmToken)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DeviceSignup() when $default != null:
        return $default(_that.os, _that.deviceId, _that.fcmToken);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _DeviceSignup extends DeviceSignup {
  _DeviceSignup({required this.os, required this.deviceId, this.fcmToken})
      : super._();
  factory _DeviceSignup.fromJson(Map<String, dynamic> json) =>
      _$DeviceSignupFromJson(json);

  @override
  final OS os;
  @override
  final String deviceId;
  @override
  final String? fcmToken;

  /// Create a copy of DeviceSignup
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DeviceSignupCopyWith<_DeviceSignup> get copyWith =>
      __$DeviceSignupCopyWithImpl<_DeviceSignup>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$DeviceSignupToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DeviceSignup &&
            (identical(other.os, os) || other.os == os) &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId) &&
            (identical(other.fcmToken, fcmToken) ||
                other.fcmToken == fcmToken));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, os, deviceId, fcmToken);

  @override
  String toString() {
    return 'DeviceSignup(os: $os, deviceId: $deviceId, fcmToken: $fcmToken)';
  }
}

/// @nodoc
abstract mixin class _$DeviceSignupCopyWith<$Res>
    implements $DeviceSignupCopyWith<$Res> {
  factory _$DeviceSignupCopyWith(
          _DeviceSignup value, $Res Function(_DeviceSignup) _then) =
      __$DeviceSignupCopyWithImpl;
  @override
  @useResult
  $Res call({OS os, String deviceId, String? fcmToken});
}

/// @nodoc
class __$DeviceSignupCopyWithImpl<$Res>
    implements _$DeviceSignupCopyWith<$Res> {
  __$DeviceSignupCopyWithImpl(this._self, this._then);

  final _DeviceSignup _self;
  final $Res Function(_DeviceSignup) _then;

  /// Create a copy of DeviceSignup
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? os = null,
    Object? deviceId = null,
    Object? fcmToken = freezed,
  }) {
    return _then(_DeviceSignup(
      os: null == os
          ? _self.os
          : os // ignore: cast_nullable_to_non_nullable
              as OS,
      deviceId: null == deviceId
          ? _self.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String,
      fcmToken: freezed == fcmToken
          ? _self.fcmToken
          : fcmToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
