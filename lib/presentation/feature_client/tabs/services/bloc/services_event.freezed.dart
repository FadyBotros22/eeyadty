// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'services_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ServicesEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ServicesEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ServicesEvent()';
  }
}

/// @nodoc
class $ServicesEventCopyWith<$Res> {
  $ServicesEventCopyWith(ServicesEvent _, $Res Function(ServicesEvent) __);
}

/// Adds pattern-matching-related methods to [ServicesEvent].
extension ServicesEventPatterns on ServicesEvent {
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
    TResult Function(LoadServices value)? loadServices,
    TResult Function(LoadCategories value)? loadCategories,
    TResult Function(SelectCategory value)? selectCategory,
    TResult Function(SearchServices value)? searchServices,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case LoadServices() when loadServices != null:
        return loadServices(_that);
      case LoadCategories() when loadCategories != null:
        return loadCategories(_that);
      case SelectCategory() when selectCategory != null:
        return selectCategory(_that);
      case SearchServices() when searchServices != null:
        return searchServices(_that);
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
    required TResult Function(LoadServices value) loadServices,
    required TResult Function(LoadCategories value) loadCategories,
    required TResult Function(SelectCategory value) selectCategory,
    required TResult Function(SearchServices value) searchServices,
  }) {
    final _that = this;
    switch (_that) {
      case LoadServices():
        return loadServices(_that);
      case LoadCategories():
        return loadCategories(_that);
      case SelectCategory():
        return selectCategory(_that);
      case SearchServices():
        return searchServices(_that);
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
    TResult? Function(LoadServices value)? loadServices,
    TResult? Function(LoadCategories value)? loadCategories,
    TResult? Function(SelectCategory value)? selectCategory,
    TResult? Function(SearchServices value)? searchServices,
  }) {
    final _that = this;
    switch (_that) {
      case LoadServices() when loadServices != null:
        return loadServices(_that);
      case LoadCategories() when loadCategories != null:
        return loadCategories(_that);
      case SelectCategory() when selectCategory != null:
        return selectCategory(_that);
      case SearchServices() when searchServices != null:
        return searchServices(_that);
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
    TResult Function(String? category)? loadServices,
    TResult Function()? loadCategories,
    TResult Function(String? categoryId)? selectCategory,
    TResult Function(String query)? searchServices,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case LoadServices() when loadServices != null:
        return loadServices(_that.category);
      case LoadCategories() when loadCategories != null:
        return loadCategories();
      case SelectCategory() when selectCategory != null:
        return selectCategory(_that.categoryId);
      case SearchServices() when searchServices != null:
        return searchServices(_that.query);
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
    required TResult Function(String? category) loadServices,
    required TResult Function() loadCategories,
    required TResult Function(String? categoryId) selectCategory,
    required TResult Function(String query) searchServices,
  }) {
    final _that = this;
    switch (_that) {
      case LoadServices():
        return loadServices(_that.category);
      case LoadCategories():
        return loadCategories();
      case SelectCategory():
        return selectCategory(_that.categoryId);
      case SearchServices():
        return searchServices(_that.query);
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
    TResult? Function(String? category)? loadServices,
    TResult? Function()? loadCategories,
    TResult? Function(String? categoryId)? selectCategory,
    TResult? Function(String query)? searchServices,
  }) {
    final _that = this;
    switch (_that) {
      case LoadServices() when loadServices != null:
        return loadServices(_that.category);
      case LoadCategories() when loadCategories != null:
        return loadCategories();
      case SelectCategory() when selectCategory != null:
        return selectCategory(_that.categoryId);
      case SearchServices() when searchServices != null:
        return searchServices(_that.query);
      case _:
        return null;
    }
  }
}

/// @nodoc

class LoadServices implements ServicesEvent {
  const LoadServices({this.category});

  final String? category;

  /// Create a copy of ServicesEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LoadServicesCopyWith<LoadServices> get copyWith =>
      _$LoadServicesCopyWithImpl<LoadServices>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LoadServices &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @override
  int get hashCode => Object.hash(runtimeType, category);

  @override
  String toString() {
    return 'ServicesEvent.loadServices(category: $category)';
  }
}

/// @nodoc
abstract mixin class $LoadServicesCopyWith<$Res>
    implements $ServicesEventCopyWith<$Res> {
  factory $LoadServicesCopyWith(
          LoadServices value, $Res Function(LoadServices) _then) =
      _$LoadServicesCopyWithImpl;
  @useResult
  $Res call({String? category});
}

/// @nodoc
class _$LoadServicesCopyWithImpl<$Res> implements $LoadServicesCopyWith<$Res> {
  _$LoadServicesCopyWithImpl(this._self, this._then);

  final LoadServices _self;
  final $Res Function(LoadServices) _then;

  /// Create a copy of ServicesEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? category = freezed,
  }) {
    return _then(LoadServices(
      category: freezed == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class LoadCategories implements ServicesEvent {
  const LoadCategories();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is LoadCategories);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ServicesEvent.loadCategories()';
  }
}

/// @nodoc

class SelectCategory implements ServicesEvent {
  const SelectCategory(this.categoryId);

  final String? categoryId;

  /// Create a copy of ServicesEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SelectCategoryCopyWith<SelectCategory> get copyWith =>
      _$SelectCategoryCopyWithImpl<SelectCategory>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SelectCategory &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, categoryId);

  @override
  String toString() {
    return 'ServicesEvent.selectCategory(categoryId: $categoryId)';
  }
}

/// @nodoc
abstract mixin class $SelectCategoryCopyWith<$Res>
    implements $ServicesEventCopyWith<$Res> {
  factory $SelectCategoryCopyWith(
          SelectCategory value, $Res Function(SelectCategory) _then) =
      _$SelectCategoryCopyWithImpl;
  @useResult
  $Res call({String? categoryId});
}

/// @nodoc
class _$SelectCategoryCopyWithImpl<$Res>
    implements $SelectCategoryCopyWith<$Res> {
  _$SelectCategoryCopyWithImpl(this._self, this._then);

  final SelectCategory _self;
  final $Res Function(SelectCategory) _then;

  /// Create a copy of ServicesEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? categoryId = freezed,
  }) {
    return _then(SelectCategory(
      freezed == categoryId
          ? _self.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class SearchServices implements ServicesEvent {
  const SearchServices(this.query);

  final String query;

  /// Create a copy of ServicesEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SearchServicesCopyWith<SearchServices> get copyWith =>
      _$SearchServicesCopyWithImpl<SearchServices>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SearchServices &&
            (identical(other.query, query) || other.query == query));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query);

  @override
  String toString() {
    return 'ServicesEvent.searchServices(query: $query)';
  }
}

/// @nodoc
abstract mixin class $SearchServicesCopyWith<$Res>
    implements $ServicesEventCopyWith<$Res> {
  factory $SearchServicesCopyWith(
          SearchServices value, $Res Function(SearchServices) _then) =
      _$SearchServicesCopyWithImpl;
  @useResult
  $Res call({String query});
}

/// @nodoc
class _$SearchServicesCopyWithImpl<$Res>
    implements $SearchServicesCopyWith<$Res> {
  _$SearchServicesCopyWithImpl(this._self, this._then);

  final SearchServices _self;
  final $Res Function(SearchServices) _then;

  /// Create a copy of ServicesEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? query = null,
  }) {
    return _then(SearchServices(
      null == query
          ? _self.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
