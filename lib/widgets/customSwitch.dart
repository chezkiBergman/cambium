import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/images/images.dart';

class CustomSwitchLocal extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const CustomSwitchLocal({super.key, required this.value, required this.onChanged});

  @override
  CustomSwitchLocalState createState() => CustomSwitchLocalState();
}

class CustomSwitchLocalState extends State<CustomSwitchLocal> with SingleTickerProviderStateMixin {
  Animation? _circleAnimation;
  AnimationController? _animationController;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 60));
    _circleAnimation = AlignmentTween(
            begin: widget.value ? Alignment.centerRight : Alignment.centerLeft,
            end: widget.value ? Alignment.centerLeft : Alignment.centerRight)
        .animate(CurvedAnimation(parent: _animationController!, curve: Curves.linear));
  }

  @override
  void dispose() {
    // Dispose the AnimationController to avoid ticker leak.
    _animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController!,
      builder: (context, child) {
        return GestureDetector(
          onTap: () {
            if (_animationController!.isCompleted) {
              _animationController!.reverse();
            } else {
              _animationController!.forward();
            }
            widget.value == false ? widget.onChanged(true) : widget.onChanged(false);
          },
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: Container(
              width: 75.0,
              height: 46.0,
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(24.0),
                color: Colors.white,
              ),
              child: Padding(
                padding:
                    const EdgeInsetsDirectional.only(top: 2.0, bottom: 2.0, start: 2.0, end: 2.0),
                child: Container(
                  alignment: widget.value
                      ? ((Directionality.of(context) == TextDirection.rtl)
                          ? AlignmentDirectional.centerStart
                          : AlignmentDirectional.centerEnd)
                      : ((Directionality.of(context) == TextDirection.rtl)
                           ? AlignmentDirectional.centerEnd
                          : AlignmentDirectional.centerStart),
                  child: Container(
                    width: 45.0,
                    height: 40.0,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        image: DecorationImage(
                            image: AssetImage(widget.value ? Images.usaFlag : Images.ilFlag))),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
