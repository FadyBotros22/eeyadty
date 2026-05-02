// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'failure_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FailureEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is FailureEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FailureEvent()';
  }
}

/// @nodoc
class $FailureEventCopyWith<$Res> {
  $FailureEventCopyWith(FailureEvent _, $Res Function(FailureEvent) __);
}

/// Adds pattern-matching-related methods to [FailureEvent].
extension FailureEventPatterns on FailureEvent {
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
    TResult Function(ShowFailure value)? showFailure,
    TResult Function(FailureShown value)? failureShown,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case ShowFailure() when showFailure != null:
        return showFailure(_that);
      case FailureShown() when failureShown != null:
        return failureShown(_that);
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
    required TResult Function(ShowFailure value) showFailure,
    required TResult Function(FailureShown value) failureShown,
  }) {
    final _that = this;
    switch (_that) {
      case ShowFailure():
        return showFailure(_that);
      case FailureShown():
        return failureShown(_that);
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
    TResult? Function(ShowFailure value)? showFailure,
    TResult? Function(FailureShown value)? failureShown,
  }) {
    final _that = this;
    switch (_that) {
      case ShowFailure() when showFailure != null:
        return showFailure(_that);
      case FailureShown() when failureShown != null:
        return failureShown(_that);
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
    TResult Function(Failure failure)? showFailure,
    TResult Function()? failureShown,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case ShowFailure() when showFailure != null:
        return showFailure(_that.failure);
      case FailureShown() when failureShown != null:
        return failureShown();
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
    required TResult Function(Failure failure) showFailure,
    required TResult Function() failureShown,
  }) {
    final _that = this;
    switch (_that) {
      case ShowFailure():
        return showFailure(_that.failure);
      case FailureShown():
        return failureShown();
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
    TResult? Function(Failure failure)? showFailure,
    TResult? Function()? failureShown,
  }) {
    final _that = this;
    switch (_that) {
      case ShowFailure() when showFailure != null:
        return showFailure(_that.failure);
      case FailureShown() when failureShown != null:
        return failureShown();
      case _:
        return null;
    }
  }
}

/// @nodoc

class ShowFailure implements FailureEvent {
  const ShowFailure(this.failure);

  final Failure failure;

  /// Create a copy of FailureEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ShowFailureCopyWith<ShowFailure> get copyWith =>
      _$ShowFailureCopyWithImpl<ShowFailure>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ShowFailure &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, failure);

  @override
  String toString() {
    return 'FailureEvent.showFailure(failure: $failure)';
  }
}

/// @nodoc
abstract mixin class $ShowFailureCopyWith<$Res>
    implements $FailureEventCopyWith<$Res> {
  factory $ShowFailureCopyWith(
          ShowFailure value, $Res Function(ShowFailure) _then) =
      _$ShowFailureCopyWithImpl;
  @useResult
  $Res call({Failure failure});
}

/// @nodoc
class _$ShowFailureCopyWithImpl<$Res> implements $ShowFailureCopyWith<$Res> {
  _$ShowFailureCopyWithImpl(this._self, this._then);

  final ShowFailure _self;
  final $Res Function(ShowFailure) _then;

  /// Create a copy of FailureEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? failure = null,
  }) {
    return _then(ShowFailure(
      null == failure
          ? _self.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure,
    ));
  }
}

/// @nodoc

class FailureShown implements FailureEvent {
  const FailureShown();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is FailureShown);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FailureEvent.failureShown()';
  }
}

/// @nodoc
mixin _$FailureState {
  Failure? get failure;

  /// Create a copy of FailureState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FailureStateCopyWith<FailureState> get copyWith =>
      _$FailureStateCopyWithImpl<FailureState>(
          this as FailureState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FailureState &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, failure);

  @override
  String toString() {
    return 'FailureState(failure: $failure)';
  }
}

/// @nodoc
abstract mixin class $FailureStateCopyWith<$Res> {
  factory $FailureStateCopyWith(
          FailureState value, $Res Function(FailureState) _then) =
      _$FailureStateCopyWithImpl;
  @useResult
  $Res call({Failure? failure});
}

/// @nodoc
class _$FailureStateCopyWithImpl<$Res> implements $FailureStateCopyWith<$Res> {
  _$FailureStateCopyWithImpl(this._self, this._then);

  final FailureState _self;
  final $Res Function(FailureState) _then;

  /// Create a copy of FailureState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failure = freezed,
  }) {
    return _then(_self.copyWith(
      failure: freezed == failure
          ? _self.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure?,
    ));
  }
}

/// Adds pattern-matching-related methods to [FailureState].
extension FailureStatePatterns on FailureState {
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
    TResult Function(_FailureState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FailureState() when $default != null:
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
    TResult Function(_FailureState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FailureState():
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
    TResult? Function(_FailureState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FailureState() when $default != null:
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
    TResult Function(Failure? failure)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FailureState() when $default != null:
        return $default(_that.failure);
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
    TResult Function(Failure? failure) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FailureState():
        return $default(_that.failure);
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
    TResult? Function(Failure? failure)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FailureState() when $default != null:
        return $default(_that.failure);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _FailureState extends FailureState {
  _FailureState({this.failure}) : super._();

  @override
  final Failure? failure;

  /// Create a copy of FailureState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FailureStateCopyWith<_FailureState> get copyWith =>
      __$FailureStateCopyWithImpl<_FailureState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FailureState &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, failure);

  @override
  String toString() {
    return 'FailureState(failure: $failure)';
  }
}

/// @nodoc
abstract mixin class _$FailureStateCopyWith<$Res>
    implements $FailureStateCopyWith<$Res> {
  factory _$FailureStateCopyWith(
          _FailureState value, $Res Function(_FailureState) _then) =
      __$FailureStateCopyWithImpl;
  @override
  @useResult
  $Res call({Failure? failure});
}

/// @nodoc
class __$FailureStateCopyWithImpl<$Res>
    implements _$FailureStateCopyWith<$Res> {
  __$FailureStateCopyWithImpl(this._self, this._then);

  final _FailureState _self;
  final $Res Function(_FailureState) _then;

  /// Create a copy of FailureState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? failure = freezed,
  }) {
    return _then(_FailureState(
      failure: freezed == failure
          ? _self.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure?,
    ));
  }
}

// dart format on
