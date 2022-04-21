import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:people_rating_app/domain/contacts/contacts.dart';
import 'package:people_rating_app/domain/contacts/contacts_failure.dart';
import 'package:people_rating_app/domain/contacts/i_contacts_local_data_source.dart';
import 'package:people_rating_app/domain/contacts/i_contacts_remote_data_sorce.dart';
import 'package:people_rating_app/domain/contacts/i_contacts_repository.dart';
import 'package:people_rating_app/domain/core/failures.dart';
import 'package:people_rating_app/domain/core/errors.dart' as errors;
import 'package:people_rating_app/infrastructure/core/contacts_vendor.dart';

@Injectable()
class ContactsRepository implements IContactsRepository {
  final ContactsVendor _contactsVendor;
  final IContactsRemoteDataSource _contactsRemoteDataSource;
  final IContactsLocalDataSource _contactsLocalDataSource;

  ContactsRepository(this._contactsVendor, this._contactsRemoteDataSource, this._contactsLocalDataSource);

  @override
  Future<Either<ContactsFailure, Contacts>> getContactsFromPhone() async {
    await _contactsVendor.request();

    if (await _contactsVendor.isGranted) {
      final contactsFromPhone = await _contactsVendor.getContacts();

      return Right(contactsFromPhone);
    } else {
      return const Left(ContactsFailure.noPermissionToTakeFromPhone());
    }
  }

  ///Keys are contactsOfRegisteredUsers and contactsUnRegisteredUsers
  @override
  Future<Either<ServerFailure, Map<String, Contacts>>> compareContactsFromTheServer(Contacts contactsFromPhone) async {
    try {
      final contactsOfRegisteredUsers = await _contactsRemoteDataSource.getContactsOfRegisteredUsers(contactsFromPhone);

      final contactsOfUnregisteredUsers = Contacts(
        contacts: List<Contact>.empty(growable: true),
      );

      for (int i = 0; i <= contactsFromPhone.contacts.length - 1; i++) {
        if(!contactsFromPhone.contacts.contains(contactsOfRegisteredUsers.contacts[i])) {
          contactsOfUnregisteredUsers.contacts.add(contactsFromPhone.contacts[i]);
        }
      }

      _contactsLocalDataSource.cacheContacts(contactsOfRegisteredUsers, contactsOfUnregisteredUsers);

      return Right({
        'contactsOfRegisteredUsers': contactsOfRegisteredUsers,
        'contactsUnRegisteredUsers': contactsOfUnregisteredUsers,
      });
    } on errors.ServerError catch (e) {
      return Left(ServerFailure.serverError(statusCode: e.statusCode));
    } on errors.NoInternetConnectionError {
      return const Left(ServerFailure.noInternetConnection());
    }
  }

  @override
  Future<Either<CacheFailure, Map<String, Contacts>>> getCashedContacts() async {
    try {
      return Right(await _contactsLocalDataSource.getCashedContacts());
    } on errors.CacheError {
      return const Left(CacheFailure.cacheError());
    }
  }
}
