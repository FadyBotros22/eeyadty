// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AuthState {
  bool get isLoading;
  bool get inRegistrationSteps;
  bool get shouldResetTimer;
  String get phoneNumber;
  Employee? get employee;
  String? get imageUrl;
  double? get imageLoadingProgress;
  ActiveAuthPage? get activePage;
  List<Service> get services;
  List<BusinessHour> get businessHours;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AuthStateCopyWith<AuthState> get copyWith =>
      _$AuthStateCopyWithImpl<AuthState>(this as AuthState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AuthState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.inRegistrationSteps, inRegistrationSteps) ||
                other.inRegistrationSteps == inRegistrationSteps) &&
            (identical(other.shouldResetTimer, shouldResetTimer) ||
                other.shouldResetTimer == shouldResetTimer) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.employee, employee) ||
                other.employee == employee) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.imageLoadingProgress, imageLoadingProgress) ||
                other.imageLoadingProgress == imageLoadingProgress) &&
            (identical(other.activePage, activePage) ||
                other.activePage == activePage) &&
            const DeepCollectionEquality().equals(other.services, services) &&
            const DeepCollectionEquality()
                .equals(other.businessHours, businessHours));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      inRegistrationSteps,
      shouldResetTimer,
      phoneNumber,
      employee,
      imageUrl,
      imageLoadingProgress,
      activePage,
      const DeepCollectionEquality().hash(services),
      const DeepCollectionEquality().hash(businessHours));

  @override
  String toString() {
    return 'AuthState(isLoading: $isLoading, inRegistrationSteps: $inRegistrationSteps, shouldResetTimer: $shouldResetTimer, phoneNumber: $phoneNumber, employee: $employee, imageUrl: $imageUrl, imageLoadingProgress: $imageLoadingProgress, activePage: $activePage, services: $services, businessHours: $businessHours)';
  }
}

/// @nodoc
abstract mixin class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) _then) =
      _$AuthStateCopyWithImpl;
  @useResult
  $Res call(
      {bool isLoading,
      bool inRegistrationSteps,
      bool shouldResetTimer,
      String phoneNumber,
      Employee? employee,
      String? imageUrl,
      double? imageLoadingProgress,
      ActiveAuthPage? activePage,
      List<Service> services,
      List<BusinessHour> businessHours});

  $EmployeeCopyWith<$Res>? get employee;
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res> implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._self, this._then);

  final AuthState _self;
  final $Res Function(AuthState) _then;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? inRegistrationSteps = null,
    Object? shouldResetTimer = null,
    Object? phoneNumber = null,
    Object? employee = freezed,
    Object? imageUrl = freezed,
    Object? imageLoadingProgress = freezed,
    Object? activePage = freezed,
    Object? services = null,
    Object? businessHours = null,
  }) {
    return _then(_self.copyWith(
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      inRegistrationSteps: null == inRegistrationSteps
          ? _self.inRegistrationSteps
          : inRegistrationSteps // ignore: cast_nullable_to_non_nullable
              as bool,
      shouldResetTimer: null == shouldResetTimer
          ? _self.shouldResetTimer
          : shouldResetTimer // ignore: cast_nullable_to_non_nullable
              as bool,
      phoneNumber: null == phoneNumber
          ? _self.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      employee: freezed == employee
          ? _self.employee
          : employee // ignore: cast_nullable_to_non_nullable
              as Employee?,
      imageUrl: freezed == imageUrl
          ? _self.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      imageLoadingProgress: freezed == imageLoadingProgress
          ? _self.imageLoadingProgress
          : imageLoadingProgress // ignore: cast_nullable_to_non_nullable
              as double?,
      activePage: freezed == activePage
          ? _self.activePage
          : activePage // ignore: cast_nullable_to_non_nullable
              as ActiveAuthPage?,
      services: null == services
          ? _self.services
          : services // ignore: cast_nullable_to_non_nullable
              as List<Service>,
      businessHours: null == businessHours
          ? _self.businessHours
          : businessHours // ignore: cast_nullable_to_non_nullable
              as List<BusinessHour>,
    ));
  }

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $EmployeeCopyWith<$Res>? get employee {
    if (_self.employee == null) {
      return null;
    }

    return $EmployeeCopyWith<$Res>(_self.employee!, (value) {
      return _then(_self.copyWith(employee: value));
    });
  }
}

/// Adds pattern-matching-related methods to [AuthState].
extension AuthStatePatterns on AuthState {
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
    TResult Function(_AuthState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AuthState() when $default != null:
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
    TResult Function(_AuthState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AuthState():
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
    TResult? Function(_AuthState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AuthState() when $default != null:
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
            bool inRegistrationSteps,
            bool shouldResetTimer,
            String phoneNumber,
            Employee? employee,
            String? imageUrl,
            double? imageLoadingProgress,
            ActiveAuthPage? activePage,
            List<Service> services,
            List<BusinessHour> businessHours)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AuthState() when $default != null:
        return $default(
            _that.isLoading,
            _that.inRegistrationSteps,
            _that.shouldResetTimer,
            _that.phoneNumber,
            _that.employee,
            _that.imageUrl,
            _that.imageLoadingProgress,
            _that.activePage,
            _that.services,
            _that.businessHours);
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
            bool inRegistrationSteps,
            bool shouldResetTimer,
            String phoneNumber,
            Employee? employee,
            String? imageUrl,
            double? imageLoadingProgress,
            ActiveAuthPage? activePage,
            List<Service> services,
            List<BusinessHour> businessHours)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AuthState():
        return $default(
            _that.isLoading,
            _that.inRegistrationSteps,
            _that.shouldResetTimer,
            _that.phoneNumber,
            _that.employee,
            _that.imageUrl,
            _that.imageLoadingProgress,
            _that.activePage,
            _that.services,
            _that.businessHours);
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
            bool inRegistrationSteps,
            bool shouldResetTimer,
            String phoneNumber,
            Employee? employee,
            String? imageUrl,
            double? imageLoadingProgress,
            ActiveAuthPage? activePage,
            List<Service> services,
            List<BusinessHour> businessHours)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AuthState() when $default != null:
        return $default(
            _that.isLoading,
            _that.inRegistrationSteps,
            _that.shouldResetTimer,
            _that.phoneNumber,
            _that.employee,
            _that.imageUrl,
            _that.imageLoadingProgress,
            _that.activePage,
            _that.services,
            _that.businessHours);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _AuthState extends AuthState {
  const _AuthState(
      {this.isLoading = false,
      this.inRegistrationSteps = false,
      this.shouldResetTimer = false,
      this.phoneNumber = '',
      this.employee,
      this.imageUrl,
      this.imageLoadingProgress,
      this.activePage,
      final List<Service> services = const [],
      final List<BusinessHour> businessHours = const []})
      : _services = services,
        _businessHours = businessHours,
        super._();

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool inRegistrationSteps;
  @override
  @JsonKey()
  final bool shouldResetTimer;
  @override
  @JsonKey()
  final String phoneNumber;
  @override
  final Employee? employee;
  @override
  final String? imageUrl;
  @override
  final double? imageLoadingProgress;
  @override
  final ActiveAuthPage? activePage;
  final List<Service> _services;
  @override
  @JsonKey()
  List<Service> get services {
    if (_services is EqualUnmodifiableListView) return _services;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_services);
  }

  final List<BusinessHour> _businessHours;
  @override
  @JsonKey()
  List<BusinessHour> get businessHours {
    if (_businessHours is EqualUnmodifiableListView) return _businessHours;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_businessHours);
  }

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AuthStateCopyWith<_AuthState> get copyWith =>
      __$AuthStateCopyWithImpl<_AuthState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AuthState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.inRegistrationSteps, inRegistrationSteps) ||
                other.inRegistrationSteps == inRegistrationSteps) &&
            (identical(other.shouldResetTimer, shouldResetTimer) ||
                other.shouldResetTimer == shouldResetTimer) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.employee, employee) ||
                other.employee == employee) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.imageLoadingProgress, imageLoadingProgress) ||
                other.imageLoadingProgress == imageLoadingProgress) &&
            (identical(other.activePage, activePage) ||
                other.activePage == activePage) &&
            const DeepCollectionEquality().equals(other._services, _services) &&
            const DeepCollectionEquality()
                .equals(other._businessHours, _businessHours));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      inRegistrationSteps,
      shouldResetTimer,
      phoneNumber,
      employee,
      imageUrl,
      imageLoadingProgress,
      activePage,
      const DeepCollectionEquality().hash(_services),
      const DeepCollectionEquality().hash(_businessHours));

  @override
  String toString() {
    return 'AuthState(isLoading: $isLoading, inRegistrationSteps: $inRegistrationSteps, shouldResetTimer: $shouldResetTimer, phoneNumber: $phoneNumber, employee: $employee, imageUrl: $imageUrl, imageLoadingProgress: $imageLoadingProgress, activePage: $activePage, services: $services, businessHours: $businessHours)';
  }
}

/// @nodoc
abstract mixin class _$AuthStateCopyWith<$Res>
    implements $AuthStateCopyWith<$Res> {
  factory _$AuthStateCopyWith(
          _AuthState value, $Res Function(_AuthState) _then) =
      __$AuthStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool inRegistrationSteps,
      bool shouldResetTimer,
      String phoneNumber,
      Employee? employee,
      String? imageUrl,
      double? imageLoadingProgress,
      ActiveAuthPage? activePage,
      List<Service> services,
      List<BusinessHour> businessHours});

  @override
  $EmployeeCopyWith<$Res>? get employee;
}

/// @nodoc
class __$AuthStateCopyWithImpl<$Res> implements _$AuthStateCopyWith<$Res> {
  __$AuthStateCopyWithImpl(this._self, this._then);

  final _AuthState _self;
  final $Res Function(_AuthState) _then;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? isLoading = null,
    Object? inRegistrationSteps = null,
    Object? shouldResetTimer = null,
    Object? phoneNumber = null,
    Object? employee = freezed,
    Object? imageUrl = freezed,
    Object? imageLoadingProgress = freezed,
    Object? activePage = freezed,
    Object? services = null,
    Object? businessHours = null,
  }) {
    return _then(_AuthState(
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      inRegistrationSteps: null == inRegistrationSteps
          ? _self.inRegistrationSteps
          : inRegistrationSteps // ignore: cast_nullable_to_non_nullable
              as bool,
      shouldResetTimer: null == shouldResetTimer
          ? _self.shouldResetTimer
          : shouldResetTimer // ignore: cast_nullable_to_non_nullable
              as bool,
      phoneNumber: null == phoneNumber
          ? _self.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      employee: freezed == employee
          ? _self.employee
          : employee // ignore: cast_nullable_to_non_nullable
              as Employee?,
      imageUrl: freezed == imageUrl
          ? _self.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      imageLoadingProgress: freezed == imageLoadingProgress
          ? _self.imageLoadingProgress
          : imageLoadingProgress // ignore: cast_nullable_to_non_nullable
              as double?,
      activePage: freezed == activePage
          ? _self.activePage
          : activePage // ignore: cast_nullable_to_non_nullable
              as ActiveAuthPage?,
      services: null == services
          ? _self._services
          : services // ignore: cast_nullable_to_non_nullable
              as List<Service>,
      businessHours: null == businessHours
          ? _self._businessHours
          : businessHours // ignore: cast_nullable_to_non_nullable
              as List<BusinessHour>,
    ));
  }

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $EmployeeCopyWith<$Res>? get employee {
    if (_self.employee == null) {
      return null;
    }

    return $EmployeeCopyWith<$Res>(_self.employee!, (value) {
      return _then(_self.copyWith(employee: value));
    });
  }
}

// dart format on
