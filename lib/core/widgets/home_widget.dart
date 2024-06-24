import 'package:flutter/material.dart';
import 'package:system/core/helpers/dimensions.dart';

class HomeWidget extends StatelessWidget {
   HomeWidget(
      {super.key,
        required this.child,
         this.horizontal,
         this.vertical,
         this.height,
         this.width});

  final Widget child;
   double? horizontal;
   double? vertical;
   double? height;
   double? width;

  @override
  Widget build(BuildContext context) {
    var dimension = Dimensions(context);
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: horizontal?? dimension.width10,
        vertical: vertical ?? dimension.width10,
      ),
      height: height ?? MediaQuery.of(context).size.height * .72,
      width: width ?? MediaQuery.of(context).size.width,
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
