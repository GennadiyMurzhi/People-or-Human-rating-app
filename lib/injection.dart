import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'injection.config.dart';

final GetIt getIt = GetIt.instance;

@injectableInit
void configureInjection(String env) {
  $initGetIt(getIt, environment: env);

  getIt.registerLazySingleton<PageController>(() => PageController(initialPage: 1, keepPage: false,));
  getIt.registerLazySingleton<Dio>(() => Dio());
  getIt.registerLazySingleton<InternetConnectionChecker>(() => InternetConnectionChecker());
}
