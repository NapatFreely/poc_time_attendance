// ignore_for_file: public_member_api_docs, sort_constructors_first

class Failure implements Exception {
  final String message;
  final int? code;
  final Exception? exception;
  final StackTrace stackTrace;

  Failure({
    required this.message,
    this.code,
    this.exception,
    this.stackTrace = StackTrace.empty,
  });

  @override
  String toString() {
    return 'Failure(message: $message, code: $code, exception: $exception, stackTrace: $stackTrace)';
  }

  @override
  bool operator ==(covariant Failure other) {
    if (identical(this, other)) return true;

    return other.message == message &&
        other.code == code &&
        other.exception == exception &&
        other.stackTrace == stackTrace;
  }

  @override
  int get hashCode {
    return message.hashCode ^
        code.hashCode ^
        exception.hashCode ^
        stackTrace.hashCode;
  }
}
