class ServerError extends Error{
  final int statusCode;

  ServerError(this.statusCode);

  @override
  String toString(){
    return Error.safeToString('Response status code: $statusCode ');
  }
}

class CacheError extends Error{}