import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:people_rating_app/domain/contacts/contacts.dart';
import 'package:people_rating_app/domain/contacts/contacts_failure.dart';
import 'package:people_rating_app/domain/contacts/i_contacts_local_data_source.dart';
import 'package:people_rating_app/domain/contacts/i_contacts_remote_data_sorce.dart';
import 'package:people_rating_app/domain/contacts/i_contacts_repository.dart';
import 'package:people_rating_app/domain/core/failures.dart';
import 'package:people_rating_app/domain/core/errors.dart' as errors;
import 'package:people_rating_app/domain/core/i_contacts_vendor.dart';

@Injectable(as: IContactsRepository)
class ContactsRepository implements IContactsRepository {
  final IContactsVendor _contactsVendor;
  final IContactsRemoteDataSource _contactsRemoteDataSource;
  final IContactsLocalDataSource _contactsLocalDataSource;

  ContactsRepository(
    this._contactsVendor,
    this._contactsRemoteDataSource,
    this._contactsLocalDataSource,
  );

  @override
  Future<Either<ContactsFailure, PhoneContacts>> getContactsFromPhone() async {
    await _contactsVendor.request();

    if (await _contactsVendor.isGranted) {
      final contactsFromPhone = await _contactsVendor.getContacts();

      return Right(contactsFromPhone);
    } else {
      return const Left(ContactsFailure.noPermissionToTakeFromPhone());
    }
  }

  @override
  Future<Either<ServerFailure, UpdatedContacts>> updateContactsOnServer(PhoneContacts contactsFromPhone) async {
    try {
      final updatedContacts = await _contactsRemoteDataSource.updateContactsOnServer(contactsFromPhone);

      await _contactsLocalDataSource.cacheContacts(updatedContacts);

      return Right(updatedContacts);
    } on errors.ServerError catch (e) {
      return Left(ServerFailure.serverError(statusCode: e.statusCode));
    } on errors.NoInternetConnectionError {
      return const Left(ServerFailure.noInternetConnection());
    }
  }

  @override
  Future<Either<CacheFailure, UpdatedContacts>> getCashedContacts() async {
    try {
      return Right(await _contactsLocalDataSource.getCashedContacts());
    } on errors.CacheError {
      return const Left(CacheFailure.cacheError());
    }
  }

  @override
  Future<bool> get isContactAccess async => await _contactsVendor.isGranted;
}
