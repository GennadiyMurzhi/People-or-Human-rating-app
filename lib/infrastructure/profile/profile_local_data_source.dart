import 'package:injectable/injectable.dart';
import 'package:people_rating_app/domain/core/errors.dart';
import 'package:people_rating_app/domain/core/i_database_vendor.dart';
import 'package:people_rating_app/domain/profile/i_profile_local_data_source.dart';
import 'package:people_rating_app/domain/profile/profile.dart';
import 'package:sqflite/sqflite.dart';

@Injectable(as: IProfileLocalDataSource)
class ProfileLocalDataSource extends IProfileLocalDataSource {
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

    final List<Map<String, Object?>> profileInfoMap;

    final List<Map<String, Object?>> profileSkills;
    try {
      profileInfoMap = await _databaseVendor.database!.rawQuery('Select * FROM Profile');
      profileSkills =
          await _databaseVendor.database!.rawQuery('Select skill_name, skill_average_evaluations FROM skill');

      if (profileInfoMap.isNotEmpty) {
        return Profile(
          userName: profileInfoMap[0]['user_name'] as String,
          averageRating: profileInfoMap[0]['average_rating'] as double,
          userEvaluationsCount: profileInfoMap[0]['user_evaluations_count'] as int,
          skills: Skills(
            skills: List.generate(
              profileSkills.length,
              (index) => Skill(
                skillName: profileSkills[index]['skill_name'] as String,
                skillAverageEvaluations: profileSkills[index]['skill_average_evaluations'] as double,
              ),
            ),
          ),
        );
      } else {
        throw CacheError(
          statusCode: 1,
          message: 'profileInfo is empty',
        );
      }
    } on DatabaseException {
      throw CacheError(
        statusCode: 0,
        message: 'Database Exception',
      );
    }
  }
}
