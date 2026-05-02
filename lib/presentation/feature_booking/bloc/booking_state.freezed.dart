// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'booking_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BookingState {
  bool get isLoadingSlots;
  bool get isBooking;
  bool get bookingSuccess;
  List<BookingSlot> get slots;
  String? get selectedDate;
  String? get selectedSlotId;
  String? get errorMessage;

  /// Create a copy of BookingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BookingStateCopyWith<BookingState> get copyWith =>
      _$BookingStateCopyWithImpl<BookingState>(
          this as BookingState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BookingState &&
            (identical(other.isLoadingSlots, isLoadingSlots) ||
                other.isLoadingSlots == isLoadingSlots) &&
            (identical(other.isBooking, isBooking) ||
                other.isBooking == isBooking) &&
            (identical(other.bookingSuccess, bookingSuccess) ||
                other.bookingSuccess == bookingSuccess) &&
            const DeepCollectionEquality().equals(other.slots, slots) &&
            (identical(other.selectedDate, selectedDate) ||
                other.selectedDate == selectedDate) &&
            (identical(other.selectedSlotId, selectedSlotId) ||
                other.selectedSlotId == selectedSlotId) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoadingSlots,
      isBooking,
      bookingSuccess,
      const DeepCollectionEquality().hash(slots),
      selectedDate,
      selectedSlotId,
      errorMessage);

  @override
  String toString() {
    return 'BookingState(isLoadingSlots: $isLoadingSlots, isBooking: $isBooking, bookingSuccess: $bookingSuccess, slots: $slots, selectedDate: $selectedDate, selectedSlotId: $selectedSlotId, errorMessage: $errorMessage)';
  }
}

/// @nodoc
abstract mixin class $BookingStateCopyWith<$Res> {
  factory $BookingStateCopyWith(
          BookingState value, $Res Function(BookingState) _then) =
      _$BookingStateCopyWithImpl;
  @useResult
  $Res call(
      {bool isLoadingSlots,
      bool isBooking,
      bool bookingSuccess,
      List<BookingSlot> slots,
      String? selectedDate,
      String? selectedSlotId,
      String? errorMessage});
}

/// @nodoc
class _$BookingStateCopyWithImpl<$Res> implements $BookingStateCopyWith<$Res> {
  _$BookingStateCopyWithImpl(this._self, this._then);

  final BookingState _self;
  final $Res Function(BookingState) _then;

  /// Create a copy of BookingState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoadingSlots = null,
    Object? isBooking = null,
    Object? bookingSuccess = null,
    Object? slots = null,
    Object? selectedDate = freezed,
    Object? selectedSlotId = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_self.copyWith(
      isLoadingSlots: null == isLoadingSlots
          ? _self.isLoadingSlots
          : isLoadingSlots // ignore: cast_nullable_to_non_nullable
              as bool,
      isBooking: null == isBooking
          ? _self.isBooking
          : isBooking // ignore: cast_nullable_to_non_nullable
              as bool,
      bookingSuccess: null == bookingSuccess
          ? _self.bookingSuccess
          : bookingSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      slots: null == slots
          ? _self.slots
          : slots // ignore: cast_nullable_to_non_nullable
              as List<BookingSlot>,
      selectedDate: freezed == selectedDate
          ? _self.selectedDate
          : selectedDate // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedSlotId: freezed == selectedSlotId
          ? _self.selectedSlotId
          : selectedSlotId // ignore: cast_nullable_to_non_nullable
              as String?,
      errorMessage: freezed == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [BookingState].
extension BookingStatePatterns on BookingState {
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
    TResult Function(_BookingState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _BookingState() when $default != null:
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
    TResult Function(_BookingState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BookingState():
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
    TResult? Function(_BookingState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BookingState() when $default != null:
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
            bool isLoadingSlots,
            bool isBooking,
            bool bookingSuccess,
            List<BookingSlot> slots,
            String? selectedDate,
            String? selectedSlotId,
            String? errorMessage)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _BookingState() when $default != null:
        return $default(
            _that.isLoadingSlots,
            _that.isBooking,
            _that.bookingSuccess,
            _that.slots,
            _that.selectedDate,
            _that.selectedSlotId,
            _that.errorMessage);
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
            bool isLoadingSlots,
            bool isBooking,
            bool bookingSuccess,
            List<BookingSlot> slots,
            String? selectedDate,
            String? selectedSlotId,
            String? errorMessage)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BookingState():
        return $default(
            _that.isLoadingSlots,
            _that.isBooking,
            _that.bookingSuccess,
            _that.slots,
            _that.selectedDate,
            _that.selectedSlotId,
            _that.errorMessage);
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
            bool isLoadingSlots,
            bool isBooking,
            bool bookingSuccess,
            List<BookingSlot> slots,
            String? selectedDate,
            String? selectedSlotId,
            String? errorMessage)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BookingState() when $default != null:
        return $default(
            _that.isLoadingSlots,
            _that.isBooking,
            _that.bookingSuccess,
            _that.slots,
            _that.selectedDate,
            _that.selectedSlotId,
            _that.errorMessage);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _BookingState implements BookingState {
  const _BookingState(
      {this.isLoadingSlots = false,
      this.isBooking = false,
      this.bookingSuccess = false,
      final List<BookingSlot> slots = const [],
      this.selectedDate,
      this.selectedSlotId,
      this.errorMessage})
      : _slots = slots;

  @override
  @JsonKey()
  final bool isLoadingSlots;
  @override
  @JsonKey()
  final bool isBooking;
  @override
  @JsonKey()
  final bool bookingSuccess;
  final List<BookingSlot> _slots;
  @override
  @JsonKey()
  List<BookingSlot> get slots {
    if (_slots is EqualUnmodifiableListView) return _slots;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_slots);
  }

  @override
  final String? selectedDate;
  @override
  final String? selectedSlotId;
  @override
  final String? errorMessage;

  /// Create a copy of BookingState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BookingStateCopyWith<_BookingState> get copyWith =>
      __$BookingStateCopyWithImpl<_BookingState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BookingState &&
            (identical(other.isLoadingSlots, isLoadingSlots) ||
                other.isLoadingSlots == isLoadingSlots) &&
            (identical(other.isBooking, isBooking) ||
                other.isBooking == isBooking) &&
            (identical(other.bookingSuccess, bookingSuccess) ||
                other.bookingSuccess == bookingSuccess) &&
            const DeepCollectionEquality().equals(other._slots, _slots) &&
            (identical(other.selectedDate, selectedDate) ||
                other.selectedDate == selectedDate) &&
            (identical(other.selectedSlotId, selectedSlotId) ||
                other.selectedSlotId == selectedSlotId) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoadingSlots,
      isBooking,
      bookingSuccess,
      const DeepCollectionEquality().hash(_slots),
      selectedDate,
      selectedSlotId,
      errorMessage);

  @override
  String toString() {
    return 'BookingState(isLoadingSlots: $isLoadingSlots, isBooking: $isBooking, bookingSuccess: $bookingSuccess, slots: $slots, selectedDate: $selectedDate, selectedSlotId: $selectedSlotId, errorMessage: $errorMessage)';
  }
}

/// @nodoc
abstract mixin class _$BookingStateCopyWith<$Res>
    implements $BookingStateCopyWith<$Res> {
  factory _$BookingStateCopyWith(
          _BookingState value, $Res Function(_BookingState) _then) =
      __$BookingStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {bool isLoadingSlots,
      bool isBooking,
      bool bookingSuccess,
      List<BookingSlot> slots,
      String? selectedDate,
      String? selectedSlotId,
      String? errorMessage});
}

/// @nodoc
class __$BookingStateCopyWithImpl<$Res>
    implements _$BookingStateCopyWith<$Res> {
  __$BookingStateCopyWithImpl(this._self, this._then);

  final _BookingState _self;
  final $Res Function(_BookingState) _then;

  /// Create a copy of BookingState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? isLoadingSlots = null,
    Object? isBooking = null,
    Object? bookingSuccess = null,
    Object? slots = null,
    Object? selectedDate = freezed,
    Object? selectedSlotId = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_BookingState(
      isLoadingSlots: null == isLoadingSlots
          ? _self.isLoadingSlots
          : isLoadingSlots // ignore: cast_nullable_to_non_nullable
              as bool,
      isBooking: null == isBooking
          ? _self.isBooking
          : isBooking // ignore: cast_nullable_to_non_nullable
              as bool,
      bookingSuccess: null == bookingSuccess
          ? _self.bookingSuccess
          : bookingSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      slots: null == slots
          ? _self._slots
          : slots // ignore: cast_nullable_to_non_nullable
              as List<BookingSlot>,
      selectedDate: freezed == selectedDate
          ? _self.selectedDate
          : selectedDate // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedSlotId: freezed == selectedSlotId
          ? _self.selectedSlotId
          : selectedSlotId // ignore: cast_nullable_to_non_nullable
              as String?,
      errorMessage: freezed == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
