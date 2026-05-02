// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'doctors_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DoctorsState {
  bool get isLoading;
  List<DoctorListItem> get doctors;
  List<DoctorListItem> get filteredDoctors;
  String? get selectedSpecialty;
  String? get errorMessage;
  String get searchQuery;

  /// Create a copy of DoctorsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DoctorsStateCopyWith<DoctorsState> get copyWith =>
      _$DoctorsStateCopyWithImpl<DoctorsState>(
          this as DoctorsState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DoctorsState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality().equals(other.doctors, doctors) &&
            const DeepCollectionEquality()
                .equals(other.filteredDoctors, filteredDoctors) &&
            (identical(other.selectedSpecialty, selectedSpecialty) ||
                other.selectedSpecialty == selectedSpecialty) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.searchQuery, searchQuery) ||
                other.searchQuery == searchQuery));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      const DeepCollectionEquality().hash(doctors),
      const DeepCollectionEquality().hash(filteredDoctors),
      selectedSpecialty,
      errorMessage,
      searchQuery);

  @override
  String toString() {
    return 'DoctorsState(isLoading: $isLoading, doctors: $doctors, filteredDoctors: $filteredDoctors, selectedSpecialty: $selectedSpecialty, errorMessage: $errorMessage, searchQuery: $searchQuery)';
  }
}

/// @nodoc
abstract mixin class $DoctorsStateCopyWith<$Res> {
  factory $DoctorsStateCopyWith(
          DoctorsState value, $Res Function(DoctorsState) _then) =
      _$DoctorsStateCopyWithImpl;
  @useResult
  $Res call(
      {bool isLoading,
      List<DoctorListItem> doctors,
      List<DoctorListItem> filteredDoctors,
      String? selectedSpecialty,
      String? errorMessage,
      String searchQuery});
}

/// @nodoc
class _$DoctorsStateCopyWithImpl<$Res> implements $DoctorsStateCopyWith<$Res> {
  _$DoctorsStateCopyWithImpl(this._self, this._then);

  final DoctorsState _self;
  final $Res Function(DoctorsState) _then;

  /// Create a copy of DoctorsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? doctors = null,
    Object? filteredDoctors = null,
    Object? selectedSpecialty = freezed,
    Object? errorMessage = freezed,
    Object? searchQuery = null,
  }) {
    return _then(_self.copyWith(
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      doctors: null == doctors
          ? _self.doctors
          : doctors // ignore: cast_nullable_to_non_nullable
              as List<DoctorListItem>,
      filteredDoctors: null == filteredDoctors
          ? _self.filteredDoctors
          : filteredDoctors // ignore: cast_nullable_to_non_nullable
              as List<DoctorListItem>,
      selectedSpecialty: freezed == selectedSpecialty
          ? _self.selectedSpecialty
          : selectedSpecialty // ignore: cast_nullable_to_non_nullable
              as String?,
      errorMessage: freezed == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      searchQuery: null == searchQuery
          ? _self.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [DoctorsState].
extension DoctorsStatePatterns on DoctorsState {
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
    TResult Function(_DoctorsState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DoctorsState() when $default != null:
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
    TResult Function(_DoctorsState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DoctorsState():
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
    TResult? Function(_DoctorsState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DoctorsState() when $default != null:
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
            List<DoctorListItem> doctors,
            List<DoctorListItem> filteredDoctors,
            String? selectedSpecialty,
            String? errorMessage,
            String searchQuery)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DoctorsState() when $default != null:
        return $default(_that.isLoading, _that.doctors, _that.filteredDoctors,
            _that.selectedSpecialty, _that.errorMessage, _that.searchQuery);
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
            List<DoctorListItem> doctors,
            List<DoctorListItem> filteredDoctors,
            String? selectedSpecialty,
            String? errorMessage,
            String searchQuery)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DoctorsState():
        return $default(_that.isLoading, _that.doctors, _that.filteredDoctors,
            _that.selectedSpecialty, _that.errorMessage, _that.searchQuery);
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
            List<DoctorListItem> doctors,
            List<DoctorListItem> filteredDoctors,
            String? selectedSpecialty,
            String? errorMessage,
            String searchQuery)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DoctorsState() when $default != null:
        return $default(_that.isLoading, _that.doctors, _that.filteredDoctors,
            _that.selectedSpecialty, _that.errorMessage, _that.searchQuery);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _DoctorsState implements DoctorsState {
  const _DoctorsState(
      {this.isLoading = false,
      final List<DoctorListItem> doctors = const [],
      final List<DoctorListItem> filteredDoctors = const [],
      this.selectedSpecialty,
      this.errorMessage,
      this.searchQuery = ''})
      : _doctors = doctors,
        _filteredDoctors = filteredDoctors;

  @override
  @JsonKey()
  final bool isLoading;
  final List<DoctorListItem> _doctors;
  @override
  @JsonKey()
  List<DoctorListItem> get doctors {
    if (_doctors is EqualUnmodifiableListView) return _doctors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_doctors);
  }

  final List<DoctorListItem> _filteredDoctors;
  @override
  @JsonKey()
  List<DoctorListItem> get filteredDoctors {
    if (_filteredDoctors is EqualUnmodifiableListView) return _filteredDoctors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_filteredDoctors);
  }

  @override
  final String? selectedSpecialty;
  @override
  final String? errorMessage;
  @override
  @JsonKey()
  final String searchQuery;

  /// Create a copy of DoctorsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DoctorsStateCopyWith<_DoctorsState> get copyWith =>
      __$DoctorsStateCopyWithImpl<_DoctorsState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DoctorsState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality().equals(other._doctors, _doctors) &&
            const DeepCollectionEquality()
                .equals(other._filteredDoctors, _filteredDoctors) &&
            (identical(other.selectedSpecialty, selectedSpecialty) ||
                other.selectedSpecialty == selectedSpecialty) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.searchQuery, searchQuery) ||
                other.searchQuery == searchQuery));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      const DeepCollectionEquality().hash(_doctors),
      const DeepCollectionEquality().hash(_filteredDoctors),
      selectedSpecialty,
      errorMessage,
      searchQuery);

  @override
  String toString() {
    return 'DoctorsState(isLoading: $isLoading, doctors: $doctors, filteredDoctors: $filteredDoctors, selectedSpecialty: $selectedSpecialty, errorMessage: $errorMessage, searchQuery: $searchQuery)';
  }
}

/// @nodoc
abstract mixin class _$DoctorsStateCopyWith<$Res>
    implements $DoctorsStateCopyWith<$Res> {
  factory _$DoctorsStateCopyWith(
          _DoctorsState value, $Res Function(_DoctorsState) _then) =
      __$DoctorsStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      List<DoctorListItem> doctors,
      List<DoctorListItem> filteredDoctors,
      String? selectedSpecialty,
      String? errorMessage,
      String searchQuery});
}

/// @nodoc
class __$DoctorsStateCopyWithImpl<$Res>
    implements _$DoctorsStateCopyWith<$Res> {
  __$DoctorsStateCopyWithImpl(this._self, this._then);

  final _DoctorsState _self;
  final $Res Function(_DoctorsState) _then;

  /// Create a copy of DoctorsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? isLoading = null,
    Object? doctors = null,
    Object? filteredDoctors = null,
    Object? selectedSpecialty = freezed,
    Object? errorMessage = freezed,
    Object? searchQuery = null,
  }) {
    return _then(_DoctorsState(
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      doctors: null == doctors
          ? _self._doctors
          : doctors // ignore: cast_nullable_to_non_nullable
              as List<DoctorListItem>,
      filteredDoctors: null == filteredDoctors
          ? _self._filteredDoctors
          : filteredDoctors // ignore: cast_nullable_to_non_nullable
              as List<DoctorListItem>,
      selectedSpecialty: freezed == selectedSpecialty
          ? _self.selectedSpecialty
          : selectedSpecialty // ignore: cast_nullable_to_non_nullable
              as String?,
      errorMessage: freezed == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      searchQuery: null == searchQuery
          ? _self.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
