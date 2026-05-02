import '../../data/remote/network/remote_result/remote_result.dart';

abstract class AuthRepository {
  Future<RemoteResult<dynamic>> sendOtp({required String phoneNumber});
}
