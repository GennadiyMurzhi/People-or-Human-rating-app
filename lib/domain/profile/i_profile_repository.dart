import 'package:dartz/dartz.dart';
import 'package:people_rating_app/domain/auth/user.dart';
import 'package:people_rating_app/domain/core/failures.dart';
import 'package:people_rating_app/domain/profile/profile.dart';

abstract class IProfileRepository {
  Future<Either<ServerFailure, Profile>> getProfileInfoFromServer(User user);

  Future<Either<CacheFailure, Profile>> getCachedProfileInfo();
}
