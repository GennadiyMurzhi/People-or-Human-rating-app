import 'package:injectable/injectable.dart';
import 'package:people_rating_app/domain/contacts/contacts.dart';
import 'package:people_rating_app/domain/core/i_database_vendor.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

@Injectable(as: IDatabaseVendor)
class DatabaseVendor implements IDatabaseVendor {
  Database? _database;

  Future<void> _initDatabase() async {
    if(_database == null) {
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
  Future<void> cacheContacts(Contacts contactsOfRegisteredUsers, Contacts contactsOfUnregisteredUsers) async {
    await _initDatabase();

    await _insertContactsCycle(contactsOfRegisteredUsers, true);

    await _insertContactsCycle(contactsOfUnregisteredUsers, false);
  }

  @override
  Future<Map<String, Contacts>> getCachedContacts() async {
    await _initDatabase();

    final contactsOfRegisteredUsersMaps = await _database!.rawQuery(_contactRawSQLString(true));
    final contactsOfUnregisteredUsersMaps = await _database!.rawQuery(_contactRawSQLString(false));

    final contactsOfRegisteredUsers = _mapsToContacts(contactsOfRegisteredUsersMaps);
    final contactsOfUnregisteredUsers = _mapsToContacts(contactsOfUnregisteredUsersMaps);

    return {
      'contactsOfRegisteredUsers': contactsOfRegisteredUsers,
      'contactsUnRegisteredUsers': contactsOfUnregisteredUsers,
    };
  }

  Future<void> _insertContactsCycle(Contacts contacts, bool registered) async {
    final countContactsInTable = Sqflite.firstIntValue(await _database!.rawQuery('SELECT COUNT(*) FROM Contact'));

    for (int i = 0; i <= contacts.contacts.length - 1; i++) {
      await _database!.transaction((txn) async {
        await txn.rawInsert('INSERT INTO Contact(name, registered) VALUES(${contacts.contacts[i].name}, ' +
            (registered ? '1' : '0') +
            ' )');
        for (int k = 0; k <= contacts.contacts[i].phones.length - 1; k++) {
          await txn.rawInsert(
              'INSERT INTO PhoneNumber(contact_id, phone) VALUES(${i + countContactsInTable! + 1}, ${contacts.contacts[i].phones[k]})');
        }
      });
    }
  }

  String _contactRawSQLString(bool registered) =>
      'Select name, phone FROM Contact INNER JOIN PhoneNumber Using(contact_id) WHERE registered = ' +
      (registered ? '1' : '0');

  Contacts _mapsToContacts(List<Map<String, Object?>> list) {
    var contactsList = list;
    List<Contact> contacts = List.empty(growable: true);

    while (contactsList.isNotEmpty) {
      final name = contactsList[0]['name'] as String;
      final allMapsByName = contactsList.where((element) => element['name'] == name) as List<Map<String, Object>>;

      contacts.add(Contact(
        name: name,
        phones: List.generate(allMapsByName.length, (index) => allMapsByName[index]['name'] as String),
      ));

      contactsList.removeWhere((element) => element['name'] == name);
    }

    return Contacts(
      contacts: contacts,
    );
  }
}
