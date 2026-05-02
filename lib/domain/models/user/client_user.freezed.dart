// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'client_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ClientUser {
  String? get id;
  String? get email;
  String? get fullName;
  String? get phoneNumber;
  String? get avatarUrl;
  String? get dateOfBirth;
  String? get gender;
  @UserRoleConverter()
  UserRole get role;

  /// Create a copy of ClientUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ClientUserCopyWith<ClientUser> get copyWith =>
      _$ClientUserCopyWithImpl<ClientUser>(this as ClientUser, _$identity);

  /// Serializes this ClientUser to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ClientUser &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl) &&
            (identical(other.dateOfBirth, dateOfBirth) ||
                other.dateOfBirth == dateOfBirth) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.role, role) || other.role == role));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, email, fullName, phoneNumber,
      avatarUrl, dateOfBirth, gender, role);

  @override
  String toString() {
    return 'ClientUser(id: $id, email: $email, fullName: $fullName, phoneNumber: $phoneNumber, avatarUrl: $avatarUrl, dateOfBirth: $dateOfBirth, gender: $gender, role: $role)';
  }
}

/// @nodoc
abstract mixin class $ClientUserCopyWith<$Res> {
  factory $ClientUserCopyWith(
          ClientUser value, $Res Function(ClientUser) _then) =
      _$ClientUserCopyWithImpl;
  @useResult
  $Res call(
      {String? id,
      String? email,
      String? fullName,
      String? phoneNumber,
      String? avatarUrl,
      String? dateOfBirth,
      String? gender,
      @UserRoleConverter() UserRole role});
}

/// @nodoc
class _$ClientUserCopyWithImpl<$Res> implements $ClientUserCopyWith<$Res> {
  _$ClientUserCopyWithImpl(this._self, this._then);

  final ClientUser _self;
  final $Res Function(ClientUser) _then;

  /// Create a copy of ClientUser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? email = freezed,
    Object? fullName = freezed,
    Object? phoneNumber = freezed,
    Object? avatarUrl = freezed,
    Object? dateOfBirth = freezed,
    Object? gender = freezed,
    Object? role = null,
  }) {
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      fullName: freezed == fullName
          ? _self.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _self.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      avatarUrl: freezed == avatarUrl
          ? _self.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      dateOfBirth: freezed == dateOfBirth
          ? _self.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _self.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      role: null == role
          ? _self.role
          : role // ignore: cast_nullable_to_non_nullable
              as UserRole,
    ));
  }
}

/// Adds pattern-matching-related methods to [ClientUser].
extension ClientUserPatterns on ClientUser {
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
    TResult Function(_ClientUser value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ClientUser() when $default != null:
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
    TResult Function(_ClientUser value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ClientUser():
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
    TResult? Function(_ClientUser value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ClientUser() when $default != null:
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
            String? email,
            String? fullName,
            String? phoneNumber,
            String? avatarUrl,
            String? dateOfBirth,
            String? gender,
            @UserRoleConverter() UserRole role)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ClientUser() when $default != null:
        return $default(
            _that.id,
            _that.email,
            _that.fullName,
            _that.phoneNumber,
            _that.avatarUrl,
            _that.dateOfBirth,
            _that.gender,
            _that.role);
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
            String? email,
            String? fullName,
            String? phoneNumber,
            String? avatarUrl,
            String? dateOfBirth,
            String? gender,
            @UserRoleConverter() UserRole role)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ClientUser():
        return $default(
            _that.id,
            _that.email,
            _that.fullName,
            _that.phoneNumber,
            _that.avatarUrl,
            _that.dateOfBirth,
            _that.gender,
            _that.role);
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
            String? email,
            String? fullName,
            String? phoneNumber,
            String? avatarUrl,
            String? dateOfBirth,
            String? gender,
            @UserRoleConverter() UserRole role)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ClientUser() when $default != null:
        return $default(
            _that.id,
            _that.email,
            _that.fullName,
            _that.phoneNumber,
            _that.avatarUrl,
            _that.dateOfBirth,
            _that.gender,
            _that.role);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ClientUser implements ClientUser {
  const _ClientUser(
      {this.id,
      this.email,
      this.fullName,
      this.phoneNumber,
      this.avatarUrl,
      this.dateOfBirth,
      this.gender,
      @UserRoleConverter() this.role = UserRole.patient});
  factory _ClientUser.fromJson(Map<String, dynamic> json) =>
      _$ClientUserFromJson(json);

  @override
  final String? id;
  @override
  final String? email;
  @override
  final String? fullName;
  @override
  final String? phoneNumber;
  @override
  final String? avatarUrl;
  @override
  final String? dateOfBirth;
  @override
  final String? gender;
  @override
  @JsonKey()
  @UserRoleConverter()
  final UserRole role;

  /// Create a copy of ClientUser
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ClientUserCopyWith<_ClientUser> get copyWith =>
      __$ClientUserCopyWithImpl<_ClientUser>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ClientUserToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ClientUser &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl) &&
            (identical(other.dateOfBirth, dateOfBirth) ||
                other.dateOfBirth == dateOfBirth) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.role, role) || other.role == role));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, email, fullName, phoneNumber,
      avatarUrl, dateOfBirth, gender, role);

  @override
  String toString() {
    return 'ClientUser(id: $id, email: $email, fullName: $fullName, phoneNumber: $phoneNumber, avatarUrl: $avatarUrl, dateOfBirth: $dateOfBirth, gender: $gender, role: $role)';
  }
}

/// @nodoc
abstract mixin class _$ClientUserCopyWith<$Res>
    implements $ClientUserCopyWith<$Res> {
  factory _$ClientUserCopyWith(
          _ClientUser value, $Res Function(_ClientUser) _then) =
      __$ClientUserCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? id,
      String? email,
      String? fullName,
      String? phoneNumber,
      String? avatarUrl,
      String? dateOfBirth,
      String? gender,
      @UserRoleConverter() UserRole role});
}

/// @nodoc
class __$ClientUserCopyWithImpl<$Res> implements _$ClientUserCopyWith<$Res> {
  __$ClientUserCopyWithImpl(this._self, this._then);

  final _ClientUser _self;
  final $Res Function(_ClientUser) _then;

  /// Create a copy of ClientUser
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? email = freezed,
    Object? fullName = freezed,
    Object? phoneNumber = freezed,
    Object? avatarUrl = freezed,
    Object? dateOfBirth = freezed,
    Object? gender = freezed,
    Object? role = null,
  }) {
    return _then(_ClientUser(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      fullName: freezed == fullName
          ? _self.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _self.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      avatarUrl: freezed == avatarUrl
          ? _self.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      dateOfBirth: freezed == dateOfBirth
          ? _self.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _self.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      role: null == role
          ? _self.role
          : role // ignore: cast_nullable_to_non_nullable
              as UserRole,
    ));
  }
}

// dart format on
