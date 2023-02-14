class AppException implements Exception {
  final String message;
  final int? code;
  AppException({required this.message, this.code});

  @override
  String toString() {
    return message;
  }
}