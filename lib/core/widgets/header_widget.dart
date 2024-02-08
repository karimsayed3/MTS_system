import 'package:flutter/material.dart';
import 'package:system/core/theming/colors.dart';

class HeaderWidget extends StatelessWidget {
  HeaderWidget({super.key, required this.child,this.color, required this.height});

  final Widget child;
  final double height;

  Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: height,

      decoration: BoxDecoration(
        color: color??  ColorsManager.lightGray,
        borderRadius: BorderRadius.circular(5)
        // border: const Border(
        //   bottom: BorderSide(color: Colors.black, width: 1),
        //   top: BorderSide(color: Colors.black, width: 1),
        // ),
      ),
      padding: EdgeInsets.only(
        left: MediaQuery.of(context).size.width * .01,
        right: MediaQuery.of(context).size.width * .01,
        top: MediaQuery.of(context).size.height * .01,
        bottom: MediaQuery.of(context).size.height * .01,
      ),
      child: child,
    );
  }
}
