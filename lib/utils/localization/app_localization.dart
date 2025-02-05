import 'package:flutter/material.dart';

import 'package:flutter_application_1/generated/intl/messages_all.dart';
import 'package:intl/intl.dart';

class AppLocalizations {
  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate(); // This is the key change

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  String get greeting => Intl.message('Hello, world!', name: 'greeting');
  // ... other messages

}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'he'].contains(locale.languageCode); // Check supported languages
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    final name = (locale.countryCode != null) ? '${locale.languageCode}_${locale.countryCode}' : locale.languageCode;
    final localeName = Intl.canonicalizedLocale(name);

    try {
      await initializeMessages(localeName);
    } catch (e) {
      print('Error loading locale $localeName: $e');
      try {
        await initializeMessages('en'); // Fallback to default locale
      } catch (e) {
        print('Error loading default locale: $e');
      }
    }

    return AppLocalizations();
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}
