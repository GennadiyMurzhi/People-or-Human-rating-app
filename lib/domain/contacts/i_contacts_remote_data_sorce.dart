import 'package:people_rating_app/domain/contacts/contacts.dart';

abstract class IContactsRemoteDataSource {
  Future<Contacts> getContactsOfRegisteredUsers(Contacts contactsFromPhone);
}