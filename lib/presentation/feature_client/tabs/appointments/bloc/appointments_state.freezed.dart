// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'appointments_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AppointmentsState {
  bool get isLoading;
  bool get isBooking;
  List<Appointment> get appointments;
  String? get errorMessage;
  bool get bookingSuccess;

  /// Create a copy of AppointmentsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AppointmentsStateCopyWith<AppointmentsState> get copyWith =>
      _$AppointmentsStateCopyWithImpl<AppointmentsState>(
          this as AppointmentsState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AppointmentsState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isBooking, isBooking) ||
                other.isBooking == isBooking) &&
            const DeepCollectionEquality()
                .equals(other.appointments, appointments) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.bookingSuccess, bookingSuccess) ||
                other.bookingSuccess == bookingSuccess));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      isBooking,
      const DeepCollectionEquality().hash(appointments),
      errorMessage,
      bookingSuccess);

  @override
  String toString() {
    return 'AppointmentsState(isLoading: $isLoading, isBooking: $isBooking, appointments: $appointments, errorMessage: $errorMessage, bookingSuccess: $bookingSuccess)';
  }
}

/// @nodoc
abstract mixin class $AppointmentsStateCopyWith<$Res> {
  factory $AppointmentsStateCopyWith(
          AppointmentsState value, $Res Function(AppointmentsState) _then) =
      _$AppointmentsStateCopyWithImpl;
  @useResult
  $Res call(
      {bool isLoading,
      bool isBooking,
      List<Appointment> appointments,
      String? errorMessage,
      bool bookingSuccess});
}

/// @nodoc
class _$AppointmentsStateCopyWithImpl<$Res>
    implements $AppointmentsStateCopyWith<$Res> {
  _$AppointmentsStateCopyWithImpl(this._self, this._then);

  final AppointmentsState _self;
  final $Res Function(AppointmentsState) _then;

  /// Create a copy of AppointmentsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isBooking = null,
    Object? appointments = null,
    Object? errorMessage = freezed,
    Object? bookingSuccess = null,
  }) {
    return _then(_self.copyWith(
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isBooking: null == isBooking
          ? _self.isBooking
          : isBooking // ignore: cast_nullable_to_non_nullable
              as bool,
      appointments: null == appointments
          ? _self.appointments
          : appointments // ignore: cast_nullable_to_non_nullable
              as List<Appointment>,
      errorMessage: freezed == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      bookingSuccess: null == bookingSuccess
          ? _self.bookingSuccess
          : bookingSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [AppointmentsState].
extension AppointmentsStatePatterns on AppointmentsState {
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
    TResult Function(_AppointmentsState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AppointmentsState() when $default != null:
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
    TResult Function(_AppointmentsState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AppointmentsState():
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
    TResult? Function(_AppointmentsState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AppointmentsState() when $default != null:
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
    TResult Function(
            bool isLoading,
            bool isBooking,
            List<Appointment> appointments,
            String? errorMessage,
            bool bookingSuccess)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AppointmentsState() when $default != null:
        return $default(_that.isLoading, _that.isBooking, _that.appointments,
            _that.errorMessage, _that.bookingSuccess);
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
    TResult Function(
            bool isLoading,
            bool isBooking,
            List<Appointment> appointments,
            String? errorMessage,
            bool bookingSuccess)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AppointmentsState():
        return $default(_that.isLoading, _that.isBooking, _that.appointments,
            _that.errorMessage, _that.bookingSuccess);
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
    TResult? Function(
            bool isLoading,
            bool isBooking,
            List<Appointment> appointments,
            String? errorMessage,
            bool bookingSuccess)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AppointmentsState() when $default != null:
        return $default(_that.isLoading, _that.isBooking, _that.appointments,
            _that.errorMessage, _that.bookingSuccess);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _AppointmentsState implements AppointmentsState {
  const _AppointmentsState(
      {this.isLoading = false,
      this.isBooking = false,
      final List<Appointment> appointments = const [],
      this.errorMessage,
      this.bookingSuccess = false})
      : _appointments = appointments;

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isBooking;
  final List<Appointment> _appointments;
  @override
  @JsonKey()
  List<Appointment> get appointments {
    if (_appointments is EqualUnmodifiableListView) return _appointments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_appointments);
  }

  @override
  final String? errorMessage;
  @override
  @JsonKey()
  final bool bookingSuccess;

  /// Create a copy of AppointmentsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AppointmentsStateCopyWith<_AppointmentsState> get copyWith =>
      __$AppointmentsStateCopyWithImpl<_AppointmentsState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AppointmentsState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isBooking, isBooking) ||
                other.isBooking == isBooking) &&
            const DeepCollectionEquality()
                .equals(other._appointments, _appointments) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.bookingSuccess, bookingSuccess) ||
                other.bookingSuccess == bookingSuccess));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      isBooking,
      const DeepCollectionEquality().hash(_appointments),
      errorMessage,
      bookingSuccess);

  @override
  String toString() {
    return 'AppointmentsState(isLoading: $isLoading, isBooking: $isBooking, appointments: $appointments, errorMessage: $errorMessage, bookingSuccess: $bookingSuccess)';
  }
}

/// @nodoc
abstract mixin class _$AppointmentsStateCopyWith<$Res>
    implements $AppointmentsStateCopyWith<$Res> {
  factory _$AppointmentsStateCopyWith(
          _AppointmentsState value, $Res Function(_AppointmentsState) _then) =
      __$AppointmentsStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool isBooking,
      List<Appointment> appointments,
      String? errorMessage,
      bool bookingSuccess});
}

/// @nodoc
class __$AppointmentsStateCopyWithImpl<$Res>
    implements _$AppointmentsStateCopyWith<$Res> {
  __$AppointmentsStateCopyWithImpl(this._self, this._then);

  final _AppointmentsState _self;
  final $Res Function(_AppointmentsState) _then;

  /// Create a copy of AppointmentsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? isLoading = null,
    Object? isBooking = null,
    Object? appointments = null,
    Object? errorMessage = freezed,
    Object? bookingSuccess = null,
  }) {
    return _then(_AppointmentsState(
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isBooking: null == isBooking
          ? _self.isBooking
          : isBooking // ignore: cast_nullable_to_non_nullable
              as bool,
      appointments: null == appointments
          ? _self._appointments
          : appointments // ignore: cast_nullable_to_non_nullable
              as List<Appointment>,
      errorMessage: freezed == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      bookingSuccess: null == bookingSuccess
          ? _self.bookingSuccess
          : bookingSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
