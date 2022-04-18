import 'package:freezed_annotation/freezed_annotation.dart';

part 'contacts_failure.freezed.dart';

@freezed
abstract class ContactsFailure with _$ContactsFailure{
  const factory ContactsFailure.noPermissionToTakeFromPhone() = NoPermissionToTakeFromPhone;
}