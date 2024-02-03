import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:system/core/helpers/dimensions.dart';
import 'package:system/core/helpers/spacing.dart';
import 'package:system/core/widgets/default_button.dart';
import 'package:system/core/widgets/default_text.dart';

class ButtonWithTextAndImageWidget extends StatelessWidget {
  ButtonWithTextAndImageWidget({super.key, required this.onPressed, required this.color, required this.text, this.image});

  final Function() onPressed;
  final Color color;
  final String text;
  String? image;

  @override
  Widget build(BuildContext context) {
    var dimension = Dimensions(context);
    return DefaultButton(
      color: color,
      padding: EdgeInsets.symmetric(
        horizontal: dimension.width15,
        vertical: dimension.height10,
      ),
      onPressed: onPressed,
      child: Row(
        children: [
          image!=null? SvgPicture.asset(image!):const SizedBox.shrink(),
          image !=null? horizontalSpace(dimension.width5):const SizedBox.shrink(),
          DefaultText(
            text: text,
            color: const Color(0xFF007C92),
            fontSize: dimension.reduce20,
            fontWeight: FontWeight.w400,
          ),
        ],
      ),
    );
  }
}
