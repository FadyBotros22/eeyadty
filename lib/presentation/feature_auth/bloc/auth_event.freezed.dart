// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AuthEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is AuthEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AuthEvent()';
  }
}

/// @nodoc
class $AuthEventCopyWith<$Res> {
  $AuthEventCopyWith(AuthEvent _, $Res Function(AuthEvent) __);
}

/// Adds pattern-matching-related methods to [AuthEvent].
extension AuthEventPatterns on AuthEvent {
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
    TResult Function(AuthSignIn value)? signIn,
    TResult Function(AuthSignUp value)? signUp,
    TResult Function(AuthSignOut value)? signOut,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case AuthSignIn() when signIn != null:
        return signIn(_that);
      case AuthSignUp() when signUp != null:
        return signUp(_that);
      case AuthSignOut() when signOut != null:
        return signOut(_that);
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
    required TResult Function(AuthSignIn value) signIn,
    required TResult Function(AuthSignUp value) signUp,
    required TResult Function(AuthSignOut value) signOut,
  }) {
    final _that = this;
    switch (_that) {
      case AuthSignIn():
        return signIn(_that);
      case AuthSignUp():
        return signUp(_that);
      case AuthSignOut():
        return signOut(_that);
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
    TResult? Function(AuthSignIn value)? signIn,
    TResult? Function(AuthSignUp value)? signUp,
    TResult? Function(AuthSignOut value)? signOut,
  }) {
    final _that = this;
    switch (_that) {
      case AuthSignIn() when signIn != null:
        return signIn(_that);
      case AuthSignUp() when signUp != null:
        return signUp(_that);
      case AuthSignOut() when signOut != null:
        return signOut(_that);
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
    TResult Function(String email, String password, UserRole role)? signIn,
    TResult Function(
            String email,
            String password,
            String fullName,
            UserRole role,
            String? phoneNumber,
            String? specialty,
            String? bio,
            double? consultationPrice)?
        signUp,
    TResult Function()? signOut,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case AuthSignIn() when signIn != null:
        return signIn(_that.email, _that.password, _that.role);
      case AuthSignUp() when signUp != null:
        return signUp(
            _that.email,
            _that.password,
            _that.fullName,
            _that.role,
            _that.phoneNumber,
            _that.specialty,
            _that.bio,
            _that.consultationPrice);
      case AuthSignOut() when signOut != null:
        return signOut();
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
    required TResult Function(String email, String password, UserRole role)
        signIn,
    required TResult Function(
            String email,
            String password,
            String fullName,
            UserRole role,
            String? phoneNumber,
            String? specialty,
            String? bio,
            double? consultationPrice)
        signUp,
    required TResult Function() signOut,
  }) {
    final _that = this;
    switch (_that) {
      case AuthSignIn():
        return signIn(_that.email, _that.password, _that.role);
      case AuthSignUp():
        return signUp(
            _that.email,
            _that.password,
            _that.fullName,
            _that.role,
            _that.phoneNumber,
            _that.specialty,
            _that.bio,
            _that.consultationPrice);
      case AuthSignOut():
        return signOut();
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
    TResult? Function(String email, String password, UserRole role)? signIn,
    TResult? Function(
            String email,
            String password,
            String fullName,
            UserRole role,
            String? phoneNumber,
            String? specialty,
            String? bio,
            double? consultationPrice)?
        signUp,
    TResult? Function()? signOut,
  }) {
    final _that = this;
    switch (_that) {
      case AuthSignIn() when signIn != null:
        return signIn(_that.email, _that.password, _that.role);
      case AuthSignUp() when signUp != null:
        return signUp(
            _that.email,
            _that.password,
            _that.fullName,
            _that.role,
            _that.phoneNumber,
            _that.specialty,
            _that.bio,
            _that.consultationPrice);
      case AuthSignOut() when signOut != null:
        return signOut();
      case _:
        return null;
    }
  }
}

/// @nodoc

class AuthSignIn implements AuthEvent {
  const AuthSignIn(
      {required this.email, required this.password, required this.role});

  final String email;
  final String password;
  final UserRole role;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AuthSignInCopyWith<AuthSignIn> get copyWith =>
      _$AuthSignInCopyWithImpl<AuthSignIn>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AuthSignIn &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.role, role) || other.role == role));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, password, role);

  @override
  String toString() {
    return 'AuthEvent.signIn(email: $email, password: $password, role: $role)';
  }
}

/// @nodoc
abstract mixin class $AuthSignInCopyWith<$Res>
    implements $AuthEventCopyWith<$Res> {
  factory $AuthSignInCopyWith(
          AuthSignIn value, $Res Function(AuthSignIn) _then) =
      _$AuthSignInCopyWithImpl;
  @useResult
  $Res call({String email, String password, UserRole role});
}

/// @nodoc
class _$AuthSignInCopyWithImpl<$Res> implements $AuthSignInCopyWith<$Res> {
  _$AuthSignInCopyWithImpl(this._self, this._then);

  final AuthSignIn _self;
  final $Res Function(AuthSignIn) _then;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? role = null,
  }) {
    return _then(AuthSignIn(
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _self.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _self.role
          : role // ignore: cast_nullable_to_non_nullable
              as UserRole,
    ));
  }
}

/// @nodoc

class AuthSignUp implements AuthEvent {
  const AuthSignUp(
      {required this.email,
      required this.password,
      required this.fullName,
      required this.role,
      this.phoneNumber,
      this.specialty,
      this.bio,
      this.consultationPrice});

  final String email;
  final String password;
  final String fullName;
  final UserRole role;
  final String? phoneNumber;
// Doctor-only fields
  final String? specialty;
  final String? bio;
  final double? consultationPrice;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AuthSignUpCopyWith<AuthSignUp> get copyWith =>
      _$AuthSignUpCopyWithImpl<AuthSignUp>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AuthSignUp &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.specialty, specialty) ||
                other.specialty == specialty) &&
            (identical(other.bio, bio) || other.bio == bio) &&
            (identical(other.consultationPrice, consultationPrice) ||
                other.consultationPrice == consultationPrice));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, password, fullName, role,
      phoneNumber, specialty, bio, consultationPrice);

  @override
  String toString() {
    return 'AuthEvent.signUp(email: $email, password: $password, fullName: $fullName, role: $role, phoneNumber: $phoneNumber, specialty: $specialty, bio: $bio, consultationPrice: $consultationPrice)';
  }
}

/// @nodoc
abstract mixin class $AuthSignUpCopyWith<$Res>
    implements $AuthEventCopyWith<$Res> {
  factory $AuthSignUpCopyWith(
          AuthSignUp value, $Res Function(AuthSignUp) _then) =
      _$AuthSignUpCopyWithImpl;
  @useResult
  $Res call(
      {String email,
      String password,
      String fullName,
      UserRole role,
      String? phoneNumber,
      String? specialty,
      String? bio,
      double? consultationPrice});
}

/// @nodoc
class _$AuthSignUpCopyWithImpl<$Res> implements $AuthSignUpCopyWith<$Res> {
  _$AuthSignUpCopyWithImpl(this._self, this._then);

  final AuthSignUp _self;
  final $Res Function(AuthSignUp) _then;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? fullName = null,
    Object? role = null,
    Object? phoneNumber = freezed,
    Object? specialty = freezed,
    Object? bio = freezed,
    Object? consultationPrice = freezed,
  }) {
    return _then(AuthSignUp(
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _self.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: null == fullName
          ? _self.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _self.role
          : role // ignore: cast_nullable_to_non_nullable
              as UserRole,
      phoneNumber: freezed == phoneNumber
          ? _self.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      specialty: freezed == specialty
          ? _self.specialty
          : specialty // ignore: cast_nullable_to_non_nullable
              as String?,
      bio: freezed == bio
          ? _self.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String?,
      consultationPrice: freezed == consultationPrice
          ? _self.consultationPrice
          : consultationPrice // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc

class AuthSignOut implements AuthEvent {
  const AuthSignOut();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is AuthSignOut);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AuthEvent.signOut()';
  }
}

// dart format on
