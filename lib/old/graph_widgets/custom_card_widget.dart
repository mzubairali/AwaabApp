import 'package:flutter/material.dart';
import 'package:cmsapp/data/constants/constants.dart';

class CustomCardWidget extends StatelessWidget {
  final Widget child;
  final Color? color;
  final EdgeInsetsGeometry? padding;

  const CustomCardWidget({
    super.key,
    this.color,
    this.padding,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(8.0)),
        color: color ?? cardBackgroundColor,
        //color: color ?? Colors.grey,
      ),
      child: Padding(
        padding: padding ?? const EdgeInsets.all(8.0),
        child: child,
      ),
    );
  }
}
