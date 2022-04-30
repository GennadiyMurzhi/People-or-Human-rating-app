import 'package:injectable/injectable.dart';
import 'package:people_rating_app/domain/core/i_database_vendor.dart';
import 'package:people_rating_app/domain/profile/i_profile_local_data_source.dart';
import 'package:people_rating_app/domain/profile/profile.dart';
import 'package:people_rating_app/infrastructure/core/local_data_source_error_handler_mixin.dart';

@Injectable(as: IProfileLocalDataSource)
class ProfileLocalDataSource with LocalDataSourceErrorHandlerMixin<Profile> implements IProfileLocalDataSource {
  final IDatabaseVendor _databaseVendor;

  ProfileLocalDataSource(this._databaseVendor);

  @override
  Future<void> cacheProfileInfo(Profile profile) async {
    await _databaseVendor.initDatabase();

    await _databaseVendor.database!.execute('INSERT INTO profile(profile_id, user_name, photo_url, average_rating,'
        'user_evaluations_count) VALUES(1, ${profile.userName}, ${profile.photoUrl}, ${profile.averageRating})');

    for (int i = 0; i <= profile.skills.skills.length; i++) {
      await _databaseVendor.database!.execute('INSERT INTO skill(skill_name, skill_average_evaluations)'
          'VALUES(${profile.skills.skills[i].skillName},${profile.skills.skills[i].skillAverageEvaluations})');
    }
  }

  @override
  Future<Profile> getCashedProfileInfo() async {
    await _databaseVendor.initDatabase();

    List<Map<String, Object?>> profileInfoMap = [];

    return await getFromCacheErrorHandler(
      query: 'Select profile_id, user_name, photo_url, '
          'average_rating, skill_name, skill_average_evaluations FROM Profile '
          'INNER JOIN Skill',
      database: _databaseVendor.database!,
      selectableObjects: profileInfoMap,
      messageNoInfoCache: 'profileInfo is empty',
      methodJob: () {
        return Profile(
          userName: profileInfoMap[0]['user_name'] as String,
          averageRating: profileInfoMap[0]['average_rating'] as double,
          userEvaluationsCount: profileInfoMap[0]['user_evaluations_count'] as int,
          skills: Skills(
            skills: List.generate(
              profileInfoMap.length,
              (index) => Skill(
                skillName: profileInfoMap[index]['skill_name'] as String,
                skillAverageEvaluations: profileInfoMap[index]['skill_average_evaluations'] as double,
              ),
            ),
          ),
        );
      },
    );
  }
}
