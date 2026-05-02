// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'extend_token_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ExtendTokenResponse {
  Device? get device;

  /// Create a copy of ExtendTokenResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ExtendTokenResponseCopyWith<ExtendTokenResponse> get copyWith =>
      _$ExtendTokenResponseCopyWithImpl<ExtendTokenResponse>(
          this as ExtendTokenResponse, _$identity);

  /// Serializes this ExtendTokenResponse to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ExtendTokenResponse &&
            (identical(other.device, device) || other.device == device));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, device);

  @override
  String toString() {
    return 'ExtendTokenResponse(device: $device)';
  }
}

/// @nodoc
abstract mixin class $ExtendTokenResponseCopyWith<$Res> {
  factory $ExtendTokenResponseCopyWith(
          ExtendTokenResponse value, $Res Function(ExtendTokenResponse) _then) =
      _$ExtendTokenResponseCopyWithImpl;
  @useResult
  $Res call({Device? device});

  $DeviceCopyWith<$Res>? get device;
}

/// @nodoc
class _$ExtendTokenResponseCopyWithImpl<$Res>
    implements $ExtendTokenResponseCopyWith<$Res> {
  _$ExtendTokenResponseCopyWithImpl(this._self, this._then);

  final ExtendTokenResponse _self;
  final $Res Function(ExtendTokenResponse) _then;

  /// Create a copy of ExtendTokenResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? device = freezed,
  }) {
    return _then(_self.copyWith(
      device: freezed == device
          ? _self.device
          : device // ignore: cast_nullable_to_non_nullable
              as Device?,
    ));
  }

  /// Create a copy of ExtendTokenResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DeviceCopyWith<$Res>? get device {
    if (_self.device == null) {
      return null;
    }

    return $DeviceCopyWith<$Res>(_self.device!, (value) {
      return _then(_self.copyWith(device: value));
    });
  }
}

/// Adds pattern-matching-related methods to [ExtendTokenResponse].
extension ExtendTokenResponsePatterns on ExtendTokenResponse {
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
    TResult Function(_ExtendTokenResponse value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ExtendTokenResponse() when $default != null:
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
    TResult Function(_ExtendTokenResponse value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ExtendTokenResponse():
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
    TResult? Function(_ExtendTokenResponse value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ExtendTokenResponse() when $default != null:
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
    TResult Function(Device? device)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ExtendTokenResponse() when $default != null:
        return $default(_that.device);
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
    TResult Function(Device? device) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ExtendTokenResponse():
        return $default(_that.device);
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
    TResult? Function(Device? device)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ExtendTokenResponse() when $default != null:
        return $default(_that.device);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ExtendTokenResponse extends ExtendTokenResponse {
  _ExtendTokenResponse({this.device}) : super._();
  factory _ExtendTokenResponse.fromJson(Map<String, dynamic> json) =>
      _$ExtendTokenResponseFromJson(json);

  @override
  final Device? device;

  /// Create a copy of ExtendTokenResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ExtendTokenResponseCopyWith<_ExtendTokenResponse> get copyWith =>
      __$ExtendTokenResponseCopyWithImpl<_ExtendTokenResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ExtendTokenResponseToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ExtendTokenResponse &&
            (identical(other.device, device) || other.device == device));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, device);

  @override
  String toString() {
    return 'ExtendTokenResponse(device: $device)';
  }
}

/// @nodoc
abstract mixin class _$ExtendTokenResponseCopyWith<$Res>
    implements $ExtendTokenResponseCopyWith<$Res> {
  factory _$ExtendTokenResponseCopyWith(_ExtendTokenResponse value,
          $Res Function(_ExtendTokenResponse) _then) =
      __$ExtendTokenResponseCopyWithImpl;
  @override
  @useResult
  $Res call({Device? device});

  @override
  $DeviceCopyWith<$Res>? get device;
}

/// @nodoc
class __$ExtendTokenResponseCopyWithImpl<$Res>
    implements _$ExtendTokenResponseCopyWith<$Res> {
  __$ExtendTokenResponseCopyWithImpl(this._self, this._then);

  final _ExtendTokenResponse _self;
  final $Res Function(_ExtendTokenResponse) _then;

  /// Create a copy of ExtendTokenResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? device = freezed,
  }) {
    return _then(_ExtendTokenResponse(
      device: freezed == device
          ? _self.device
          : device // ignore: cast_nullable_to_non_nullable
              as Device?,
    ));
  }

  /// Create a copy of ExtendTokenResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DeviceCopyWith<$Res>? get device {
    if (_self.device == null) {
      return null;
    }

    return $DeviceCopyWith<$Res>(_self.device!, (value) {
      return _then(_self.copyWith(device: value));
    });
  }
}

// dart format on
