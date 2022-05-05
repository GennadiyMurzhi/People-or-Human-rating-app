import 'package:injectable/injectable.dart';
import 'package:people_rating_app/domain/contacts/contacts.dart';
import 'package:people_rating_app/domain/contacts/i_contacts_local_data_source.dart';
import 'package:people_rating_app/domain/core/i_database_vendor.dart';
import 'package:people_rating_app/infrastructure/core/local_data_source_error_handler_mixin.dart';
import 'package:sqflite/sqflite.dart';

@Injectable(as: IContactsLocalDataSource)
class ContactsLocalDataSource with LocalDataSourceErrorHandlerMixin<UpdatedContacts> implements IContactsLocalDataSource {
  final IDatabaseVendor _databaseVendor;

  ContactsLocalDataSource(this._databaseVendor);

  @override
  Future<void> cacheContacts(UpdatedContacts updatedContacts) async {
    await _databaseVendor.initDatabase();

    cacheErrorHandler(methodJob: () async {
      final countContactsInTable =
          Sqflite.firstIntValue(await _databaseVendor.database!.rawQuery('SELECT COUNT(*) FROM Contact'));

      for (int i = 0; i <= updatedContacts.contacts.length - 1; i++) {
        await _databaseVendor.database!.transaction((txn) async {
          await txn.rawInsert('INSERT INTO Contact(name, registered) VALUES(${updatedContacts.contacts[i].name}, ' +
              (updatedContacts.contacts[i].isServerUser ? '1' : '0') +
              ' )');
          for (int k = 0; k <= updatedContacts.contacts[i].phones.length - 1; k++) {
            await txn.rawInsert(
                'INSERT INTO PhoneNumber(contact_id, phone) VALUES(${i + countContactsInTable! + 1}, ${updatedContacts.contacts[i].phones[k]})');
          }
        });
      }
    });
  }

  @override
  Future<UpdatedContacts> getCashedContacts() async {
    await _databaseVendor.initDatabase();

    List<Map<String, Object?>> cachedContactsMap = [];

    return await getFromCacheErrorHandler(
      query: 'Select name, phone, registered FROM Contact INNER JOIN PhoneNumber Using(contact_id)',
      database: _databaseVendor.database!,
      selectableObjects: cachedContactsMap,
      messageNoInfoCache: 'no contacts in the cache ',
      methodJob: () {
        List<UpdatedContact> contacts = List.empty(growable: true);

        while (cachedContactsMap.isNotEmpty) {
          final name = cachedContactsMap[0]['name'] as String;
          final allMapsByName =
              cachedContactsMap.where((element) => element['name'] == name) as List<Map<String, Object>>;
          final isServerUser = cachedContactsMap[0]['registered'] as int;

          contacts.add(UpdatedContact(
            name: name,
            phones: List.generate(allMapsByName.length, (index) => allMapsByName[index]['name'] as String),
            isServerUser: isServerUser == 1 ? true : false,
          ));

          cachedContactsMap.removeWhere((element) => element['name'] == name);
        }

        return UpdatedContacts(
          contacts: contacts,
        );
      },
    );
  }
}
