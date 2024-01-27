import 'package:flutter/material.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget(
      {super.key,
        required this.child,
        required this.horizontal,
        required this.vertical,
        required this.height,
        required this.width});

  final Widget child;
  final double horizontal;
  final double vertical;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: horizontal,
        vertical: vertical,
      ),
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0F38476D),
            blurRadius: 5,
            offset: Offset(0, 0),
            spreadRadius: 0,
          ),
        ],
      ),
      child: child,
    );
  }
}
