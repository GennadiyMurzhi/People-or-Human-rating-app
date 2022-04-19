import 'package:injectable/injectable.dart';
import 'package:people_rating_app/domain/contacts/contacts.dart';
import 'package:people_rating_app/domain/contacts/i_contacts_local_data_source.dart';

@Injectable(as: IContactsLocalDataSource)
class ContactsLocalDataSource implements IContactsLocalDataSource{

  @override
  Future<void> cacheContacts(Contacts contactsOfRegisteredUsers, Contacts contactsOfUnregisteredUsers) {
    // TODO: implement cacheContacts
    throw UnimplementedError();
  }

  @override
  Future<Map<String, Contacts>> getCashedContacts() {
    // TODO: implement getCashedContacts
    throw UnimplementedError();
  }

}