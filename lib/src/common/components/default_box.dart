import 'package:flutter/material.dart';
import 'package:show_up_animation/show_up_animation.dart';

class DefaultBox extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  const DefaultBox({
    super.key,
    required this.child,
    this.margin,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return ShowUpAnimation(
      child: Container(
        padding: padding,
        margin: margin,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.8),
          borderRadius: BorderRadius.circular(10),
        ),
        width: MediaQuery.of(context).size.width,
        child: child,
      ),
    );
  }
}
