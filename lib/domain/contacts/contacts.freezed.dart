// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'contacts.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ContactsTearOff {
  const _$ContactsTearOff();

  _Contacts call({required List<Contact> contacts}) {
    return _Contacts(
      contacts: contacts,
    );
  }
}

/// @nodoc
const $Contacts = _$ContactsTearOff();

/// @nodoc
mixin _$Contacts {
  List<Contact> get contacts => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ContactsCopyWith<Contacts> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContactsCopyWith<$Res> {
  factory $ContactsCopyWith(Contacts value, $Res Function(Contacts) then) =
      _$ContactsCopyWithImpl<$Res>;
  $Res call({List<Contact> contacts});
}

/// @nodoc
class _$ContactsCopyWithImpl<$Res> implements $ContactsCopyWith<$Res> {
  _$ContactsCopyWithImpl(this._value, this._then);

  final Contacts _value;
  // ignore: unused_field
  final $Res Function(Contacts) _then;

  @override
  $Res call({
    Object? contacts = freezed,
  }) {
    return _then(_value.copyWith(
      contacts: contacts == freezed
          ? _value.contacts
          : contacts // ignore: cast_nullable_to_non_nullable
              as List<Contact>,
    ));
  }
}

/// @nodoc
abstract class _$ContactsCopyWith<$Res> implements $ContactsCopyWith<$Res> {
  factory _$ContactsCopyWith(_Contacts value, $Res Function(_Contacts) then) =
      __$ContactsCopyWithImpl<$Res>;
  @override
  $Res call({List<Contact> contacts});
}

/// @nodoc
class __$ContactsCopyWithImpl<$Res> extends _$ContactsCopyWithImpl<$Res>
    implements _$ContactsCopyWith<$Res> {
  __$ContactsCopyWithImpl(_Contacts _value, $Res Function(_Contacts) _then)
      : super(_value, (v) => _then(v as _Contacts));

  @override
  _Contacts get _value => super._value as _Contacts;

  @override
  $Res call({
    Object? contacts = freezed,
  }) {
    return _then(_Contacts(
      contacts: contacts == freezed
          ? _value.contacts
          : contacts // ignore: cast_nullable_to_non_nullable
              as List<Contact>,
    ));
  }
}

/// @nodoc

class _$_Contacts implements _Contacts {
  const _$_Contacts({required this.contacts});

  @override
  final List<Contact> contacts;

  @override
  String toString() {
    return 'Contacts(contacts: $contacts)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Contacts &&
            const DeepCollectionEquality().equals(other.contacts, contacts));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(contacts));

  @JsonKey(ignore: true)
  @override
  _$ContactsCopyWith<_Contacts> get copyWith =>
      __$ContactsCopyWithImpl<_Contacts>(this, _$identity);
}

abstract class _Contacts implements Contacts {
  const factory _Contacts({required List<Contact> contacts}) = _$_Contacts;

  @override
  List<Contact> get contacts;
  @override
  @JsonKey(ignore: true)
  _$ContactsCopyWith<_Contacts> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$ContactTearOff {
  const _$ContactTearOff();

  _Contact call({required String name, required List<String> phones}) {
    return _Contact(
      name: name,
      phones: phones,
    );
  }
}

/// @nodoc
const $Contact = _$ContactTearOff();

/// @nodoc
mixin _$Contact {
  String get name => throw _privateConstructorUsedError;
  List<String> get phones => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ContactCopyWith<Contact> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContactCopyWith<$Res> {
  factory $ContactCopyWith(Contact value, $Res Function(Contact) then) =
      _$ContactCopyWithImpl<$Res>;
  $Res call({String name, List<String> phones});
}

/// @nodoc
class _$ContactCopyWithImpl<$Res> implements $ContactCopyWith<$Res> {
  _$ContactCopyWithImpl(this._value, this._then);

  final Contact _value;
  // ignore: unused_field
  final $Res Function(Contact) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? phones = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phones: phones == freezed
          ? _value.phones
          : phones // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
abstract class _$ContactCopyWith<$Res> implements $ContactCopyWith<$Res> {
  factory _$ContactCopyWith(_Contact value, $Res Function(_Contact) then) =
      __$ContactCopyWithImpl<$Res>;
  @override
  $Res call({String name, List<String> phones});
}

/// @nodoc
class __$ContactCopyWithImpl<$Res> extends _$ContactCopyWithImpl<$Res>
    implements _$ContactCopyWith<$Res> {
  __$ContactCopyWithImpl(_Contact _value, $Res Function(_Contact) _then)
      : super(_value, (v) => _then(v as _Contact));

  @override
  _Contact get _value => super._value as _Contact;

  @override
  $Res call({
    Object? name = freezed,
    Object? phones = freezed,
  }) {
    return _then(_Contact(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phones: phones == freezed
          ? _value.phones
          : phones // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$_Contact implements _Contact {
  const _$_Contact({required this.name, required this.phones});

  @override
  final String name;
  @override
  final List<String> phones;

  @override
  String toString() {
    return 'Contact(name: $name, phones: $phones)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Contact &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.phones, phones));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(phones));

  @JsonKey(ignore: true)
  @override
  _$ContactCopyWith<_Contact> get copyWith =>
      __$ContactCopyWithImpl<_Contact>(this, _$identity);
}

abstract class _Contact implements Contact {
  const factory _Contact({required String name, required List<String> phones}) =
      _$_Contact;

  @override
  String get name;
  @override
  List<String> get phones;
  @override
  @JsonKey(ignore: true)
  _$ContactCopyWith<_Contact> get copyWith =>
      throw _privateConstructorUsedError;
}
