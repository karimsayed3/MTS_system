import 'package:flutter/material.dart';

import '../helpers/dimensions.dart';
import 'default_text.dart';

class NumberOfSoliderStatus extends StatelessWidget {
  const NumberOfSoliderStatus(
      {super.key,
      required this.containerBorderColor,
      required this.containerColor,
      required this.textColor,
      required this.numberColor,
      required this.title,
      required this.number,
      required this.fontSize});

  final Color containerBorderColor;
  final Color containerColor;
  final Color textColor;
  final Color numberColor;
  final String title;
  final String number;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    var dimension = Dimensions(context);
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: dimension.width10, vertical: dimension.height5),
      decoration: ShapeDecoration(
        color: containerColor,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: containerBorderColor),
          borderRadius: BorderRadius.circular(35),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          DefaultText(
            text: title,
            color: textColor,
            fontWeight: FontWeight.w700,
            fontSize: fontSize,
          ),
          DefaultText(
            text: number,
            color: numberColor,
            fontSize: fontSize,
          ),
        ],
      ),
    );
  }
}
