import 'package:injectable/injectable.dart';
import 'package:people_rating_app/domain/core/i_database_vendor.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

@Injectable(as: IDatabaseVendor)
class DatabaseVendor implements IDatabaseVendor {
  Database? _database;

  @override
  Future<void> initDatabase() async {
    if (_database == null) {
      final databasesPath = await getDatabasesPath();
      String path = join(databasesPath, 'app.db');
      _database = await openDatabase(path, version: 1, onCreate: (Database db, int version) async {
        await db.execute(
            'CREATE TABLE Contact (contact_id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, registered BOOLEAN)');
        await db.execute(
            'CREATE TABLE PhoneNumber (phone_number_id INTEGER PRIMARY KEY AUTOINCREMENT, contact_id INTEGER, phone TEXT)');
        await db.execute(
            'CREATE TABLE Profile (profile_id INTEGER PRIMARY KEY, user_name TEXT, photo_url TEXT, average_rating REAL,'
            'user_evaluations_count INTEGER)');
        await db.execute('CREATE TABLE skill (skill_id INTEGER PRIMARY KEY AUTOINCREMENT, skill_name TEXT, '
            'skill_average_evaluations REAL)');
      });
    }
  }

  @override
  Database? get database => _database;
}
