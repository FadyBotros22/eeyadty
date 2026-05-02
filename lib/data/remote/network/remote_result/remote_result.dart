
import '../failure/failure.dart';

class RemoteResult<T> {
  final ApiStatus status;
  final T? data;
  final Failure? error;

  bool get isSuccess => status == ApiStatus.success;

  RemoteResult({required this.status, this.data, this.error});

  factory RemoteResult.successState(T data) =>
      RemoteResult(status: ApiStatus.success, data: data, error: null);

  factory RemoteResult.errorState(Failure error) =>
      RemoteResult(status: ApiStatus.error, data: null, error: error);
}

enum ApiStatus { success, error, loading }

class ResultError {
// val type: ErrorHandler.ErrorType,
  final String? message;

  ResultError({required this.message});
}
