import 'package:people_rating_app/domain/profile/profile.dart';

abstract class IProfileRemoteDataSource {
  Future<Profile> getProfileInfoFromServer(String phoneNumberId);
}