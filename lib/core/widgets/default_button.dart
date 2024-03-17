import 'package:flutter/material.dart';
import 'package:system/core/theming/colors.dart';

class DefaultButton extends StatelessWidget {
  DefaultButton(
      {super.key,
        required this.onPressed,
        this.shape,
        this.color,
        this.padding,
        this.elevation,
        required this.child});

  final Widget child;
  final Function() onPressed;
  OutlinedBorder? shape;
  double? elevation;

  Color? color;
  EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: elevation,
        padding: padding?? const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        backgroundColor: color?? ColorsManager.secondaryColor,
        shape:shape?? RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      onPressed: onPressed,
      child: Center(
        child: child,
      ),
    );
  }
}