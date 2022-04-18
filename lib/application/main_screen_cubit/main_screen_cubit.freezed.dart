// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'main_screen_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$MainScreenStateTearOff {
  const _$MainScreenStateTearOff();

  _MainSreenState call(
      {required String title,
      required bool drawerOrArrowBack,
      required int currentPageIndex,
      required Contacts contacts}) {
    return _MainSreenState(
      title: title,
      drawerOrArrowBack: drawerOrArrowBack,
      currentPageIndex: currentPageIndex,
      contacts: contacts,
    );
  }
}

/// @nodoc
const $MainScreenState = _$MainScreenStateTearOff();

/// @nodoc
mixin _$MainScreenState {
  String get title => throw _privateConstructorUsedError;
  bool get drawerOrArrowBack => throw _privateConstructorUsedError;
  int get currentPageIndex => throw _privateConstructorUsedError;
  Contacts get contacts => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MainScreenStateCopyWith<MainScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MainScreenStateCopyWith<$Res> {
  factory $MainScreenStateCopyWith(
          MainScreenState value, $Res Function(MainScreenState) then) =
      _$MainScreenStateCopyWithImpl<$Res>;
  $Res call(
      {String title,
      bool drawerOrArrowBack,
      int currentPageIndex,
      Contacts contacts});

  $ContactsCopyWith<$Res> get contacts;
}

/// @nodoc
class _$MainScreenStateCopyWithImpl<$Res>
    implements $MainScreenStateCopyWith<$Res> {
  _$MainScreenStateCopyWithImpl(this._value, this._then);

  final MainScreenState _value;
  // ignore: unused_field
  final $Res Function(MainScreenState) _then;

  @override
  $Res call({
    Object? title = freezed,
    Object? drawerOrArrowBack = freezed,
    Object? currentPageIndex = freezed,
    Object? contacts = freezed,
  }) {
    return _then(_value.copyWith(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      drawerOrArrowBack: drawerOrArrowBack == freezed
          ? _value.drawerOrArrowBack
          : drawerOrArrowBack // ignore: cast_nullable_to_non_nullable
              as bool,
      currentPageIndex: currentPageIndex == freezed
          ? _value.currentPageIndex
          : currentPageIndex // ignore: cast_nullable_to_non_nullable
              as int,
      contacts: contacts == freezed
          ? _value.contacts
          : contacts // ignore: cast_nullable_to_non_nullable
              as Contacts,
    ));
  }

  @override
  $ContactsCopyWith<$Res> get contacts {
    return $ContactsCopyWith<$Res>(_value.contacts, (value) {
      return _then(_value.copyWith(contacts: value));
    });
  }
}

/// @nodoc
abstract class _$MainSreenStateCopyWith<$Res>
    implements $MainScreenStateCopyWith<$Res> {
  factory _$MainSreenStateCopyWith(
          _MainSreenState value, $Res Function(_MainSreenState) then) =
      __$MainSreenStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {String title,
      bool drawerOrArrowBack,
      int currentPageIndex,
      Contacts contacts});

  @override
  $ContactsCopyWith<$Res> get contacts;
}

/// @nodoc
class __$MainSreenStateCopyWithImpl<$Res>
    extends _$MainScreenStateCopyWithImpl<$Res>
    implements _$MainSreenStateCopyWith<$Res> {
  __$MainSreenStateCopyWithImpl(
      _MainSreenState _value, $Res Function(_MainSreenState) _then)
      : super(_value, (v) => _then(v as _MainSreenState));

  @override
  _MainSreenState get _value => super._value as _MainSreenState;

  @override
  $Res call({
    Object? title = freezed,
    Object? drawerOrArrowBack = freezed,
    Object? currentPageIndex = freezed,
    Object? contacts = freezed,
  }) {
    return _then(_MainSreenState(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      drawerOrArrowBack: drawerOrArrowBack == freezed
          ? _value.drawerOrArrowBack
          : drawerOrArrowBack // ignore: cast_nullable_to_non_nullable
              as bool,
      currentPageIndex: currentPageIndex == freezed
          ? _value.currentPageIndex
          : currentPageIndex // ignore: cast_nullable_to_non_nullable
              as int,
      contacts: contacts == freezed
          ? _value.contacts
          : contacts // ignore: cast_nullable_to_non_nullable
              as Contacts,
    ));
  }
}

/// @nodoc

class _$_MainSreenState implements _MainSreenState {
  const _$_MainSreenState(
      {required this.title,
      required this.drawerOrArrowBack,
      required this.currentPageIndex,
      required this.contacts});

  @override
  final String title;
  @override
  final bool drawerOrArrowBack;
  @override
  final int currentPageIndex;
  @override
  final Contacts contacts;

  @override
  String toString() {
    return 'MainScreenState(title: $title, drawerOrArrowBack: $drawerOrArrowBack, currentPageIndex: $currentPageIndex, contacts: $contacts)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MainSreenState &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality()
                .equals(other.drawerOrArrowBack, drawerOrArrowBack) &&
            const DeepCollectionEquality()
                .equals(other.currentPageIndex, currentPageIndex) &&
            const DeepCollectionEquality().equals(other.contacts, contacts));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(drawerOrArrowBack),
      const DeepCollectionEquality().hash(currentPageIndex),
      const DeepCollectionEquality().hash(contacts));

  @JsonKey(ignore: true)
  @override
  _$MainSreenStateCopyWith<_MainSreenState> get copyWith =>
      __$MainSreenStateCopyWithImpl<_MainSreenState>(this, _$identity);
}

abstract class _MainSreenState implements MainScreenState {
  const factory _MainSreenState(
      {required String title,
      required bool drawerOrArrowBack,
      required int currentPageIndex,
      required Contacts contacts}) = _$_MainSreenState;

  @override
  String get title;
  @override
  bool get drawerOrArrowBack;
  @override
  int get currentPageIndex;
  @override
  Contacts get contacts;
  @override
  @JsonKey(ignore: true)
  _$MainSreenStateCopyWith<_MainSreenState> get copyWith =>
      throw _privateConstructorUsedError;
}
