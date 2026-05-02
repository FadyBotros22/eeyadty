// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'verify_otp.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VerifyOtp {
  String get phoneNumber;
  String get otp;
  String get countryCode;

  /// Create a copy of VerifyOtp
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $VerifyOtpCopyWith<VerifyOtp> get copyWith =>
      _$VerifyOtpCopyWithImpl<VerifyOtp>(this as VerifyOtp, _$identity);

  /// Serializes this VerifyOtp to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is VerifyOtp &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.otp, otp) || other.otp == otp) &&
            (identical(other.countryCode, countryCode) ||
                other.countryCode == countryCode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, phoneNumber, otp, countryCode);

  @override
  String toString() {
    return 'VerifyOtp(phoneNumber: $phoneNumber, otp: $otp, countryCode: $countryCode)';
  }
}

/// @nodoc
abstract mixin class $VerifyOtpCopyWith<$Res> {
  factory $VerifyOtpCopyWith(VerifyOtp value, $Res Function(VerifyOtp) _then) =
      _$VerifyOtpCopyWithImpl;
  @useResult
  $Res call({String phoneNumber, String otp, String countryCode});
}

/// @nodoc
class _$VerifyOtpCopyWithImpl<$Res> implements $VerifyOtpCopyWith<$Res> {
  _$VerifyOtpCopyWithImpl(this._self, this._then);

  final VerifyOtp _self;
  final $Res Function(VerifyOtp) _then;

  /// Create a copy of VerifyOtp
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phoneNumber = null,
    Object? otp = null,
    Object? countryCode = null,
  }) {
    return _then(_self.copyWith(
      phoneNumber: null == phoneNumber
          ? _self.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      otp: null == otp
          ? _self.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as String,
      countryCode: null == countryCode
          ? _self.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [VerifyOtp].
extension VerifyOtpPatterns on VerifyOtp {
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
    TResult Function(_VerifyOtp value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _VerifyOtp() when $default != null:
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
    TResult Function(_VerifyOtp value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VerifyOtp():
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
    TResult? Function(_VerifyOtp value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VerifyOtp() when $default != null:
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
    TResult Function(String phoneNumber, String otp, String countryCode)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _VerifyOtp() when $default != null:
        return $default(_that.phoneNumber, _that.otp, _that.countryCode);
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
    TResult Function(String phoneNumber, String otp, String countryCode)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VerifyOtp():
        return $default(_that.phoneNumber, _that.otp, _that.countryCode);
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
    TResult? Function(String phoneNumber, String otp, String countryCode)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VerifyOtp() when $default != null:
        return $default(_that.phoneNumber, _that.otp, _that.countryCode);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _VerifyOtp extends VerifyOtp {
  _VerifyOtp(
      {required this.phoneNumber, required this.otp, required this.countryCode})
      : super._();
  factory _VerifyOtp.fromJson(Map<String, dynamic> json) =>
      _$VerifyOtpFromJson(json);

  @override
  final String phoneNumber;
  @override
  final String otp;
  @override
  final String countryCode;

  /// Create a copy of VerifyOtp
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$VerifyOtpCopyWith<_VerifyOtp> get copyWith =>
      __$VerifyOtpCopyWithImpl<_VerifyOtp>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$VerifyOtpToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _VerifyOtp &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.otp, otp) || other.otp == otp) &&
            (identical(other.countryCode, countryCode) ||
                other.countryCode == countryCode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, phoneNumber, otp, countryCode);

  @override
  String toString() {
    return 'VerifyOtp(phoneNumber: $phoneNumber, otp: $otp, countryCode: $countryCode)';
  }
}

/// @nodoc
abstract mixin class _$VerifyOtpCopyWith<$Res>
    implements $VerifyOtpCopyWith<$Res> {
  factory _$VerifyOtpCopyWith(
          _VerifyOtp value, $Res Function(_VerifyOtp) _then) =
      __$VerifyOtpCopyWithImpl;
  @override
  @useResult
  $Res call({String phoneNumber, String otp, String countryCode});
}

/// @nodoc
class __$VerifyOtpCopyWithImpl<$Res> implements _$VerifyOtpCopyWith<$Res> {
  __$VerifyOtpCopyWithImpl(this._self, this._then);

  final _VerifyOtp _self;
  final $Res Function(_VerifyOtp) _then;

  /// Create a copy of VerifyOtp
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? phoneNumber = null,
    Object? otp = null,
    Object? countryCode = null,
  }) {
    return _then(_VerifyOtp(
      phoneNumber: null == phoneNumber
          ? _self.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      otp: null == otp
          ? _self.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as String,
      countryCode: null == countryCode
          ? _self.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
