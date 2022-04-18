import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:people_rating_app/domain/contacts/contacts.dart';
import 'package:people_rating_app/domain/contacts/contacts_failure.dart';
import 'package:people_rating_app/domain/contacts/i_contacts_repository.dart';
import 'package:people_rating_app/infrastructure/core/contacts_vendor.dart';

@Injectable()
class ContactsRepository extends IContactsRepository {
  final ContactsVendor _contactsVendor;

  ContactsRepository(this._contactsVendor);

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
}
