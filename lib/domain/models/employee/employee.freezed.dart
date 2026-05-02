// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'employee.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Employee {
  String? get id;
  String? get name;
  String? get ar_name;
  String? get en_name;
  String? get phoneNumber;
  String? get merchantId;
  String? get imageUrl;
  String? get imageId;
  String? get branchId;
  bool? get acceptNotifications;
  WorkerType? get workerType;
  bool? get isFirstTimeRegister;

  /// Create a copy of Employee
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $EmployeeCopyWith<Employee> get copyWith =>
      _$EmployeeCopyWithImpl<Employee>(this as Employee, _$identity);

  /// Serializes this Employee to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Employee &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.ar_name, ar_name) || other.ar_name == ar_name) &&
            (identical(other.en_name, en_name) || other.en_name == en_name) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.merchantId, merchantId) ||
                other.merchantId == merchantId) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.imageId, imageId) || other.imageId == imageId) &&
            (identical(other.branchId, branchId) ||
                other.branchId == branchId) &&
            (identical(other.acceptNotifications, acceptNotifications) ||
                other.acceptNotifications == acceptNotifications) &&
            (identical(other.workerType, workerType) ||
                other.workerType == workerType) &&
            (identical(other.isFirstTimeRegister, isFirstTimeRegister) ||
                other.isFirstTimeRegister == isFirstTimeRegister));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      ar_name,
      en_name,
      phoneNumber,
      merchantId,
      imageUrl,
      imageId,
      branchId,
      acceptNotifications,
      workerType,
      isFirstTimeRegister);

  @override
  String toString() {
    return 'Employee(id: $id, name: $name, ar_name: $ar_name, en_name: $en_name, phoneNumber: $phoneNumber, merchantId: $merchantId, imageUrl: $imageUrl, imageId: $imageId, branchId: $branchId, acceptNotifications: $acceptNotifications, workerType: $workerType, isFirstTimeRegister: $isFirstTimeRegister)';
  }
}

/// @nodoc
abstract mixin class $EmployeeCopyWith<$Res> {
  factory $EmployeeCopyWith(Employee value, $Res Function(Employee) _then) =
      _$EmployeeCopyWithImpl;
  @useResult
  $Res call(
      {String? id,
      String? name,
      String? ar_name,
      String? en_name,
      String? phoneNumber,
      String? merchantId,
      String? imageUrl,
      String? imageId,
      String? branchId,
      bool? acceptNotifications,
      WorkerType? workerType,
      bool? isFirstTimeRegister});
}

/// @nodoc
class _$EmployeeCopyWithImpl<$Res> implements $EmployeeCopyWith<$Res> {
  _$EmployeeCopyWithImpl(this._self, this._then);

  final Employee _self;
  final $Res Function(Employee) _then;

  /// Create a copy of Employee
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? ar_name = freezed,
    Object? en_name = freezed,
    Object? phoneNumber = freezed,
    Object? merchantId = freezed,
    Object? imageUrl = freezed,
    Object? imageId = freezed,
    Object? branchId = freezed,
    Object? acceptNotifications = freezed,
    Object? workerType = freezed,
    Object? isFirstTimeRegister = freezed,
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
      ar_name: freezed == ar_name
          ? _self.ar_name
          : ar_name // ignore: cast_nullable_to_non_nullable
              as String?,
      en_name: freezed == en_name
          ? _self.en_name
          : en_name // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _self.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      merchantId: freezed == merchantId
          ? _self.merchantId
          : merchantId // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _self.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      imageId: freezed == imageId
          ? _self.imageId
          : imageId // ignore: cast_nullable_to_non_nullable
              as String?,
      branchId: freezed == branchId
          ? _self.branchId
          : branchId // ignore: cast_nullable_to_non_nullable
              as String?,
      acceptNotifications: freezed == acceptNotifications
          ? _self.acceptNotifications
          : acceptNotifications // ignore: cast_nullable_to_non_nullable
              as bool?,
      workerType: freezed == workerType
          ? _self.workerType
          : workerType // ignore: cast_nullable_to_non_nullable
              as WorkerType?,
      isFirstTimeRegister: freezed == isFirstTimeRegister
          ? _self.isFirstTimeRegister
          : isFirstTimeRegister // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// Adds pattern-matching-related methods to [Employee].
extension EmployeePatterns on Employee {
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
    TResult Function(_Employee value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Employee() when $default != null:
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
    TResult Function(_Employee value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Employee():
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
    TResult? Function(_Employee value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Employee() when $default != null:
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
            String? ar_name,
            String? en_name,
            String? phoneNumber,
            String? merchantId,
            String? imageUrl,
            String? imageId,
            String? branchId,
            bool? acceptNotifications,
            WorkerType? workerType,
            bool? isFirstTimeRegister)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Employee() when $default != null:
        return $default(
            _that.id,
            _that.name,
            _that.ar_name,
            _that.en_name,
            _that.phoneNumber,
            _that.merchantId,
            _that.imageUrl,
            _that.imageId,
            _that.branchId,
            _that.acceptNotifications,
            _that.workerType,
            _that.isFirstTimeRegister);
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
            String? ar_name,
            String? en_name,
            String? phoneNumber,
            String? merchantId,
            String? imageUrl,
            String? imageId,
            String? branchId,
            bool? acceptNotifications,
            WorkerType? workerType,
            bool? isFirstTimeRegister)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Employee():
        return $default(
            _that.id,
            _that.name,
            _that.ar_name,
            _that.en_name,
            _that.phoneNumber,
            _that.merchantId,
            _that.imageUrl,
            _that.imageId,
            _that.branchId,
            _that.acceptNotifications,
            _that.workerType,
            _that.isFirstTimeRegister);
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
            String? ar_name,
            String? en_name,
            String? phoneNumber,
            String? merchantId,
            String? imageUrl,
            String? imageId,
            String? branchId,
            bool? acceptNotifications,
            WorkerType? workerType,
            bool? isFirstTimeRegister)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Employee() when $default != null:
        return $default(
            _that.id,
            _that.name,
            _that.ar_name,
            _that.en_name,
            _that.phoneNumber,
            _that.merchantId,
            _that.imageUrl,
            _that.imageId,
            _that.branchId,
            _that.acceptNotifications,
            _that.workerType,
            _that.isFirstTimeRegister);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _Employee implements Employee {
  const _Employee(
      {this.id,
      this.name,
      this.ar_name,
      this.en_name,
      this.phoneNumber,
      this.merchantId,
      this.imageUrl,
      this.imageId,
      this.branchId,
      this.acceptNotifications,
      this.workerType,
      this.isFirstTimeRegister});
  factory _Employee.fromJson(Map<String, dynamic> json) =>
      _$EmployeeFromJson(json);

  @override
  final String? id;
  @override
  final String? name;
  @override
  final String? ar_name;
  @override
  final String? en_name;
  @override
  final String? phoneNumber;
  @override
  final String? merchantId;
  @override
  final String? imageUrl;
  @override
  final String? imageId;
  @override
  final String? branchId;
  @override
  final bool? acceptNotifications;
  @override
  final WorkerType? workerType;
  @override
  final bool? isFirstTimeRegister;

  /// Create a copy of Employee
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$EmployeeCopyWith<_Employee> get copyWith =>
      __$EmployeeCopyWithImpl<_Employee>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$EmployeeToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Employee &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.ar_name, ar_name) || other.ar_name == ar_name) &&
            (identical(other.en_name, en_name) || other.en_name == en_name) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.merchantId, merchantId) ||
                other.merchantId == merchantId) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.imageId, imageId) || other.imageId == imageId) &&
            (identical(other.branchId, branchId) ||
                other.branchId == branchId) &&
            (identical(other.acceptNotifications, acceptNotifications) ||
                other.acceptNotifications == acceptNotifications) &&
            (identical(other.workerType, workerType) ||
                other.workerType == workerType) &&
            (identical(other.isFirstTimeRegister, isFirstTimeRegister) ||
                other.isFirstTimeRegister == isFirstTimeRegister));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      ar_name,
      en_name,
      phoneNumber,
      merchantId,
      imageUrl,
      imageId,
      branchId,
      acceptNotifications,
      workerType,
      isFirstTimeRegister);

  @override
  String toString() {
    return 'Employee(id: $id, name: $name, ar_name: $ar_name, en_name: $en_name, phoneNumber: $phoneNumber, merchantId: $merchantId, imageUrl: $imageUrl, imageId: $imageId, branchId: $branchId, acceptNotifications: $acceptNotifications, workerType: $workerType, isFirstTimeRegister: $isFirstTimeRegister)';
  }
}

/// @nodoc
abstract mixin class _$EmployeeCopyWith<$Res>
    implements $EmployeeCopyWith<$Res> {
  factory _$EmployeeCopyWith(_Employee value, $Res Function(_Employee) _then) =
      __$EmployeeCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? id,
      String? name,
      String? ar_name,
      String? en_name,
      String? phoneNumber,
      String? merchantId,
      String? imageUrl,
      String? imageId,
      String? branchId,
      bool? acceptNotifications,
      WorkerType? workerType,
      bool? isFirstTimeRegister});
}

/// @nodoc
class __$EmployeeCopyWithImpl<$Res> implements _$EmployeeCopyWith<$Res> {
  __$EmployeeCopyWithImpl(this._self, this._then);

  final _Employee _self;
  final $Res Function(_Employee) _then;

  /// Create a copy of Employee
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? ar_name = freezed,
    Object? en_name = freezed,
    Object? phoneNumber = freezed,
    Object? merchantId = freezed,
    Object? imageUrl = freezed,
    Object? imageId = freezed,
    Object? branchId = freezed,
    Object? acceptNotifications = freezed,
    Object? workerType = freezed,
    Object? isFirstTimeRegister = freezed,
  }) {
    return _then(_Employee(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      ar_name: freezed == ar_name
          ? _self.ar_name
          : ar_name // ignore: cast_nullable_to_non_nullable
              as String?,
      en_name: freezed == en_name
          ? _self.en_name
          : en_name // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _self.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      merchantId: freezed == merchantId
          ? _self.merchantId
          : merchantId // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _self.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      imageId: freezed == imageId
          ? _self.imageId
          : imageId // ignore: cast_nullable_to_non_nullable
              as String?,
      branchId: freezed == branchId
          ? _self.branchId
          : branchId // ignore: cast_nullable_to_non_nullable
              as String?,
      acceptNotifications: freezed == acceptNotifications
          ? _self.acceptNotifications
          : acceptNotifications // ignore: cast_nullable_to_non_nullable
              as bool?,
      workerType: freezed == workerType
          ? _self.workerType
          : workerType // ignore: cast_nullable_to_non_nullable
              as WorkerType?,
      isFirstTimeRegister: freezed == isFirstTimeRegister
          ? _self.isFirstTimeRegister
          : isFirstTimeRegister // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

// dart format on
