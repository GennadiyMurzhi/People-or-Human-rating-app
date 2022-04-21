import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

@freezed
abstract class ServerFailure with _$ServerFailure {
  const factory ServerFailure.serverError({
    required int statusCode,
  }) = ServerError;
  const factory ServerFailure.noInternetConnection() = NoInternetConnection;
}

@freezed
abstract class CacheFailure with _$CacheFailure {
  const factory CacheFailure.cacheError() = CacheError;
  const factory CacheFailure.noDataFound() = NoDataFound;
}