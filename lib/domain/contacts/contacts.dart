import 'package:freezed_annotation/freezed_annotation.dart';

part 'contacts.freezed.dart';
part 'contacts.g.dart';

@freezed
class Contacts with _$Contacts {
  const factory Contacts({
      required List<Contact> contacts,
  }) = _Contacts;

  factory Contacts.empty() => const Contacts(contacts: []);
  factory Contacts.fromJson(Map<String, dynamic> json) => _$ContactsFromJson(json);
}

@freezed
class Contact with _$Contact{
  const factory Contact({
    required String name,
    required List<String> phones,
  }) = _Contact;

  factory Contact.fromJson(Map<String, dynamic> json) => _$ContactFromJson(json);
}

