import 'package:people_rating_app/domain/contacts/contacts.dart';

abstract class IContactsRemoteDataSource {
  Future<UpdatedContacts> updateContactsOnServer(PhoneContacts contactsFromPhone);
}
