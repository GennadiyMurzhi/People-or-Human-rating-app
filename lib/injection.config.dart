// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i14;
import 'package:flutter/material.dart' as _i17;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i9;

import 'application/main_screen_cubit/main_screen_cubit.dart' as _i16;
import 'domain/contacts/i_contacts_local_data_source.dart' as _i10;
import 'domain/contacts/i_contacts_remote_data_sorce.dart' as _i12;
import 'domain/core/i_contacts_vendor.dart' as _i3;
import 'domain/core/i_database_vendor.dart' as _i5;
import 'domain/core/i_network_info.dart' as _i7;
import 'infrastructure/contacts/contacts_local_data_source.dart' as _i11;
import 'infrastructure/contacts/contacts_remote_data_source.dart' as _i13;
import 'infrastructure/contacts/contacts_repository.dart' as _i15;
import 'infrastructure/core/contacts_vendor.dart' as _i4;
import 'infrastructure/core/database_vendor.dart' as _i6;
import 'infrastructure/core/network_info.dart'
    as _i8; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.IContactsVendor>(() => _i4.ContactsVendor());
  gh.factory<_i5.IDatabaseVendor>(() => _i6.DatabaseVendor());
  gh.factory<_i7.INetworkInfo>(
      () => _i8.NetworkInfo(get<_i9.InternetConnectionChecker>()));
  gh.factory<_i10.IContactsLocalDataSource>(
      () => _i11.ContactsLocalDataSource(get<_i5.IDatabaseVendor>()));
  gh.factory<_i12.IContactsRemoteDataSource>(() =>
      _i13.ContactsRemoteDataSource(get<_i14.Dio>(), get<_i7.INetworkInfo>()));
  gh.factory<_i15.ContactsRepository>(() => _i15.ContactsRepository(
      get<_i3.IContactsVendor>(),
      get<_i12.IContactsRemoteDataSource>(),
      get<_i10.IContactsLocalDataSource>()));
  gh.factory<_i16.MainScreenCubit>(() => _i16.MainScreenCubit(
      get<_i17.PageController>(), get<_i15.ContactsRepository>()));
  return get;
}
