import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../../../../app_config.dart';
import '../../../../domain/di/app_context.dart';
import '../../../../domain/di/dependency_injection.dart';
import '../../../../presentation/feature_auth/bloc/auth_bloc.dart';
import '../../../../presentation/feature_auth/bloc/auth_event.dart';
import '../../../../presentation/feature_auth/login_screen.dart';
import '../../../preferences/user_preferences.dart';
import '../../models/requests/extend_token_request/extend_token_request.dart';
import '../../models/responses/extend_token_response/extend_token_response.dart';
import '../../network_constants.dart';
import '../../services/auth_service/auth_service.dart';
import '../api_response/api_response.dart';
import '../failure/failure.dart';
import '../failure/failure_bloc.dart';

class TokenInterceptor extends Interceptor {
  final UserPreferences _userPreferences;
  late AuthService _authService;
  final FailureBloc _failureBloc;
  bool isRefreshing = false;
  TokenInterceptor(this._userPreferences, this._failureBloc);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (_requireToken(options.path)) {
      options.headers[HeaderConstants.authorization] =
          _userPreferences.accessToken;
    }
    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      if (_userPreferences.accessToken.isEmpty) {
        _handleLogout();
        handler.reject(err);
        return; // Stop further processing after logout
      }

      if (!isRefreshing) {
        isRefreshing = true;
        try {
          _authService = AuthService(getIt<Dio>());
          ApiResponse<ExtendTokenResponse> response =
              await _authService.extendToken(ExtendTokenRequest(
                  accessToken: _userPreferences.accessToken,
                  refreshToken: _userPreferences.refreshToken));
          if (response.meta.status == 401) {
            _handleLogout();
            handler.reject(err);
            return;
          } else {
            // Successfully refreshed token, retry the original request
            _userPreferences.accessToken = response.data?.device?.accessToken ?? '';
            _userPreferences.refreshToken = response.data?.device?.refreshToken ?? '';

            // Retry the failed request with new tokens
            final newRequest = await _retryRequest(err.requestOptions);
            handler.resolve(newRequest);
          }
        } catch (ex) {
          _failureBloc.add(const FailureEvent.showFailure(Failure(
              methodName: 'Refresh Token', userMessage: 'Unauthenticated')));
          _handleLogout();
          return;
        } finally {
          isRefreshing = false;
        }
      } else {
        handler.next(err);
      }
    } else {
      handler.next(err);
    }
  }

  Future<Response<dynamic>> _retryRequest(RequestOptions requestOptions) async {
    final dio = getIt<Dio>(); // Get a new Dio instance or the existing one
    requestOptions.headers[HeaderConstants.authorization] =
        _userPreferences.accessToken;
    return await dio.fetch(requestOptions);
  }

  void _handleLogout() {
    // Trigger the logout event
    getIt<AuthBloc>().add(const AuthEvent.logout());

    // Navigate to the login screen, ensuring the context is not null
    if (NavigationService.navigatorKey.currentContext != null) {
      Navigator.of(NavigationService.navigatorKey.currentContext!)
          .pushNamedAndRemoveUntil(LoginScreen.route, (route) => false);
    }
  }

  static bool _requireToken(String url) {
    String path = url.replaceAll(AppConfig.shared.baseUrl, '');
    return ![
      AuthConstants.createGuestUser,
      AuthConstants.extendToken,
      AuthConstants.verifyOtp,
      AuthConstants.googleSignIn,
      AuthConstants.appleSignIn,
      AuthConstants.sendOtp
    ].contains(path);
  }
}
