// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'appointment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Appointment {
  String? get id;
  String? get clientId;
  String? get doctorName;
  String? get doctorId;
  String? get specialty;
  String? get appointmentDate;
  String? get appointmentTime;
  AppointmentStatus? get status;
  String? get notes;
  String? get createdAt;

  /// Create a copy of Appointment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AppointmentCopyWith<Appointment> get copyWith =>
      _$AppointmentCopyWithImpl<Appointment>(this as Appointment, _$identity);

  /// Serializes this Appointment to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Appointment &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.clientId, clientId) ||
                other.clientId == clientId) &&
            (identical(other.doctorName, doctorName) ||
                other.doctorName == doctorName) &&
            (identical(other.doctorId, doctorId) ||
                other.doctorId == doctorId) &&
            (identical(other.specialty, specialty) ||
                other.specialty == specialty) &&
            (identical(other.appointmentDate, appointmentDate) ||
                other.appointmentDate == appointmentDate) &&
            (identical(other.appointmentTime, appointmentTime) ||
                other.appointmentTime == appointmentTime) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      clientId,
      doctorName,
      doctorId,
      specialty,
      appointmentDate,
      appointmentTime,
      status,
      notes,
      createdAt);

  @override
  String toString() {
    return 'Appointment(id: $id, clientId: $clientId, doctorName: $doctorName, doctorId: $doctorId, specialty: $specialty, appointmentDate: $appointmentDate, appointmentTime: $appointmentTime, status: $status, notes: $notes, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class $AppointmentCopyWith<$Res> {
  factory $AppointmentCopyWith(
          Appointment value, $Res Function(Appointment) _then) =
      _$AppointmentCopyWithImpl;
  @useResult
  $Res call(
      {String? id,
      String? clientId,
      String? doctorName,
      String? doctorId,
      String? specialty,
      String? appointmentDate,
      String? appointmentTime,
      AppointmentStatus? status,
      String? notes,
      String? createdAt});
}

/// @nodoc
class _$AppointmentCopyWithImpl<$Res> implements $AppointmentCopyWith<$Res> {
  _$AppointmentCopyWithImpl(this._self, this._then);

  final Appointment _self;
  final $Res Function(Appointment) _then;

  /// Create a copy of Appointment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? clientId = freezed,
    Object? doctorName = freezed,
    Object? doctorId = freezed,
    Object? specialty = freezed,
    Object? appointmentDate = freezed,
    Object? appointmentTime = freezed,
    Object? status = freezed,
    Object? notes = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      clientId: freezed == clientId
          ? _self.clientId
          : clientId // ignore: cast_nullable_to_non_nullable
              as String?,
      doctorName: freezed == doctorName
          ? _self.doctorName
          : doctorName // ignore: cast_nullable_to_non_nullable
              as String?,
      doctorId: freezed == doctorId
          ? _self.doctorId
          : doctorId // ignore: cast_nullable_to_non_nullable
              as String?,
      specialty: freezed == specialty
          ? _self.specialty
          : specialty // ignore: cast_nullable_to_non_nullable
              as String?,
      appointmentDate: freezed == appointmentDate
          ? _self.appointmentDate
          : appointmentDate // ignore: cast_nullable_to_non_nullable
              as String?,
      appointmentTime: freezed == appointmentTime
          ? _self.appointmentTime
          : appointmentTime // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as AppointmentStatus?,
      notes: freezed == notes
          ? _self.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [Appointment].
extension AppointmentPatterns on Appointment {
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
    TResult Function(_Appointment value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Appointment() when $default != null:
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
    TResult Function(_Appointment value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Appointment():
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
    TResult? Function(_Appointment value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Appointment() when $default != null:
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
            String? id,
            String? clientId,
            String? doctorName,
            String? doctorId,
            String? specialty,
            String? appointmentDate,
            String? appointmentTime,
            AppointmentStatus? status,
            String? notes,
            String? createdAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Appointment() when $default != null:
        return $default(
            _that.id,
            _that.clientId,
            _that.doctorName,
            _that.doctorId,
            _that.specialty,
            _that.appointmentDate,
            _that.appointmentTime,
            _that.status,
            _that.notes,
            _that.createdAt);
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
            String? id,
            String? clientId,
            String? doctorName,
            String? doctorId,
            String? specialty,
            String? appointmentDate,
            String? appointmentTime,
            AppointmentStatus? status,
            String? notes,
            String? createdAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Appointment():
        return $default(
            _that.id,
            _that.clientId,
            _that.doctorName,
            _that.doctorId,
            _that.specialty,
            _that.appointmentDate,
            _that.appointmentTime,
            _that.status,
            _that.notes,
            _that.createdAt);
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
            String? id,
            String? clientId,
            String? doctorName,
            String? doctorId,
            String? specialty,
            String? appointmentDate,
            String? appointmentTime,
            AppointmentStatus? status,
            String? notes,
            String? createdAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Appointment() when $default != null:
        return $default(
            _that.id,
            _that.clientId,
            _that.doctorName,
            _that.doctorId,
            _that.specialty,
            _that.appointmentDate,
            _that.appointmentTime,
            _that.status,
            _that.notes,
            _that.createdAt);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _Appointment implements Appointment {
  const _Appointment(
      {this.id,
      this.clientId,
      this.doctorName,
      this.doctorId,
      this.specialty,
      this.appointmentDate,
      this.appointmentTime,
      this.status,
      this.notes,
      this.createdAt});
  factory _Appointment.fromJson(Map<String, dynamic> json) =>
      _$AppointmentFromJson(json);

  @override
  final String? id;
  @override
  final String? clientId;
  @override
  final String? doctorName;
  @override
  final String? doctorId;
  @override
  final String? specialty;
  @override
  final String? appointmentDate;
  @override
  final String? appointmentTime;
  @override
  final AppointmentStatus? status;
  @override
  final String? notes;
  @override
  final String? createdAt;

  /// Create a copy of Appointment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AppointmentCopyWith<_Appointment> get copyWith =>
      __$AppointmentCopyWithImpl<_Appointment>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AppointmentToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Appointment &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.clientId, clientId) ||
                other.clientId == clientId) &&
            (identical(other.doctorName, doctorName) ||
                other.doctorName == doctorName) &&
            (identical(other.doctorId, doctorId) ||
                other.doctorId == doctorId) &&
            (identical(other.specialty, specialty) ||
                other.specialty == specialty) &&
            (identical(other.appointmentDate, appointmentDate) ||
                other.appointmentDate == appointmentDate) &&
            (identical(other.appointmentTime, appointmentTime) ||
                other.appointmentTime == appointmentTime) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      clientId,
      doctorName,
      doctorId,
      specialty,
      appointmentDate,
      appointmentTime,
      status,
      notes,
      createdAt);

  @override
  String toString() {
    return 'Appointment(id: $id, clientId: $clientId, doctorName: $doctorName, doctorId: $doctorId, specialty: $specialty, appointmentDate: $appointmentDate, appointmentTime: $appointmentTime, status: $status, notes: $notes, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class _$AppointmentCopyWith<$Res>
    implements $AppointmentCopyWith<$Res> {
  factory _$AppointmentCopyWith(
          _Appointment value, $Res Function(_Appointment) _then) =
      __$AppointmentCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? id,
      String? clientId,
      String? doctorName,
      String? doctorId,
      String? specialty,
      String? appointmentDate,
      String? appointmentTime,
      AppointmentStatus? status,
      String? notes,
      String? createdAt});
}

/// @nodoc
class __$AppointmentCopyWithImpl<$Res> implements _$AppointmentCopyWith<$Res> {
  __$AppointmentCopyWithImpl(this._self, this._then);

  final _Appointment _self;
  final $Res Function(_Appointment) _then;

  /// Create a copy of Appointment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? clientId = freezed,
    Object? doctorName = freezed,
    Object? doctorId = freezed,
    Object? specialty = freezed,
    Object? appointmentDate = freezed,
    Object? appointmentTime = freezed,
    Object? status = freezed,
    Object? notes = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_Appointment(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      clientId: freezed == clientId
          ? _self.clientId
          : clientId // ignore: cast_nullable_to_non_nullable
              as String?,
      doctorName: freezed == doctorName
          ? _self.doctorName
          : doctorName // ignore: cast_nullable_to_non_nullable
              as String?,
      doctorId: freezed == doctorId
          ? _self.doctorId
          : doctorId // ignore: cast_nullable_to_non_nullable
              as String?,
      specialty: freezed == specialty
          ? _self.specialty
          : specialty // ignore: cast_nullable_to_non_nullable
              as String?,
      appointmentDate: freezed == appointmentDate
          ? _self.appointmentDate
          : appointmentDate // ignore: cast_nullable_to_non_nullable
              as String?,
      appointmentTime: freezed == appointmentTime
          ? _self.appointmentTime
          : appointmentTime // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as AppointmentStatus?,
      notes: freezed == notes
          ? _self.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
