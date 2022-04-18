import 'package:contacts_service/contacts_service.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:people_rating_app/domain/contacts/contacts.dart' as contacts;
import 'package:people_rating_app/domain/contacts/contacts_failure.dart';
import 'package:people_rating_app/domain/contacts/i_contacts_repository.dart';
import 'package:permission_handler/permission_handler.dart';

@Injectable()
class ContactsRepository extends IContactsRepository {
  @override
  Future<Either<ContactsFailure, contacts.Contacts>> getContactsFromPhone() async {
    if (await Permission.contacts.status.isDenied) {
      await Permission.contacts.request();
    }

    if (await Permission.contacts.status.isGranted) {
      final contactsFromPhone = await ContactsService.getContacts();

      final contactsForApp = contacts.Contacts(
        contacts: List.generate(
          contactsFromPhone.length,
          (index) => contacts.Contact(
            name: contactsFromPhone[index].displayName!,
            phones: List.generate(
              contactsFromPhone[index].phones!.length,
              (item) => contactsFromPhone[index].phones![item].value.toString(),
            ),
          ),
        ),
      );

      return Right(contactsForApp);
    } else {
      return const Left(ContactsFailure.noPermissionToTakeFromPhone());
    }
  }
}
