import 'package:flutter/material.dart';

class CustomTransitionBuilder extends PageTransitionsBuilder {
  const CustomTransitionBuilder();

  @override
  Widget buildTransitions<T>(
      PageRoute<T> route,
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {


    final tween =
        Tween(begin: 0.0, end: 1.0).chain(CurveTween(curve: Curves.ease));
    return ScaleTransition(
        scale: animation.drive(tween),
        child: FadeTransition(opacity: animation, child: child));
  }
}
class NoTransitionsBuilder extends PageTransitionsBuilder {
  const NoTransitionsBuilder();

  @override
  Widget buildTransitions<T>(
    PageRoute<T>? route,
    BuildContext? context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget? child,
  ) {
    // only return the child without warping it with animations
    return child!;
  }
}