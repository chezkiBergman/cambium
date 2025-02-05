import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/routes/custom_transition_builder.dart';
import 'package:flutter_application_1/screens/base_screen.dart';
import 'package:flutter_application_1/utils/theme_colors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'generated/l10n.dart';


void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = ref.watch(localeProvider);
    return MaterialApp(key: ValueKey(locale.languageCode), 
      debugShowCheckedModeBanner: false,
      title: 'User Favorites',
      localizationsDelegates: localizationsDelegates(),
      locale: locale,
      supportedLocales: S.delegate.supportedLocales,
      theme: ThemeData(
        primaryColor: CustomColors.backgroundColorApp,
        pageTransitionsTheme: PageTransitionsTheme(
          builders: kIsWeb
              ? {
                  for (final platform in TargetPlatform.values)
                    platform: const NoTransitionsBuilder(),
                }
              : {
                  TargetPlatform.android: const CustomTransitionBuilder(),
                },
        ),
      ),
      home: const BaseScreen(),
    );
  }
}

Iterable<LocalizationsDelegate<dynamic>> localizationsDelegates() {
  return [
    S.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ];
}
