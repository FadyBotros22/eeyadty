import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../domain/models/user/client_user.dart';

enum UserLoggingState { loggedIn, firstLaunch, notRegistered }

class UserPreferences {
  final SharedPreferences _preferences;

  UserPreferences(this._preferences);

  // ─── Auth tokens ──────────────────────────────────────────────────────────
  String get accessToken => _preferences.getString(_kAccessToken) ?? '';
  set accessToken(String v) => _preferences.setString(_kAccessToken, v);

  String get refreshToken => _preferences.getString(_kRefreshToken) ?? '';
  set refreshToken(String v) => _preferences.setString(_kRefreshToken, v);

  // ─── User state ───────────────────────────────────────────────────────────
  bool get isFirstLaunch => _preferences.getBool(_kFirstLaunch) ?? true;
  set isFirstLaunch(bool v) => _preferences.setBool(_kFirstLaunch, v);

  bool get isUserRegistered => _preferences.getBool(_kIsRegistered) ?? false;
  set isUserRegistered(bool v) => _preferences.setBool(_kIsRegistered, v);

  // ─── Persona ──────────────────────────────────────────────────────────────
  /// 'client' | 'doctor' | ''
  String get selectedPersona => _preferences.getString(_kPersona) ?? '';
  set selectedPersona(String v) => _preferences.setString(_kPersona, v);

  // ─── User data ────────────────────────────────────────────────────────────
  ClientUser get currentUser {
    final encoded = _preferences.getString(_kUser) ?? '';
    if (encoded.isEmpty) return ClientUser.empty();
    try {
      return ClientUser.fromJson(jsonDecode(encoded));
    } catch (_) {
      return ClientUser.empty();
    }
  }

  set currentUser(ClientUser? user) {
    if (user != null) {
      _preferences.setString(_kUser, jsonEncode(user.toJson()));
    }
  }

  // ─── Login check ──────────────────────────────────────────────────────────
  Future<UserLoggingState> checkUserIfLoggedIn() async {
    await Future.delayed(const Duration(milliseconds: 800));
    if (accessToken.isEmpty && isFirstLaunch) {
      return UserLoggingState.firstLaunch;
    }
    if (isUserRegistered) {
      return UserLoggingState.loggedIn;
    }
    return UserLoggingState.notRegistered;
  }

  void logout() {
    accessToken = '';
    refreshToken = '';
    isFirstLaunch = true;
    isUserRegistered = false;
    selectedPersona = '';
    _preferences.remove(_kUser);
  }

  // ─── Keys ─────────────────────────────────────────────────────────────────
  static const _kAccessToken = 'ACCESS_TOKEN';
  static const _kRefreshToken = 'REFRESH_TOKEN';
  static const _kFirstLaunch = 'FIRST_LAUNCH';
  static const _kIsRegistered = 'IS_REGISTERED';
  static const _kPersona = 'SELECTED_PERSONA';
  static const _kUser = 'CURRENT_USER';
}
