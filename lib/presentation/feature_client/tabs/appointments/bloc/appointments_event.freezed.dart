// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'appointments_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AppointmentsEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is AppointmentsEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AppointmentsEvent()';
  }
}

/// @nodoc
class $AppointmentsEventCopyWith<$Res> {
  $AppointmentsEventCopyWith(
      AppointmentsEvent _, $Res Function(AppointmentsEvent) __);
}

/// Adds pattern-matching-related methods to [AppointmentsEvent].
extension AppointmentsEventPatterns on AppointmentsEvent {
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
    TResult Function(LoadAppointments value)? load,
    TResult Function(CancelAppointment value)? cancel,
    TResult Function(BookAppointment value)? book,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case LoadAppointments() when load != null:
        return load(_that);
      case CancelAppointment() when cancel != null:
        return cancel(_that);
      case BookAppointment() when book != null:
        return book(_that);
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
    required TResult Function(LoadAppointments value) load,
    required TResult Function(CancelAppointment value) cancel,
    required TResult Function(BookAppointment value) book,
  }) {
    final _that = this;
    switch (_that) {
      case LoadAppointments():
        return load(_that);
      case CancelAppointment():
        return cancel(_that);
      case BookAppointment():
        return book(_that);
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
    TResult? Function(LoadAppointments value)? load,
    TResult? Function(CancelAppointment value)? cancel,
    TResult? Function(BookAppointment value)? book,
  }) {
    final _that = this;
    switch (_that) {
      case LoadAppointments() when load != null:
        return load(_that);
      case CancelAppointment() when cancel != null:
        return cancel(_that);
      case BookAppointment() when book != null:
        return book(_that);
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
    TResult Function(String clientId)? load,
    TResult Function(String appointmentId)? cancel,
    TResult Function(String clientId, String serviceId, String date,
            String time, String? notes)?
        book,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case LoadAppointments() when load != null:
        return load(_that.clientId);
      case CancelAppointment() when cancel != null:
        return cancel(_that.appointmentId);
      case BookAppointment() when book != null:
        return book(_that.clientId, _that.serviceId, _that.date, _that.time,
            _that.notes);
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
    required TResult Function(String clientId) load,
    required TResult Function(String appointmentId) cancel,
    required TResult Function(String clientId, String serviceId, String date,
            String time, String? notes)
        book,
  }) {
    final _that = this;
    switch (_that) {
      case LoadAppointments():
        return load(_that.clientId);
      case CancelAppointment():
        return cancel(_that.appointmentId);
      case BookAppointment():
        return book(_that.clientId, _that.serviceId, _that.date, _that.time,
            _that.notes);
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
    TResult? Function(String clientId)? load,
    TResult? Function(String appointmentId)? cancel,
    TResult? Function(String clientId, String serviceId, String date,
            String time, String? notes)?
        book,
  }) {
    final _that = this;
    switch (_that) {
      case LoadAppointments() when load != null:
        return load(_that.clientId);
      case CancelAppointment() when cancel != null:
        return cancel(_that.appointmentId);
      case BookAppointment() when book != null:
        return book(_that.clientId, _that.serviceId, _that.date, _that.time,
            _that.notes);
      case _:
        return null;
    }
  }
}

/// @nodoc

class LoadAppointments implements AppointmentsEvent {
  const LoadAppointments(this.clientId);

  final String clientId;

  /// Create a copy of AppointmentsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LoadAppointmentsCopyWith<LoadAppointments> get copyWith =>
      _$LoadAppointmentsCopyWithImpl<LoadAppointments>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LoadAppointments &&
            (identical(other.clientId, clientId) ||
                other.clientId == clientId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, clientId);

  @override
  String toString() {
    return 'AppointmentsEvent.load(clientId: $clientId)';
  }
}

/// @nodoc
abstract mixin class $LoadAppointmentsCopyWith<$Res>
    implements $AppointmentsEventCopyWith<$Res> {
  factory $LoadAppointmentsCopyWith(
          LoadAppointments value, $Res Function(LoadAppointments) _then) =
      _$LoadAppointmentsCopyWithImpl;
  @useResult
  $Res call({String clientId});
}

/// @nodoc
class _$LoadAppointmentsCopyWithImpl<$Res>
    implements $LoadAppointmentsCopyWith<$Res> {
  _$LoadAppointmentsCopyWithImpl(this._self, this._then);

  final LoadAppointments _self;
  final $Res Function(LoadAppointments) _then;

  /// Create a copy of AppointmentsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? clientId = null,
  }) {
    return _then(LoadAppointments(
      null == clientId
          ? _self.clientId
          : clientId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class CancelAppointment implements AppointmentsEvent {
  const CancelAppointment(this.appointmentId);

  final String appointmentId;

  /// Create a copy of AppointmentsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CancelAppointmentCopyWith<CancelAppointment> get copyWith =>
      _$CancelAppointmentCopyWithImpl<CancelAppointment>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CancelAppointment &&
            (identical(other.appointmentId, appointmentId) ||
                other.appointmentId == appointmentId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, appointmentId);

  @override
  String toString() {
    return 'AppointmentsEvent.cancel(appointmentId: $appointmentId)';
  }
}

/// @nodoc
abstract mixin class $CancelAppointmentCopyWith<$Res>
    implements $AppointmentsEventCopyWith<$Res> {
  factory $CancelAppointmentCopyWith(
          CancelAppointment value, $Res Function(CancelAppointment) _then) =
      _$CancelAppointmentCopyWithImpl;
  @useResult
  $Res call({String appointmentId});
}

/// @nodoc
class _$CancelAppointmentCopyWithImpl<$Res>
    implements $CancelAppointmentCopyWith<$Res> {
  _$CancelAppointmentCopyWithImpl(this._self, this._then);

  final CancelAppointment _self;
  final $Res Function(CancelAppointment) _then;

  /// Create a copy of AppointmentsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? appointmentId = null,
  }) {
    return _then(CancelAppointment(
      null == appointmentId
          ? _self.appointmentId
          : appointmentId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class BookAppointment implements AppointmentsEvent {
  const BookAppointment(
      {required this.clientId,
      required this.serviceId,
      required this.date,
      required this.time,
      this.notes});

  final String clientId;
  final String serviceId;
  final String date;
  final String time;
  final String? notes;

  /// Create a copy of AppointmentsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BookAppointmentCopyWith<BookAppointment> get copyWith =>
      _$BookAppointmentCopyWithImpl<BookAppointment>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BookAppointment &&
            (identical(other.clientId, clientId) ||
                other.clientId == clientId) &&
            (identical(other.serviceId, serviceId) ||
                other.serviceId == serviceId) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, clientId, serviceId, date, time, notes);

  @override
  String toString() {
    return 'AppointmentsEvent.book(clientId: $clientId, serviceId: $serviceId, date: $date, time: $time, notes: $notes)';
  }
}

/// @nodoc
abstract mixin class $BookAppointmentCopyWith<$Res>
    implements $AppointmentsEventCopyWith<$Res> {
  factory $BookAppointmentCopyWith(
          BookAppointment value, $Res Function(BookAppointment) _then) =
      _$BookAppointmentCopyWithImpl;
  @useResult
  $Res call(
      {String clientId,
      String serviceId,
      String date,
      String time,
      String? notes});
}

/// @nodoc
class _$BookAppointmentCopyWithImpl<$Res>
    implements $BookAppointmentCopyWith<$Res> {
  _$BookAppointmentCopyWithImpl(this._self, this._then);

  final BookAppointment _self;
  final $Res Function(BookAppointment) _then;

  /// Create a copy of AppointmentsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? clientId = null,
    Object? serviceId = null,
    Object? date = null,
    Object? time = null,
    Object? notes = freezed,
  }) {
    return _then(BookAppointment(
      clientId: null == clientId
          ? _self.clientId
          : clientId // ignore: cast_nullable_to_non_nullable
              as String,
      serviceId: null == serviceId
          ? _self.serviceId
          : serviceId // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      time: null == time
          ? _self.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
      notes: freezed == notes
          ? _self.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
