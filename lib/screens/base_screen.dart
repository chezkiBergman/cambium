import 'package:flutter/material.dart';
import 'package:flutter_application_1/generated/l10n.dart';
import 'package:flutter_application_1/providers/user_provider.dart';
import 'package:flutter_application_1/utils/theme_colors.dart';
import 'package:flutter_application_1/widgets/customSwitch.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../routes/app_router.dart';
import '../routes/app_router_manage.dart';

final mainNavigatorKey = GlobalKey<NavigatorState>();
final localeProvider = StateProvider<Locale>(
    (ref) => Locale(S.delegate.supportedLocales.last.languageCode));

class BaseScreen extends ConsumerWidget {
  const BaseScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(selectedIndexProvider);
    final isHomeScreen = selectedIndex == 0;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CustomSwitchLocal(
          value: ref.watch(localeProvider).languageCode ==
              S.delegate.supportedLocales.last.languageCode,
          onChanged: (value) {
            final newLocale = ref.read(localeProvider) ==
                    Locale(
                      S.delegate.supportedLocales.last.languageCode,
                    )
                ? Locale(
                    S.delegate.supportedLocales.first.languageCode,
                  )
                : Locale(
                    S.delegate.supportedLocales.last.languageCode,
                  );
            ref.read(localeProvider.notifier).state = newLocale;
          },
        ),
        leadingWidth: 100,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Flexible(
                child: Text(
                  isHomeScreen ? S.current.sort : S.current.user_favorites,
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ],
          ),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: CustomColors.gradientColors,
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(isHomeScreen ? Icons.favorite : Icons.home),
            onPressed: () {
              ref.read(selectedIndexProvider.notifier).state =
                  isHomeScreen ? 1 : 0;
              mainNavigatorKey.currentState?.pushReplacementNamed(
                isHomeScreen ? AppRoutes.favorites : AppRoutes.home,
              );
            },
          ),
        ],
      ),
      body: Navigator(
        key: mainNavigatorKey,
        initialRoute: AppRoutes.home,
        onGenerateRoute: AppRouter.generateRoute,
      ),
    );
  }
}
