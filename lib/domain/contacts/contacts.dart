import 'package:freezed_annotation/freezed_annotation.dart';

part 'contacts.freezed.dart';

part 'contacts.g.dart';

@freezed
class PhoneContacts with _$PhoneContacts {
  const factory PhoneContacts({
    required List<PhoneContact> contacts,
  }) = _PhoneContacts;

  factory PhoneContacts.empty() => const PhoneContacts(contacts: []);

  factory PhoneContacts.fromJson(Map<String, dynamic> json) => _$PhoneContactsFromJson(json);
}

@freezed
class PhoneContact with _$PhoneContact {
  const factory PhoneContact({
    required String name,
    required List<String> phones,
  }) = _PhoneContact;

  factory PhoneContact.fromJson(Map<String, dynamic> json) => _$PhoneContactFromJson(json);
}

@freezed
class UpdatedContacts with _$UpdatedContacts {
  const factory UpdatedContacts({
    required List<UpdatedContact> contacts,
  }) = _UpdatedContacts;

  factory UpdatedContacts.empty() => const UpdatedContacts(contacts: []);

  factory UpdatedContacts.fromJson(Map<String, dynamic> json) => _$UpdatedContactsFromJson(json);
}

@freezed
class UpdatedContact with _$UpdatedContact {
  const factory UpdatedContact({
    required String name,
    required List<String> phones,
    required bool isServerUser,
  }) = _UpdatedContact;

  factory UpdatedContact.fromJson(Map<String, dynamic> json) => _$UpdatedContactFromJson(json);
}
