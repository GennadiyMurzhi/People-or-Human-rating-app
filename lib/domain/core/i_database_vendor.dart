import 'package:people_rating_app/domain/contacts/contacts.dart';

abstract class IDatabaseVendor {
  Future<void> cacheContacts(Contacts contactsOfRegisteredUsers, Contacts contactsOfUnregisteredUsers);
  ///Keys must be of contactsOfRegisteredUsers and contactsUnRegisteredUsers
  Future<Map<String, Contacts>> getCachedContacts(Contacts contactsOfRegisteredUsers, Contacts contactsOfUnregisteredUsers);
}