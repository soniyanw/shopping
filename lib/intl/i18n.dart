import 'dart:async';

import 'package:collection/collection.dart' show IterableExtension;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'app_strings.g.dart';
import 'app_strings_en.g.dart';

export 'package:shopping/intl/app_strings.g.dart';

class AppLocalizations {
  const AppLocalizations();

  static const List<LocalizationsDelegate<dynamic>> all =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ];

  static const AppStringsDelegate delegate = AppStringsDelegate.delegate;

  static AppStrings of(BuildContext context) =>
      Localizations.of<AppStrings>(context, AppStrings)!;

  static Future<AppStrings> load(Locale locale) {
    final String name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();

    return Future<AppStrings>.sync(() {
      if (name == 'es') {
        return AppStringsEN();
      }
      return AppStringsEN();
    });
  }
}

class AppStringsDelegate extends LocalizationsDelegate<AppStrings> {
  const AppStringsDelegate();

  List<Locale> get supportedLocales => appSupportedLocales;

  static List<LocalizationsDelegate<Object?>> delegates =
      <LocalizationsDelegate<Object?>>[
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    delegate,
  ];

  static const AppStringsDelegate delegate = AppStringsDelegate();

  static const Locale english = Locale('en');

  static const List<Locale> appSupportedLocales = <Locale>[english];

  static AppStrings of(BuildContext context) {
    return Localizations.of<AppStrings>(context, AppStrings)!;
  }

  @override
  bool isSupported(Locale locale) {
    final Locale? l = supportedLocales.firstWhereOrNull(
      (Locale l) => l.languageCode == locale.languageCode,
    );
    return l != null;
  }

  @override
  Future<AppStrings> load(Locale locale) {
    AppStrings strings = AppStringsEN();
    if (locale.languageCode == 'en') {
      strings = AppStringsEN();
    }

    return SynchronousFuture<AppStrings>(strings);
  }

  @override
  bool shouldReload(LocalizationsDelegate<AppStrings> old) => false;
}
