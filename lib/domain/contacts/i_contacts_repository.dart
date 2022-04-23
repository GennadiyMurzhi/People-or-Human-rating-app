import 'package:dartz/dartz.dart';
import 'package:people_rating_app/domain/contacts/contacts.dart';
import 'package:people_rating_app/domain/contacts/contacts_failure.dart';
import 'package:people_rating_app/domain/core/failures.dart';

abstract class IContactsRepository{
  Future<Either<ContactsFailure, Contacts>> getContactsFromPhone();
  ///Keys must be of contactsOfRegisteredUsers and contactsUnRegisteredUsers
  Future<Either<ServerFailure, Map<String, Contacts>>> compareContactsFromTheServer(Contacts contactsFromPhone);
  ///Keys are contactsOfRegisteredUsers and contactsUnRegisteredUsers
  Future<Either<CacheFailure, Map<String, Contacts>>> getCashedContacts();
  Future<bool> get isContactAccess;
}
