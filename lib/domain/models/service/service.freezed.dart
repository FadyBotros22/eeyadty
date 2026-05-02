// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'service.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ClinicService {
  String? get id;
  String? get name;
  String? get description;
  String? get category;
  String? get imageUrl;
  double? get price;
  int? get durationMinutes;
  bool get isPopular;

  /// Create a copy of ClinicService
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ClinicServiceCopyWith<ClinicService> get copyWith =>
      _$ClinicServiceCopyWithImpl<ClinicService>(
          this as ClinicService, _$identity);

  /// Serializes this ClinicService to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ClinicService &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.durationMinutes, durationMinutes) ||
                other.durationMinutes == durationMinutes) &&
            (identical(other.isPopular, isPopular) ||
                other.isPopular == isPopular));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, description, category,
      imageUrl, price, durationMinutes, isPopular);

  @override
  String toString() {
    return 'ClinicService(id: $id, name: $name, description: $description, category: $category, imageUrl: $imageUrl, price: $price, durationMinutes: $durationMinutes, isPopular: $isPopular)';
  }
}

/// @nodoc
abstract mixin class $ClinicServiceCopyWith<$Res> {
  factory $ClinicServiceCopyWith(
          ClinicService value, $Res Function(ClinicService) _then) =
      _$ClinicServiceCopyWithImpl;
  @useResult
  $Res call(
      {String? id,
      String? name,
      String? description,
      String? category,
      String? imageUrl,
      double? price,
      int? durationMinutes,
      bool isPopular});
}

/// @nodoc
class _$ClinicServiceCopyWithImpl<$Res>
    implements $ClinicServiceCopyWith<$Res> {
  _$ClinicServiceCopyWithImpl(this._self, this._then);

  final ClinicService _self;
  final $Res Function(ClinicService) _then;

  /// Create a copy of ClinicService
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? category = freezed,
    Object? imageUrl = freezed,
    Object? price = freezed,
    Object? durationMinutes = freezed,
    Object? isPopular = null,
  }) {
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _self.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _self.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      durationMinutes: freezed == durationMinutes
          ? _self.durationMinutes
          : durationMinutes // ignore: cast_nullable_to_non_nullable
              as int?,
      isPopular: null == isPopular
          ? _self.isPopular
          : isPopular // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [ClinicService].
extension ClinicServicePatterns on ClinicService {
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
    TResult Function(_ClinicService value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ClinicService() when $default != null:
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
    TResult Function(_ClinicService value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ClinicService():
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
    TResult? Function(_ClinicService value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ClinicService() when $default != null:
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
            String? name,
            String? description,
            String? category,
            String? imageUrl,
            double? price,
            int? durationMinutes,
            bool isPopular)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ClinicService() when $default != null:
        return $default(
            _that.id,
            _that.name,
            _that.description,
            _that.category,
            _that.imageUrl,
            _that.price,
            _that.durationMinutes,
            _that.isPopular);
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
            String? name,
            String? description,
            String? category,
            String? imageUrl,
            double? price,
            int? durationMinutes,
            bool isPopular)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ClinicService():
        return $default(
            _that.id,
            _that.name,
            _that.description,
            _that.category,
            _that.imageUrl,
            _that.price,
            _that.durationMinutes,
            _that.isPopular);
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
            String? name,
            String? description,
            String? category,
            String? imageUrl,
            double? price,
            int? durationMinutes,
            bool isPopular)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ClinicService() when $default != null:
        return $default(
            _that.id,
            _that.name,
            _that.description,
            _that.category,
            _that.imageUrl,
            _that.price,
            _that.durationMinutes,
            _that.isPopular);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ClinicService implements ClinicService {
  const _ClinicService(
      {this.id,
      this.name,
      this.description,
      this.category,
      this.imageUrl,
      this.price,
      this.durationMinutes,
      this.isPopular = false});
  factory _ClinicService.fromJson(Map<String, dynamic> json) =>
      _$ClinicServiceFromJson(json);

  @override
  final String? id;
  @override
  final String? name;
  @override
  final String? description;
  @override
  final String? category;
  @override
  final String? imageUrl;
  @override
  final double? price;
  @override
  final int? durationMinutes;
  @override
  @JsonKey()
  final bool isPopular;

  /// Create a copy of ClinicService
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ClinicServiceCopyWith<_ClinicService> get copyWith =>
      __$ClinicServiceCopyWithImpl<_ClinicService>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ClinicServiceToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ClinicService &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.durationMinutes, durationMinutes) ||
                other.durationMinutes == durationMinutes) &&
            (identical(other.isPopular, isPopular) ||
                other.isPopular == isPopular));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, description, category,
      imageUrl, price, durationMinutes, isPopular);

  @override
  String toString() {
    return 'ClinicService(id: $id, name: $name, description: $description, category: $category, imageUrl: $imageUrl, price: $price, durationMinutes: $durationMinutes, isPopular: $isPopular)';
  }
}

/// @nodoc
abstract mixin class _$ClinicServiceCopyWith<$Res>
    implements $ClinicServiceCopyWith<$Res> {
  factory _$ClinicServiceCopyWith(
          _ClinicService value, $Res Function(_ClinicService) _then) =
      __$ClinicServiceCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? id,
      String? name,
      String? description,
      String? category,
      String? imageUrl,
      double? price,
      int? durationMinutes,
      bool isPopular});
}

/// @nodoc
class __$ClinicServiceCopyWithImpl<$Res>
    implements _$ClinicServiceCopyWith<$Res> {
  __$ClinicServiceCopyWithImpl(this._self, this._then);

  final _ClinicService _self;
  final $Res Function(_ClinicService) _then;

  /// Create a copy of ClinicService
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? category = freezed,
    Object? imageUrl = freezed,
    Object? price = freezed,
    Object? durationMinutes = freezed,
    Object? isPopular = null,
  }) {
    return _then(_ClinicService(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _self.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _self.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      durationMinutes: freezed == durationMinutes
          ? _self.durationMinutes
          : durationMinutes // ignore: cast_nullable_to_non_nullable
              as int?,
      isPopular: null == isPopular
          ? _self.isPopular
          : isPopular // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
mixin _$ServiceCategory {
  String? get id;
  String? get name;
  String? get iconName;

  /// Create a copy of ServiceCategory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ServiceCategoryCopyWith<ServiceCategory> get copyWith =>
      _$ServiceCategoryCopyWithImpl<ServiceCategory>(
          this as ServiceCategory, _$identity);

  /// Serializes this ServiceCategory to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ServiceCategory &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.iconName, iconName) ||
                other.iconName == iconName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, iconName);

  @override
  String toString() {
    return 'ServiceCategory(id: $id, name: $name, iconName: $iconName)';
  }
}

/// @nodoc
abstract mixin class $ServiceCategoryCopyWith<$Res> {
  factory $ServiceCategoryCopyWith(
          ServiceCategory value, $Res Function(ServiceCategory) _then) =
      _$ServiceCategoryCopyWithImpl;
  @useResult
  $Res call({String? id, String? name, String? iconName});
}

/// @nodoc
class _$ServiceCategoryCopyWithImpl<$Res>
    implements $ServiceCategoryCopyWith<$Res> {
  _$ServiceCategoryCopyWithImpl(this._self, this._then);

  final ServiceCategory _self;
  final $Res Function(ServiceCategory) _then;

  /// Create a copy of ServiceCategory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? iconName = freezed,
  }) {
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      iconName: freezed == iconName
          ? _self.iconName
          : iconName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [ServiceCategory].
extension ServiceCategoryPatterns on ServiceCategory {
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
    TResult Function(_ServiceCategory value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ServiceCategory() when $default != null:
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
    TResult Function(_ServiceCategory value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ServiceCategory():
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
    TResult? Function(_ServiceCategory value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ServiceCategory() when $default != null:
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
    TResult Function(String? id, String? name, String? iconName)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ServiceCategory() when $default != null:
        return $default(_that.id, _that.name, _that.iconName);
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
    TResult Function(String? id, String? name, String? iconName) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ServiceCategory():
        return $default(_that.id, _that.name, _that.iconName);
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
    TResult? Function(String? id, String? name, String? iconName)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ServiceCategory() when $default != null:
        return $default(_that.id, _that.name, _that.iconName);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ServiceCategory implements ServiceCategory {
  const _ServiceCategory({this.id, this.name, this.iconName});
  factory _ServiceCategory.fromJson(Map<String, dynamic> json) =>
      _$ServiceCategoryFromJson(json);

  @override
  final String? id;
  @override
  final String? name;
  @override
  final String? iconName;

  /// Create a copy of ServiceCategory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ServiceCategoryCopyWith<_ServiceCategory> get copyWith =>
      __$ServiceCategoryCopyWithImpl<_ServiceCategory>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ServiceCategoryToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ServiceCategory &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.iconName, iconName) ||
                other.iconName == iconName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, iconName);

  @override
  String toString() {
    return 'ServiceCategory(id: $id, name: $name, iconName: $iconName)';
  }
}

/// @nodoc
abstract mixin class _$ServiceCategoryCopyWith<$Res>
    implements $ServiceCategoryCopyWith<$Res> {
  factory _$ServiceCategoryCopyWith(
          _ServiceCategory value, $Res Function(_ServiceCategory) _then) =
      __$ServiceCategoryCopyWithImpl;
  @override
  @useResult
  $Res call({String? id, String? name, String? iconName});
}

/// @nodoc
class __$ServiceCategoryCopyWithImpl<$Res>
    implements _$ServiceCategoryCopyWith<$Res> {
  __$ServiceCategoryCopyWithImpl(this._self, this._then);

  final _ServiceCategory _self;
  final $Res Function(_ServiceCategory) _then;

  /// Create a copy of ServiceCategory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? iconName = freezed,
  }) {
    return _then(_ServiceCategory(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      iconName: freezed == iconName
          ? _self.iconName
          : iconName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
