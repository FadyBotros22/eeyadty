import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/models/device/device.dart';
import '../../domain/models/employee/employee.dart';
import '../../domain/utils/app_logger.dart';

class UserPreferences {
  final SharedPreferences _preferences;

  UserPreferences(this._preferences);

  String get accessToken => _preferences.getString(_kAccessTokenKey) ?? '';
  set accessToken(String value) => _preferences.setString(_kAccessTokenKey, value);

  String get selectedBranchId => _preferences.getString(_kBranchIdKey) ?? '';
  set selectedBranchId(String value) => _preferences.setString(_kBranchIdKey, value);

  String get refreshToken => _preferences.getString(_kRefreshTokenKey) ?? '';
  set refreshToken(String value) => _preferences.setString(_kRefreshTokenKey, value);

  bool get isFirstLaunch => _preferences.getBool(_kisFirstLaunchKey) ?? true;
  set isFirstLaunch(bool value) => _preferences.setBool(_kisFirstLaunchKey, value);

  bool get isFirstAppOpen => _preferences.getBool(_kisFirstLAppOpenKey) ?? true;
  set isFirstAppOpen(bool value) => _preferences.setBool(_kisFirstLAppOpenKey, value);

  bool get isPhotoAccessPermanentlyDenied =>
      _preferences.getBool(_kisPermanentlyDeniedKey) ?? false;
  set isPhotoAccessPermanentlyDenied(bool value) =>
      _preferences.setBool(_kisPermanentlyDeniedKey, value);

  String get fcmToken => _preferences.getString(_kFcmTokenKey) ?? '';
  set fcmToken(String value) => _preferences.setString(_kFcmTokenKey, value);

  String? get currentLocale => _preferences.getString(_kCurrentLocale);
  set currentLocale(String? value) =>
      _preferences.setString(_kCurrentLocale, value ?? '');

  String get deviceRemoteId =>
      _preferences.getString(_kDeviceRemoteIdKey) ?? '';
  set deviceRemoteId(String value) =>
      _preferences.setString(_kDeviceRemoteIdKey, value);

  bool get isDeviceIdUpdated =>
      _preferences.getBool(_kIsDeviceIdUpdatedKey) ?? false;
  set isDeviceIdUpdated(bool value) =>
      _preferences.setBool(_kIsDeviceIdUpdatedKey, value);

  String? get lastReceivedNotificationId =>
      _preferences.getString(_kNotificationId);
  set lastReceivedNotificationId(String? value) =>
      _preferences.setString(_kNotificationId, value ?? '');

  bool get isUserRegistered =>
      _preferences.getBool(_kIsUserRegisteredKey) ?? false;
  set isUserRegistered(bool value) =>
      _preferences.setBool(_kIsUserRegisteredKey, value);

  Employee get currentUser {
    var encoded = _preferences.getString(_kUserKey) ?? '';
    var userMap = jsonDecode(encoded);
    return Employee.fromJson(userMap);
  }

  set currentUser(Employee? user) {
    if (user != null) {
      var userMap = user.toJson();
      var encoded = jsonEncode(userMap);
      _preferences.setString(_kUserKey, encoded);
    }
  }

  Device get currentDevice {
    var encoded = _preferences.getString(_kDeviceKey) ?? '';
    var deviceMap = jsonDecode(encoded);
    return Device.fromJson(deviceMap);
  }

  set currentDevice(Device? device) {
    if (device != null) {
      var deviceMap = device.toJson();
      var encoded = jsonEncode(deviceMap);
      _preferences.setString(_kDeviceKey, encoded);
    }
  }

  Future<String> get deviceId async =>
      _preferences.getString(_kDeviceId) ?? await _getDeviceId();

  Future<String> _getDeviceId() async {
    DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      const platform = MethodChannel('com.example.deviceId');
      try {
        final String androidId = await platform.invokeMethod('getAndroidId');
        logPrint("here Android ID: $androidId.");
        return androidId;
      } on PlatformException catch (e) {
        logPrint("here Failed to get Android ID: '${e.message}'.");
        return '';
      }
    } else {
      var iosInfo = await deviceInfoPlugin.iosInfo;
      return iosInfo.identifierForVendor ?? '';
    }
  }

  Future<UserLoggingState> checkUserIfLoggedIn() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    if (accessToken.isEmpty && isFirstLaunch) {
      return UserLoggingState.firstLaunch;
    } else {
      if (isUserRegistered) {
        return UserLoggingState.loggedIn;
      } else {
        return UserLoggingState.notRegistered;
      }
    }
  }

  void logout() {
    currentUser = null;
    isFirstLaunch = true;
    accessToken = '';
    refreshToken = '';
    currentDevice = null;
    isUserRegistered = false;
    fcmToken = '';
    selectedBranchId = '';
  }

  static const String _kAccessTokenKey = "ACCESS_TOKEN_KEY";
  static const String _kBranchIdKey = "BRANCH_ID_KEY";
  static const String _kRefreshTokenKey = "REFRESH_TOKEN_KEY";
  static const String _kisFirstLaunchKey = "IS_FIRST_LAUNCH";
  static const String _kisFirstLAppOpenKey = "IS_FIRST_OPEN";
  static const String _kisPermanentlyDeniedKey = "IS_PERMANENTLY_DENIED";
  static const String _kDeviceId = "DEVICE_ID";
  static const String _kUserKey = "USER_KEY";
  static const String _kDeviceKey = "DEVICE_KEY";
  static const String _kDeviceRemoteIdKey = "DEVICE_REMOTE_ID_KEY";
  static const String _kIsUserRegisteredKey = "IS_USER_REGISTERED";
  static const String _kFcmTokenKey = "FCM_TOKEN_KEY";
  static const String _kCurrentLocale = "CURRENT_LOCALE_KEY";
  static const String _kNotificationId = "NOTIFICATION_ID";
  static const String _kIsDeviceIdUpdatedKey = "IS_DEVICE_ID_UPDATED";
}

enum UserLoggingState { loggedIn, notRegistered, firstLaunch }
