// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:flutter/material.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'application/main_screen_cubit/main_screen_cubit.dart' as _i4;
import 'infrastructure/contacts_repository.dart'
    as _i3; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.ContactsRepository>(() => _i3.ContactsRepository());
  gh.factory<_i4.MainScreenCubit>(() => _i4.MainScreenCubit(
      get<_i5.PageController>(), get<_i3.ContactsRepository>()));
  return get;
}
