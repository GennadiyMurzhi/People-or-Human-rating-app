import 'package:people_rating_app/domain/contacts/contacts.dart';

abstract class IContactsLocalDataSource {
  Future<void> cacheContacts(UpdatedContacts checkedContacts);

  Future<UpdatedContacts> getCashedContacts();
}
