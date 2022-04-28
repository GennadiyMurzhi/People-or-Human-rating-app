import 'package:people_rating_app/domain/profile/profile.dart';

abstract class IProfileLocalDataSource {
  Future<Profile> getCashedProfileInfo();

  Future<void> cacheProfileInfo(Profile profile);
}
