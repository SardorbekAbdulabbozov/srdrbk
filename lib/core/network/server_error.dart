class ServerError implements Exception {
  ServerError.withError({
    required String message,
    int? code,
  }) {
    _errorMessage = message;
    _errorCode = code;
  }

  int? _errorCode;

  String _errorMessage = '';

  int get errorCode => _errorCode ?? 0;

  String get message => _errorMessage;
}
