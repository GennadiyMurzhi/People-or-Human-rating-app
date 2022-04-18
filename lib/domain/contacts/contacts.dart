import 'package:freezed_annotation/freezed_annotation.dart';

part 'contacts.freezed.dart';

@freezed
class Contacts with _$Contacts {
  const factory Contacts({
      required List<Contact> contacts,
  }) = _Contacts;

  factory Contacts.empty() => const Contacts(contacts: []);
}

@freezed
class Contact with _$Contact{
  const factory Contact({
    required String name,
    required List<String> phones,
  }) = _Contact;
}

