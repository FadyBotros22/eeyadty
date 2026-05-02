// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'services_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ServicesState {
  bool get isLoadingServices;
  bool get isLoadingCategories;
  List<ClinicService> get services;
  List<ClinicService> get filteredServices;
  List<ServiceCategory> get categories;
  String? get selectedCategoryId;
  String? get errorMessage;
  String get searchQuery;

  /// Create a copy of ServicesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ServicesStateCopyWith<ServicesState> get copyWith =>
      _$ServicesStateCopyWithImpl<ServicesState>(
          this as ServicesState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ServicesState &&
            (identical(other.isLoadingServices, isLoadingServices) ||
                other.isLoadingServices == isLoadingServices) &&
            (identical(other.isLoadingCategories, isLoadingCategories) ||
                other.isLoadingCategories == isLoadingCategories) &&
            const DeepCollectionEquality().equals(other.services, services) &&
            const DeepCollectionEquality()
                .equals(other.filteredServices, filteredServices) &&
            const DeepCollectionEquality()
                .equals(other.categories, categories) &&
            (identical(other.selectedCategoryId, selectedCategoryId) ||
                other.selectedCategoryId == selectedCategoryId) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.searchQuery, searchQuery) ||
                other.searchQuery == searchQuery));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoadingServices,
      isLoadingCategories,
      const DeepCollectionEquality().hash(services),
      const DeepCollectionEquality().hash(filteredServices),
      const DeepCollectionEquality().hash(categories),
      selectedCategoryId,
      errorMessage,
      searchQuery);

  @override
  String toString() {
    return 'ServicesState(isLoadingServices: $isLoadingServices, isLoadingCategories: $isLoadingCategories, services: $services, filteredServices: $filteredServices, categories: $categories, selectedCategoryId: $selectedCategoryId, errorMessage: $errorMessage, searchQuery: $searchQuery)';
  }
}

/// @nodoc
abstract mixin class $ServicesStateCopyWith<$Res> {
  factory $ServicesStateCopyWith(
          ServicesState value, $Res Function(ServicesState) _then) =
      _$ServicesStateCopyWithImpl;
  @useResult
  $Res call(
      {bool isLoadingServices,
      bool isLoadingCategories,
      List<ClinicService> services,
      List<ClinicService> filteredServices,
      List<ServiceCategory> categories,
      String? selectedCategoryId,
      String? errorMessage,
      String searchQuery});
}

/// @nodoc
class _$ServicesStateCopyWithImpl<$Res>
    implements $ServicesStateCopyWith<$Res> {
  _$ServicesStateCopyWithImpl(this._self, this._then);

  final ServicesState _self;
  final $Res Function(ServicesState) _then;

  /// Create a copy of ServicesState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoadingServices = null,
    Object? isLoadingCategories = null,
    Object? services = null,
    Object? filteredServices = null,
    Object? categories = null,
    Object? selectedCategoryId = freezed,
    Object? errorMessage = freezed,
    Object? searchQuery = null,
  }) {
    return _then(_self.copyWith(
      isLoadingServices: null == isLoadingServices
          ? _self.isLoadingServices
          : isLoadingServices // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingCategories: null == isLoadingCategories
          ? _self.isLoadingCategories
          : isLoadingCategories // ignore: cast_nullable_to_non_nullable
              as bool,
      services: null == services
          ? _self.services
          : services // ignore: cast_nullable_to_non_nullable
              as List<ClinicService>,
      filteredServices: null == filteredServices
          ? _self.filteredServices
          : filteredServices // ignore: cast_nullable_to_non_nullable
              as List<ClinicService>,
      categories: null == categories
          ? _self.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<ServiceCategory>,
      selectedCategoryId: freezed == selectedCategoryId
          ? _self.selectedCategoryId
          : selectedCategoryId // ignore: cast_nullable_to_non_nullable
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

/// Adds pattern-matching-related methods to [ServicesState].
extension ServicesStatePatterns on ServicesState {
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
    TResult Function(_ServicesState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ServicesState() when $default != null:
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
    TResult Function(_ServicesState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ServicesState():
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
    TResult? Function(_ServicesState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ServicesState() when $default != null:
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
            bool isLoadingServices,
            bool isLoadingCategories,
            List<ClinicService> services,
            List<ClinicService> filteredServices,
            List<ServiceCategory> categories,
            String? selectedCategoryId,
            String? errorMessage,
            String searchQuery)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ServicesState() when $default != null:
        return $default(
            _that.isLoadingServices,
            _that.isLoadingCategories,
            _that.services,
            _that.filteredServices,
            _that.categories,
            _that.selectedCategoryId,
            _that.errorMessage,
            _that.searchQuery);
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
            bool isLoadingServices,
            bool isLoadingCategories,
            List<ClinicService> services,
            List<ClinicService> filteredServices,
            List<ServiceCategory> categories,
            String? selectedCategoryId,
            String? errorMessage,
            String searchQuery)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ServicesState():
        return $default(
            _that.isLoadingServices,
            _that.isLoadingCategories,
            _that.services,
            _that.filteredServices,
            _that.categories,
            _that.selectedCategoryId,
            _that.errorMessage,
            _that.searchQuery);
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
            bool isLoadingServices,
            bool isLoadingCategories,
            List<ClinicService> services,
            List<ClinicService> filteredServices,
            List<ServiceCategory> categories,
            String? selectedCategoryId,
            String? errorMessage,
            String searchQuery)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ServicesState() when $default != null:
        return $default(
            _that.isLoadingServices,
            _that.isLoadingCategories,
            _that.services,
            _that.filteredServices,
            _that.categories,
            _that.selectedCategoryId,
            _that.errorMessage,
            _that.searchQuery);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ServicesState implements ServicesState {
  const _ServicesState(
      {this.isLoadingServices = false,
      this.isLoadingCategories = false,
      final List<ClinicService> services = const [],
      final List<ClinicService> filteredServices = const [],
      final List<ServiceCategory> categories = const [],
      this.selectedCategoryId,
      this.errorMessage,
      this.searchQuery = ''})
      : _services = services,
        _filteredServices = filteredServices,
        _categories = categories;

  @override
  @JsonKey()
  final bool isLoadingServices;
  @override
  @JsonKey()
  final bool isLoadingCategories;
  final List<ClinicService> _services;
  @override
  @JsonKey()
  List<ClinicService> get services {
    if (_services is EqualUnmodifiableListView) return _services;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_services);
  }

  final List<ClinicService> _filteredServices;
  @override
  @JsonKey()
  List<ClinicService> get filteredServices {
    if (_filteredServices is EqualUnmodifiableListView)
      return _filteredServices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_filteredServices);
  }

  final List<ServiceCategory> _categories;
  @override
  @JsonKey()
  List<ServiceCategory> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  @override
  final String? selectedCategoryId;
  @override
  final String? errorMessage;
  @override
  @JsonKey()
  final String searchQuery;

  /// Create a copy of ServicesState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ServicesStateCopyWith<_ServicesState> get copyWith =>
      __$ServicesStateCopyWithImpl<_ServicesState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ServicesState &&
            (identical(other.isLoadingServices, isLoadingServices) ||
                other.isLoadingServices == isLoadingServices) &&
            (identical(other.isLoadingCategories, isLoadingCategories) ||
                other.isLoadingCategories == isLoadingCategories) &&
            const DeepCollectionEquality().equals(other._services, _services) &&
            const DeepCollectionEquality()
                .equals(other._filteredServices, _filteredServices) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            (identical(other.selectedCategoryId, selectedCategoryId) ||
                other.selectedCategoryId == selectedCategoryId) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.searchQuery, searchQuery) ||
                other.searchQuery == searchQuery));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoadingServices,
      isLoadingCategories,
      const DeepCollectionEquality().hash(_services),
      const DeepCollectionEquality().hash(_filteredServices),
      const DeepCollectionEquality().hash(_categories),
      selectedCategoryId,
      errorMessage,
      searchQuery);

  @override
  String toString() {
    return 'ServicesState(isLoadingServices: $isLoadingServices, isLoadingCategories: $isLoadingCategories, services: $services, filteredServices: $filteredServices, categories: $categories, selectedCategoryId: $selectedCategoryId, errorMessage: $errorMessage, searchQuery: $searchQuery)';
  }
}

/// @nodoc
abstract mixin class _$ServicesStateCopyWith<$Res>
    implements $ServicesStateCopyWith<$Res> {
  factory _$ServicesStateCopyWith(
          _ServicesState value, $Res Function(_ServicesState) _then) =
      __$ServicesStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {bool isLoadingServices,
      bool isLoadingCategories,
      List<ClinicService> services,
      List<ClinicService> filteredServices,
      List<ServiceCategory> categories,
      String? selectedCategoryId,
      String? errorMessage,
      String searchQuery});
}

/// @nodoc
class __$ServicesStateCopyWithImpl<$Res>
    implements _$ServicesStateCopyWith<$Res> {
  __$ServicesStateCopyWithImpl(this._self, this._then);

  final _ServicesState _self;
  final $Res Function(_ServicesState) _then;

  /// Create a copy of ServicesState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? isLoadingServices = null,
    Object? isLoadingCategories = null,
    Object? services = null,
    Object? filteredServices = null,
    Object? categories = null,
    Object? selectedCategoryId = freezed,
    Object? errorMessage = freezed,
    Object? searchQuery = null,
  }) {
    return _then(_ServicesState(
      isLoadingServices: null == isLoadingServices
          ? _self.isLoadingServices
          : isLoadingServices // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingCategories: null == isLoadingCategories
          ? _self.isLoadingCategories
          : isLoadingCategories // ignore: cast_nullable_to_non_nullable
              as bool,
      services: null == services
          ? _self._services
          : services // ignore: cast_nullable_to_non_nullable
              as List<ClinicService>,
      filteredServices: null == filteredServices
          ? _self._filteredServices
          : filteredServices // ignore: cast_nullable_to_non_nullable
              as List<ClinicService>,
      categories: null == categories
          ? _self._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<ServiceCategory>,
      selectedCategoryId: freezed == selectedCategoryId
          ? _self.selectedCategoryId
          : selectedCategoryId // ignore: cast_nullable_to_non_nullable
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
