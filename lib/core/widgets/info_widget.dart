import 'package:flutter/material.dart';
import 'package:system/core/helpers/dimensions.dart';
import 'package:system/core/helpers/spacing.dart';
import 'package:system/core/widgets/default_text.dart';

class InfoWidget extends StatelessWidget {
  InfoWidget(
      {super.key,
      required this.color,
      required this.text,
        this.fontSize,
        this.horizontalWidth,
        this.containerWidth,
        this.containerHeight,
      required this.textColor});

  final Color color;

  final String text;
  final Color textColor;
  double? fontSize;
  double? horizontalWidth;
  double? containerWidth;
  double? containerHeight;


  @override
  Widget build(BuildContext context) {
    var dimension = Dimensions(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: containerWidth??dimension.reduce15,
          height: containerHeight??dimension.reduce15,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
        ),
        horizontalSpace(horizontalWidth?? dimension.width5),
        DefaultText(
          text: text,
          color: textColor,
          fontSize:fontSize?? dimension.reduce20,
          fontWeight: FontWeight.w300,
        ),
      ],
    );
  }
}
