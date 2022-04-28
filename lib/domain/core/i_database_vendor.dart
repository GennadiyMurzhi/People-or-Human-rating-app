import 'package:sqflite/sqlite_api.dart';

abstract class IDatabaseVendor {
  Database? get database;

  Future<void> initDatabase();
}
