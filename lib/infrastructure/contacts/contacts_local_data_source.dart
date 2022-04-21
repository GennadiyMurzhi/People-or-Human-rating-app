import 'package:injectable/injectable.dart';
import 'package:people_rating_app/domain/contacts/contacts.dart';
import 'package:people_rating_app/domain/contacts/i_contacts_local_data_source.dart';
import 'package:people_rating_app/domain/core/i_database_vendor.dart';

@Injectable(as: IContactsLocalDataSource)
class ContactsLocalDataSource implements IContactsLocalDataSource{
  final IDatabaseVendor _databaseVendor;

  ContactsLocalDataSource(this._databaseVendor);

  @override
  Future<void> cacheContacts(Contacts contactsOfRegisteredUsers, Contacts contactsOfUnregisteredUsers) async {
    return await _databaseVendor.cacheContacts(contactsOfRegisteredUsers, contactsOfUnregisteredUsers);
  }

  @override
  Future<Map<String, Contacts>> getCashedContacts() async {
    return await _databaseVendor.getCachedContacts();
  }

}