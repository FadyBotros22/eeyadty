import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../models/requests/extend_token_request/extend_token_request.dart';
import '../../models/requests/send_otp_request/send_otp_request.dart';
import '../../models/responses/extend_token_response/extend_token_response.dart';
import '../../network/api_response/api_response.dart';
import '../../network_constants.dart';

part 'auth_service.g.dart';

@RestApi()
abstract class AuthService {
  factory AuthService(Dio dio) = _AuthService;

  @POST(AuthConstants.sendOtp)
  Future<ApiResponse<dynamic>> sendOtp(@Body() SendOtpRequest sendOtpRequest);

}
