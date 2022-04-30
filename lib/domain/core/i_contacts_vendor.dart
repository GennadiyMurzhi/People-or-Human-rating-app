import 'package:people_rating_app/domain/contacts/contacts.dart';

abstract class IContactsVendor {
  Future<void> request();

  Future<PhoneContacts> getContacts();

  Future<bool> get isGranted;
}
