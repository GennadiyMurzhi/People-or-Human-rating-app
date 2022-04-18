import 'package:dartz/dartz.dart';
import 'package:people_rating_app/domain/contacts/contacts.dart';
import 'package:people_rating_app/domain/contacts/contacts_failure.dart';

abstract class IContactsRepository{
  Future<Either<ContactsFailure, Contacts>> getContactsFromPhone();
}
