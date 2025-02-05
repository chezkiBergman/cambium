
import 'package:flutter/material.dart';

class ShadowDecoration extends StatelessWidget {
  const ShadowDecoration(
      {super.key,
    this.height,
      this.width,
      this.child,
      this.color = Colors.white,
      this.radiusCircular,
      this.borderRadiusGeometry,
      this.maxWidth,
      this.minWidth,
      this.widthBorder,
      this.colorBorder,
      this.showBorder = false,
      this.withShadow = true});
  final double? widthBorder;
  final Color? colorBorder;
  final bool? showBorder;
  final bool? withShadow;
  final double? height;
  final double? width;
  final double? maxWidth;
  final double? minWidth;
  final Widget? child;
  final Color? color;
  final double? radiusCircular;
  final BorderRadiusGeometry? borderRadiusGeometry;

  @override
  Widget build(BuildContext context) {
    return Container(
      height:height,
      width: width,
      constraints: BoxConstraints(
          maxWidth: maxWidth ?? double.infinity, minWidth: minWidth ?? 0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: borderRadiusGeometry ??
            BorderRadius.all(
              Radius.circular(radiusCircular ?? 20),
            ),
        border: showBorder == false
            ? null
            : Border.all(
                color: colorBorder ?? Colors.white, // White border color
                width: widthBorder ?? 0, // Border width
              ),
        boxShadow: withShadow == true
            ? [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.30),
                  spreadRadius: 1,
                  blurRadius: 5,
                ),
              ]
            : null,
      ),
      child: child,
    );
  }
}
