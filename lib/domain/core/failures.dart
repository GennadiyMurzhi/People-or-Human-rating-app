import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

@freezed
abstract class ServerFailure with _$ServerFailure {
  const factory ServerFailure.serverError({
    required int statusCode,
  }) = ServerError;
}

@freezed
abstract class CacheFailure with _$CacheFailure {
  const factory CacheFailure.cacheError() = CacheError;
}