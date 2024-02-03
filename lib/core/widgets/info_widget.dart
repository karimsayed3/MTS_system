import 'package:flutter/material.dart';
import 'package:system/core/helpers/dimensions.dart';
import 'package:system/core/helpers/spacing.dart';
import 'package:system/core/widgets/default_text.dart';

class InfoWidget extends StatelessWidget {
  const InfoWidget(
      {super.key,
      required this.color,
      required this.text,
      required this.textColor});

  final Color color;

  final String text;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    var dimension = Dimensions(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: dimension.reduce15,
          height: dimension.reduce15,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
        ),
        horizontalSpace(dimension.width5),
        DefaultText(
          text: text,
          color: textColor,
          fontSize: dimension.reduce20,
          fontWeight: FontWeight.w300,
        ),
      ],
    );
  }
}
