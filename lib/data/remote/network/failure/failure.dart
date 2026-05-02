class Failure {
  const Failure(
      {required this.methodName,
      required this.userMessage,
      this.currentClass,
      this.technicalMessage,
      this.exception,
      this.stackTrace,
      this.shouldShowToast = true,
      this.statusCode});

  final String methodName;
  final String userMessage;
  final Object? currentClass;
  final String? technicalMessage;
  final Object? exception;
  final Object? stackTrace;
  final bool shouldShowToast;
  final int? statusCode;

  @override
  String toString() {
    return '''
    Failure: {
      methodName: $methodName,
      message: $userMessage,
      className: ${currentClass.runtimeType},
      exception: $exception,
      stacktrace: $stackTrace,
    }
''';
  }
}
