import 'dart:io';


import '../../../domain/models/device/device.dart';
import '../../../domain/models/device_signup/device_signup.dart';
import '../../../domain/models/enums/os.dart';
import '../../../domain/models/verify_otp/verify_otp.dart';
import '../../../domain/notifications/fcm_token_manager.dart';
import '../../../domain/repositories/auth_repository.dart';
import '../../preferences/user_preferences.dart';
import '../models/requests/send_otp_request/send_otp_request.dart';
import '../network/api_response/api_response.dart';
import '../network/remote_result/remote_result.dart';
import '../services/auth_service/auth_service.dart';
import 'base_repository.dart';

class AuthRepositoryImpl extends BaseRepository implements AuthRepository {
  final UserPreferences _userPreferences;
  final AuthService _authService;

  AuthRepositoryImpl(this._userPreferences, this._authService);
  @override
  Future<RemoteResult> sendOtp({required String phoneNumber}) async {
    return makeApiCall(() async {
      SendOtpRequest sendOtpRequest = SendOtpRequest(phoneNumber: phoneNumber);

      ApiResponse<dynamic> response =
          await _authService.sendOtp(sendOtpRequest);
      return response.data;
    });
  }
}
