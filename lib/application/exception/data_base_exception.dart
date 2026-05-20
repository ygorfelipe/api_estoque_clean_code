class DataBaseException implements Exception {
  String? message;
  Exception? exception;
  DataBaseException({
    this.message,
    this.exception,
  });

  @override
  String toString() =>
      'DataBaseException(message: $message, exception: $exception)';
}
