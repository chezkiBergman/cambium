import 'package:flutter/material.dart';
import '../screens/home_screen.dart';
import '../screens/favorites_screen.dart';
import 'app_router.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    return
     MaterialPageRoute(
      builder: (_) => Center(
        child: Container( constraints: const BoxConstraints(maxWidth:800),
          padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15),
          child: settings.name == AppRoutes.favorites
              ? const FavoritesScreen()
              : const HomeScreen(),
        ),
      ),
    );
  }
}
