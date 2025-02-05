import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/shadow_decoration.dart';

class CustomCardDecoration extends StatelessWidget {
  const CustomCardDecoration({
    super.key,
    required this.child,
    this.borderRadiusGeometry,
    this.maxWidth,
    this.color = Colors.white,
  });

  final Widget child;
  final double? maxWidth;
  final BorderRadiusGeometry? borderRadiusGeometry;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: borderRadiusGeometry ?? BorderRadius.circular(20),
      ),
      child: ShadowDecoration(
        colorBorder: Colors.white,widthBorder: 1,
        color: color,
        child: child,
      ),
    );
  }
}
