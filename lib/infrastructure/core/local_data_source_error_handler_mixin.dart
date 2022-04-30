import 'package:people_rating_app/domain/core/errors.dart';
import 'package:sqflite/sqflite.dart';

class LocalDataSourceErrorHandlerMixin<T> {
  Future<void> cacheErrorHandler({
    required Future<void> Function() methodJob,
  }) async {
    try {
      await methodJob();
    } on DatabaseException catch (e) {
      throw _cacheErrorStatus0(e);
    }
  }

  Future<T> getFromCacheErrorHandler({
    required String query,
    required Database database,
    required List<Map<String, Object?>> selectableObjects,
    required String messageNoInfoCache,
    required T Function() methodJob,
  }) async {
    selectableObjects = await database.rawQuery(query);

    try {
      if (selectableObjects.isNotEmpty) {
        return methodJob();
      } else {
        throw CacheError(
          statusCode: 1,
          message: messageNoInfoCache,
        );
      }
    } on DatabaseException catch (e) {
      throw _cacheErrorStatus0(e);
    }
  }

  CacheError _cacheErrorStatus0(DatabaseException e) => CacheError(
        statusCode: 0,
        message: e.toString(),
      );
}
