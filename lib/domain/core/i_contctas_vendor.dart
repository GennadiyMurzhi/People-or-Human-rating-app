import 'package:people_rating_app/domain/contacts/contacts.dart';

abstract class IContactsVendor {
  Future<void> request();
  Future<Contacts> getContacts();
  Future<bool> get isGranted;
}