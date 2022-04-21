class ServerError implements Exception{
  final int statusCode;

  ServerError({required this.statusCode});

  @override
  String toString(){
    return Error.safeToString('Response status code: $statusCode ');
  }
}

class NoInternetConnectionError implements Exception{}

class CacheError implements Exception{}