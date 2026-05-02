// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'doctors_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DoctorsEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is DoctorsEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'DoctorsEvent()';
  }
}

/// @nodoc
class $DoctorsEventCopyWith<$Res> {
  $DoctorsEventCopyWith(DoctorsEvent _, $Res Function(DoctorsEvent) __);
}

/// Adds pattern-matching-related methods to [DoctorsEvent].
extension DoctorsEventPatterns on DoctorsEvent {
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
    TResult Function(LoadDoctors value)? load,
    TResult Function(SearchDoctors value)? search,
    TResult Function(SelectSpecialty value)? selectSpecialty,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case LoadDoctors() when load != null:
        return load(_that);
      case SearchDoctors() when search != null:
        return search(_that);
      case SelectSpecialty() when selectSpecialty != null:
        return selectSpecialty(_that);
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
    required TResult Function(LoadDoctors value) load,
    required TResult Function(SearchDoctors value) search,
    required TResult Function(SelectSpecialty value) selectSpecialty,
  }) {
    final _that = this;
    switch (_that) {
      case LoadDoctors():
        return load(_that);
      case SearchDoctors():
        return search(_that);
      case SelectSpecialty():
        return selectSpecialty(_that);
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
    TResult? Function(LoadDoctors value)? load,
    TResult? Function(SearchDoctors value)? search,
    TResult? Function(SelectSpecialty value)? selectSpecialty,
  }) {
    final _that = this;
    switch (_that) {
      case LoadDoctors() when load != null:
        return load(_that);
      case SearchDoctors() when search != null:
        return search(_that);
      case SelectSpecialty() when selectSpecialty != null:
        return selectSpecialty(_that);
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
    TResult Function(String? specialty)? load,
    TResult Function(String query)? search,
    TResult Function(String? specialty)? selectSpecialty,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case LoadDoctors() when load != null:
        return load(_that.specialty);
      case SearchDoctors() when search != null:
        return search(_that.query);
      case SelectSpecialty() when selectSpecialty != null:
        return selectSpecialty(_that.specialty);
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
    required TResult Function(String? specialty) load,
    required TResult Function(String query) search,
    required TResult Function(String? specialty) selectSpecialty,
  }) {
    final _that = this;
    switch (_that) {
      case LoadDoctors():
        return load(_that.specialty);
      case SearchDoctors():
        return search(_that.query);
      case SelectSpecialty():
        return selectSpecialty(_that.specialty);
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
    TResult? Function(String? specialty)? load,
    TResult? Function(String query)? search,
    TResult? Function(String? specialty)? selectSpecialty,
  }) {
    final _that = this;
    switch (_that) {
      case LoadDoctors() when load != null:
        return load(_that.specialty);
      case SearchDoctors() when search != null:
        return search(_that.query);
      case SelectSpecialty() when selectSpecialty != null:
        return selectSpecialty(_that.specialty);
      case _:
        return null;
    }
  }
}

/// @nodoc

class LoadDoctors implements DoctorsEvent {
  const LoadDoctors({this.specialty});

  final String? specialty;

  /// Create a copy of DoctorsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LoadDoctorsCopyWith<LoadDoctors> get copyWith =>
      _$LoadDoctorsCopyWithImpl<LoadDoctors>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LoadDoctors &&
            (identical(other.specialty, specialty) ||
                other.specialty == specialty));
  }

  @override
  int get hashCode => Object.hash(runtimeType, specialty);

  @override
  String toString() {
    return 'DoctorsEvent.load(specialty: $specialty)';
  }
}

/// @nodoc
abstract mixin class $LoadDoctorsCopyWith<$Res>
    implements $DoctorsEventCopyWith<$Res> {
  factory $LoadDoctorsCopyWith(
          LoadDoctors value, $Res Function(LoadDoctors) _then) =
      _$LoadDoctorsCopyWithImpl;
  @useResult
  $Res call({String? specialty});
}

/// @nodoc
class _$LoadDoctorsCopyWithImpl<$Res> implements $LoadDoctorsCopyWith<$Res> {
  _$LoadDoctorsCopyWithImpl(this._self, this._then);

  final LoadDoctors _self;
  final $Res Function(LoadDoctors) _then;

  /// Create a copy of DoctorsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? specialty = freezed,
  }) {
    return _then(LoadDoctors(
      specialty: freezed == specialty
          ? _self.specialty
          : specialty // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class SearchDoctors implements DoctorsEvent {
  const SearchDoctors(this.query);

  final String query;

  /// Create a copy of DoctorsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SearchDoctorsCopyWith<SearchDoctors> get copyWith =>
      _$SearchDoctorsCopyWithImpl<SearchDoctors>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SearchDoctors &&
            (identical(other.query, query) || other.query == query));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query);

  @override
  String toString() {
    return 'DoctorsEvent.search(query: $query)';
  }
}

/// @nodoc
abstract mixin class $SearchDoctorsCopyWith<$Res>
    implements $DoctorsEventCopyWith<$Res> {
  factory $SearchDoctorsCopyWith(
          SearchDoctors value, $Res Function(SearchDoctors) _then) =
      _$SearchDoctorsCopyWithImpl;
  @useResult
  $Res call({String query});
}

/// @nodoc
class _$SearchDoctorsCopyWithImpl<$Res>
    implements $SearchDoctorsCopyWith<$Res> {
  _$SearchDoctorsCopyWithImpl(this._self, this._then);

  final SearchDoctors _self;
  final $Res Function(SearchDoctors) _then;

  /// Create a copy of DoctorsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? query = null,
  }) {
    return _then(SearchDoctors(
      null == query
          ? _self.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class SelectSpecialty implements DoctorsEvent {
  const SelectSpecialty(this.specialty);

  final String? specialty;

  /// Create a copy of DoctorsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SelectSpecialtyCopyWith<SelectSpecialty> get copyWith =>
      _$SelectSpecialtyCopyWithImpl<SelectSpecialty>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SelectSpecialty &&
            (identical(other.specialty, specialty) ||
                other.specialty == specialty));
  }

  @override
  int get hashCode => Object.hash(runtimeType, specialty);

  @override
  String toString() {
    return 'DoctorsEvent.selectSpecialty(specialty: $specialty)';
  }
}

/// @nodoc
abstract mixin class $SelectSpecialtyCopyWith<$Res>
    implements $DoctorsEventCopyWith<$Res> {
  factory $SelectSpecialtyCopyWith(
          SelectSpecialty value, $Res Function(SelectSpecialty) _then) =
      _$SelectSpecialtyCopyWithImpl;
  @useResult
  $Res call({String? specialty});
}

/// @nodoc
class _$SelectSpecialtyCopyWithImpl<$Res>
    implements $SelectSpecialtyCopyWith<$Res> {
  _$SelectSpecialtyCopyWithImpl(this._self, this._then);

  final SelectSpecialty _self;
  final $Res Function(SelectSpecialty) _then;

  /// Create a copy of DoctorsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? specialty = freezed,
  }) {
    return _then(SelectSpecialty(
      freezed == specialty
          ? _self.specialty
          : specialty // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
