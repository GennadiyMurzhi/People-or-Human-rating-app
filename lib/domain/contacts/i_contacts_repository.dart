import 'package:dartz/dartz.dart';
import 'package:people_rating_app/domain/contacts/contacts.dart';
import 'package:people_rating_app/domain/contacts/contacts_failure.dart';
import 'package:people_rating_app/domain/core/failures.dart';

abstract class IContactsRepository {
  Future<Either<ContactsFailure, PhoneContacts>> getContactsFromPhone();

  Future<Either<ServerFailure, UpdatedContacts>> updateContactsOnServer(PhoneContacts contactsFromPhone);

  Future<Either<CacheFailure, UpdatedContacts>> getCashedContacts();

  Future<bool> get isContactAccess;
}
