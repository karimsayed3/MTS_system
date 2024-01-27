import 'package:flutter/material.dart';

import '../helpers/dimensions.dart';

class DefaultText extends StatelessWidget {
  DefaultText(
      {super.key,
        required this.text,
        this.fontSize,
        this.fontFamily,
        this.textDirection,
        this.maxLines,
        this.fontWeight = FontWeight.normal,
        this.color = Colors.black,
        this.letterSpacing});

  final String text;
  double? fontSize;
  String? fontFamily;
  TextDirection? textDirection;
  int? maxLines;
  final FontWeight fontWeight;
  final Color color;

  double? letterSpacing;

  @override
  Widget build(BuildContext context) {
    var dimension = Dimensions(context);
    return Text(
      text,
      maxLines:maxLines??20,
      textDirection: textDirection?? TextDirection.rtl,
      style: TextStyle(
        overflow: TextOverflow.ellipsis,
        fontSize: fontSize ?? dimension.reduce15,
        fontFamily: fontFamily ?? 'Almarai',
        fontWeight: fontWeight,
        color: color,
        letterSpacing: letterSpacing ?? 0,
      ),
    );
  }
}
