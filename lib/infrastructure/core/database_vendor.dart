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
        await db.execute('CREATE TABLE Contact (contact_id INTEGER PRIMARY KEY, name TEXT, registered BOOLEAN)');
        await db
            .execute('CREATE TABLE PhoneNumber (phone_number_id INTEGER PRIMARY KEY, contact_id INTEGER, phone TEXT)');
      });
    }
  }

  @override
  Database? get database => _database;
}
