import 'package:dartz/dartz.dart';
import 'package:people_rating_app/domain/auth/user.dart';
import 'package:people_rating_app/domain/core/failures.dart';
import 'package:people_rating_app/domain/core/errors.dart' as errors;
import 'package:people_rating_app/domain/profile/i_profile_local_data_source.dart';
import 'package:people_rating_app/domain/profile/i_profile_remote_data_source.dart';
import 'package:people_rating_app/domain/profile/i_profile_repository.dart';
import 'package:people_rating_app/domain/profile/profile.dart';

class ProfileRepository extends IProfileRepository{
  final IProfileRemoteDataSource _profileRemoteDataSource;
  final IProfileLocalDataSource _profileLocalDataSource;

  ProfileRepository(this._profileRemoteDataSource, this._profileLocalDataSource);

  @override
  Future<Either<ServerFailure, Profile>> getProfileInfoFromServer(User user) async {
    try {
      return Right(await _profileRemoteDataSource.getProfileInfoFromServer(user.phoneNumberId));
    } on errors.ServerError catch(e) {
      return Left(ServerFailure.serverError(statusCode: e.statusCode));
    } on errors.NoInternetConnectionError {
      return const Left(ServerFailure.noInternetConnection());
    }
  }

  @override
  Future<Either<CacheFailure, Profile>> getCachedProfileInfo() async {
    try {
      return Right(await _profileLocalDataSource.getCashedProfileInfo());
    } on errors.CacheError{
      return const Left(CacheFailure.noDataFound());
    }
  }


}