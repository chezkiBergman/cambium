// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Sort`
  String get sort {
    return Intl.message(
      'Sort',
      name: 'sort',
      desc: '',
      args: [],
    );
  }

  /// `Users`
  String get users_title {
    return Intl.message(
      'Users',
      name: 'users_title',
      desc: '',
      args: [],
    );
  }

  /// `Favorites`
  String get user_favorites {
    return Intl.message(
      'Favorites',
      name: 'user_favorites',
      desc: '',
      args: [],
    );
  }

  /// `No favorites yet`
  String get no_favorites {
    return Intl.message(
      'No favorites yet',
      name: 'no_favorites',
      desc: '',
      args: [],
    );
  }

  /// `Error loading favorites:`
  String get error_loading_favorites {
    return Intl.message(
      'Error loading favorites:',
      name: 'error_loading_favorites',
      desc: '',
      args: [],
    );
  }

  /// `Search by name, email, date`
  String get search_placeholder {
    return Intl.message(
      'Search by name, email, date',
      name: 'search_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `Young to old`
  String get young_to_old {
    return Intl.message(
      'Young to old',
      name: 'young_to_old',
      desc: '',
      args: [],
    );
  }

  /// `Old to young`
  String get old_young_to {
    return Intl.message(
      'Old to young',
      name: 'old_young_to',
      desc: '',
      args: [],
    );
  }

  /// `Without sort`
  String get without_sort {
    return Intl.message(
      'Without sort',
      name: 'without_sort',
      desc: '',
      args: [],
    );
  }

  /// `Date of Birth`
  String get date_of_birth {
    return Intl.message(
      'Date of Birth',
      name: 'date_of_birth',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'he'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
