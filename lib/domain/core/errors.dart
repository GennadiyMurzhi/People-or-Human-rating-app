import 'dart:developer';

class ServerError implements Exception {
  final int statusCode;

  ServerError({
    required this.statusCode,
  }) {
    log(toString());
  }

  @override
  String toString() {
    return 'Response status code: $statusCode';
  }
}

class NoInternetConnectionError implements Exception {}

class CacheError implements Exception {
  final int statusCode;
  final String message;

  ///statusCode can be
  ///
  ///0 - database error
  ///
  ///1 - there is no request information in the cache
  CacheError({
    required this.statusCode,
    required this.message,
  }) {
    log(toString());
  }

  @override
  String toString() {
    if (statusCode == 0) {
      return 'CacheError status code: 0 database error: $message\n\n\n';
    } else {
      return 'CacheError status code: 1 there is no request information in the cache: $message\n\n\n';
    }
  }
}
