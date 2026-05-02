// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'booking_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BookingEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is BookingEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'BookingEvent()';
  }
}

/// @nodoc
class $BookingEventCopyWith<$Res> {
  $BookingEventCopyWith(BookingEvent _, $Res Function(BookingEvent) __);
}

/// Adds pattern-matching-related methods to [BookingEvent].
extension BookingEventPatterns on BookingEvent {
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
    TResult Function(LoadSlots value)? loadSlots,
    TResult Function(SelectDate value)? selectDate,
    TResult Function(SelectSlot value)? selectSlot,
    TResult Function(ConfirmBooking value)? confirm,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case LoadSlots() when loadSlots != null:
        return loadSlots(_that);
      case SelectDate() when selectDate != null:
        return selectDate(_that);
      case SelectSlot() when selectSlot != null:
        return selectSlot(_that);
      case ConfirmBooking() when confirm != null:
        return confirm(_that);
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
    required TResult Function(LoadSlots value) loadSlots,
    required TResult Function(SelectDate value) selectDate,
    required TResult Function(SelectSlot value) selectSlot,
    required TResult Function(ConfirmBooking value) confirm,
  }) {
    final _that = this;
    switch (_that) {
      case LoadSlots():
        return loadSlots(_that);
      case SelectDate():
        return selectDate(_that);
      case SelectSlot():
        return selectSlot(_that);
      case ConfirmBooking():
        return confirm(_that);
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
    TResult? Function(LoadSlots value)? loadSlots,
    TResult? Function(SelectDate value)? selectDate,
    TResult? Function(SelectSlot value)? selectSlot,
    TResult? Function(ConfirmBooking value)? confirm,
  }) {
    final _that = this;
    switch (_that) {
      case LoadSlots() when loadSlots != null:
        return loadSlots(_that);
      case SelectDate() when selectDate != null:
        return selectDate(_that);
      case SelectSlot() when selectSlot != null:
        return selectSlot(_that);
      case ConfirmBooking() when confirm != null:
        return confirm(_that);
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
    TResult Function(String doctorId, String date)? loadSlots,
    TResult Function(String date)? selectDate,
    TResult Function(String slotId)? selectSlot,
    TResult Function(String clientId, String doctorId, String slotId,
            String date, String time, String? notes)?
        confirm,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case LoadSlots() when loadSlots != null:
        return loadSlots(_that.doctorId, _that.date);
      case SelectDate() when selectDate != null:
        return selectDate(_that.date);
      case SelectSlot() when selectSlot != null:
        return selectSlot(_that.slotId);
      case ConfirmBooking() when confirm != null:
        return confirm(_that.clientId, _that.doctorId, _that.slotId, _that.date,
            _that.time, _that.notes);
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
    required TResult Function(String doctorId, String date) loadSlots,
    required TResult Function(String date) selectDate,
    required TResult Function(String slotId) selectSlot,
    required TResult Function(String clientId, String doctorId, String slotId,
            String date, String time, String? notes)
        confirm,
  }) {
    final _that = this;
    switch (_that) {
      case LoadSlots():
        return loadSlots(_that.doctorId, _that.date);
      case SelectDate():
        return selectDate(_that.date);
      case SelectSlot():
        return selectSlot(_that.slotId);
      case ConfirmBooking():
        return confirm(_that.clientId, _that.doctorId, _that.slotId, _that.date,
            _that.time, _that.notes);
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
    TResult? Function(String doctorId, String date)? loadSlots,
    TResult? Function(String date)? selectDate,
    TResult? Function(String slotId)? selectSlot,
    TResult? Function(String clientId, String doctorId, String slotId,
            String date, String time, String? notes)?
        confirm,
  }) {
    final _that = this;
    switch (_that) {
      case LoadSlots() when loadSlots != null:
        return loadSlots(_that.doctorId, _that.date);
      case SelectDate() when selectDate != null:
        return selectDate(_that.date);
      case SelectSlot() when selectSlot != null:
        return selectSlot(_that.slotId);
      case ConfirmBooking() when confirm != null:
        return confirm(_that.clientId, _that.doctorId, _that.slotId, _that.date,
            _that.time, _that.notes);
      case _:
        return null;
    }
  }
}

/// @nodoc

class LoadSlots extends BookingEvent {
  const LoadSlots({required this.doctorId, required this.date}) : super._();

  final String doctorId;
  final String date;

  /// Create a copy of BookingEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LoadSlotsCopyWith<LoadSlots> get copyWith =>
      _$LoadSlotsCopyWithImpl<LoadSlots>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LoadSlots &&
            (identical(other.doctorId, doctorId) ||
                other.doctorId == doctorId) &&
            (identical(other.date, date) || other.date == date));
  }

  @override
  int get hashCode => Object.hash(runtimeType, doctorId, date);

  @override
  String toString() {
    return 'BookingEvent.loadSlots(doctorId: $doctorId, date: $date)';
  }
}

/// @nodoc
abstract mixin class $LoadSlotsCopyWith<$Res>
    implements $BookingEventCopyWith<$Res> {
  factory $LoadSlotsCopyWith(LoadSlots value, $Res Function(LoadSlots) _then) =
      _$LoadSlotsCopyWithImpl;
  @useResult
  $Res call({String doctorId, String date});
}

/// @nodoc
class _$LoadSlotsCopyWithImpl<$Res> implements $LoadSlotsCopyWith<$Res> {
  _$LoadSlotsCopyWithImpl(this._self, this._then);

  final LoadSlots _self;
  final $Res Function(LoadSlots) _then;

  /// Create a copy of BookingEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? doctorId = null,
    Object? date = null,
  }) {
    return _then(LoadSlots(
      doctorId: null == doctorId
          ? _self.doctorId
          : doctorId // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class SelectDate extends BookingEvent {
  const SelectDate(this.date) : super._();

  final String date;

  /// Create a copy of BookingEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SelectDateCopyWith<SelectDate> get copyWith =>
      _$SelectDateCopyWithImpl<SelectDate>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SelectDate &&
            (identical(other.date, date) || other.date == date));
  }

  @override
  int get hashCode => Object.hash(runtimeType, date);

  @override
  String toString() {
    return 'BookingEvent.selectDate(date: $date)';
  }
}

/// @nodoc
abstract mixin class $SelectDateCopyWith<$Res>
    implements $BookingEventCopyWith<$Res> {
  factory $SelectDateCopyWith(
          SelectDate value, $Res Function(SelectDate) _then) =
      _$SelectDateCopyWithImpl;
  @useResult
  $Res call({String date});
}

/// @nodoc
class _$SelectDateCopyWithImpl<$Res> implements $SelectDateCopyWith<$Res> {
  _$SelectDateCopyWithImpl(this._self, this._then);

  final SelectDate _self;
  final $Res Function(SelectDate) _then;

  /// Create a copy of BookingEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? date = null,
  }) {
    return _then(SelectDate(
      null == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class SelectSlot extends BookingEvent {
  const SelectSlot(this.slotId) : super._();

  final String slotId;

  /// Create a copy of BookingEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SelectSlotCopyWith<SelectSlot> get copyWith =>
      _$SelectSlotCopyWithImpl<SelectSlot>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SelectSlot &&
            (identical(other.slotId, slotId) || other.slotId == slotId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, slotId);

  @override
  String toString() {
    return 'BookingEvent.selectSlot(slotId: $slotId)';
  }
}

/// @nodoc
abstract mixin class $SelectSlotCopyWith<$Res>
    implements $BookingEventCopyWith<$Res> {
  factory $SelectSlotCopyWith(
          SelectSlot value, $Res Function(SelectSlot) _then) =
      _$SelectSlotCopyWithImpl;
  @useResult
  $Res call({String slotId});
}

/// @nodoc
class _$SelectSlotCopyWithImpl<$Res> implements $SelectSlotCopyWith<$Res> {
  _$SelectSlotCopyWithImpl(this._self, this._then);

  final SelectSlot _self;
  final $Res Function(SelectSlot) _then;

  /// Create a copy of BookingEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? slotId = null,
  }) {
    return _then(SelectSlot(
      null == slotId
          ? _self.slotId
          : slotId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class ConfirmBooking extends BookingEvent {
  const ConfirmBooking(
      {required this.clientId,
      required this.doctorId,
      required this.slotId,
      required this.date,
      required this.time,
      this.notes})
      : super._();

  final String clientId;
  final String doctorId;
  final String slotId;
  final String date;
  final String time;
  final String? notes;

  /// Create a copy of BookingEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ConfirmBookingCopyWith<ConfirmBooking> get copyWith =>
      _$ConfirmBookingCopyWithImpl<ConfirmBooking>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ConfirmBooking &&
            (identical(other.clientId, clientId) ||
                other.clientId == clientId) &&
            (identical(other.doctorId, doctorId) ||
                other.doctorId == doctorId) &&
            (identical(other.slotId, slotId) || other.slotId == slotId) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, clientId, doctorId, slotId, date, time, notes);

  @override
  String toString() {
    return 'BookingEvent.confirm(clientId: $clientId, doctorId: $doctorId, slotId: $slotId, date: $date, time: $time, notes: $notes)';
  }
}

/// @nodoc
abstract mixin class $ConfirmBookingCopyWith<$Res>
    implements $BookingEventCopyWith<$Res> {
  factory $ConfirmBookingCopyWith(
          ConfirmBooking value, $Res Function(ConfirmBooking) _then) =
      _$ConfirmBookingCopyWithImpl;
  @useResult
  $Res call(
      {String clientId,
      String doctorId,
      String slotId,
      String date,
      String time,
      String? notes});
}

/// @nodoc
class _$ConfirmBookingCopyWithImpl<$Res>
    implements $ConfirmBookingCopyWith<$Res> {
  _$ConfirmBookingCopyWithImpl(this._self, this._then);

  final ConfirmBooking _self;
  final $Res Function(ConfirmBooking) _then;

  /// Create a copy of BookingEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? clientId = null,
    Object? doctorId = null,
    Object? slotId = null,
    Object? date = null,
    Object? time = null,
    Object? notes = freezed,
  }) {
    return _then(ConfirmBooking(
      clientId: null == clientId
          ? _self.clientId
          : clientId // ignore: cast_nullable_to_non_nullable
              as String,
      doctorId: null == doctorId
          ? _self.doctorId
          : doctorId // ignore: cast_nullable_to_non_nullable
              as String,
      slotId: null == slotId
          ? _self.slotId
          : slotId // ignore: cast_nullable_to_non_nullable
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
