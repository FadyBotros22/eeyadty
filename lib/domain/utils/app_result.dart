/// Generic result wrapper for repository return values.
class AppResult<T> {
  final T? data;
  final String? error;

  const AppResult._({this.data, this.error});

  factory AppResult.success(T data) => AppResult._(data: data);
  factory AppResult.failure(String error) => AppResult._(error: error);

  bool get isSuccess => error == null;
  bool get isFailure => error != null;
}
