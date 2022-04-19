import 'package:contacts_service/contacts_service.dart' as contacts_service;
import 'package:injectable/injectable.dart';
import 'package:people_rating_app/domain/contacts/contacts.dart';
import 'package:people_rating_app/domain/core/i_contacts_vendor.dart';
import 'package:permission_handler/permission_handler.dart';

@Injectable(as: IContactsVendor)
class ContactsVendor implements IContactsVendor {
  @override
  Future<Contacts> getContacts() async {
    final contacts = await contacts_service.ContactsService.getContacts();

    return Contacts(
      contacts: List.generate(
        contacts.length,
        (index) => Contact(
          name: contacts[index].displayName!,
          phones: List.generate(
            contacts[index].phones!.length,
            (item) => contacts[index].phones![item].value.toString(),
          ),
        ),
      ),
    );
  }

  ///Makes a request if there is no access to the phone contacts
  @override
  Future<void> request() async {
    if (await Permission.contacts.status.isDenied) {
      await Permission.contacts.request();
    }
  }

  @override
  Future<bool> get isGranted async => await Permission.contacts.status.isGranted;
}
