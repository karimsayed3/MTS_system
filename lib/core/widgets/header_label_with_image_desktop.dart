import 'package:flutter/material.dart';
import 'package:system/core/helpers/dimensions.dart';
import 'package:system/core/helpers/spacing.dart';
import 'package:system/core/theming/colors.dart';
import 'package:system/core/widgets/default_text.dart';

class HeaderLabelWithImageDesktop extends StatelessWidget {
  const HeaderLabelWithImageDesktop(
      {super.key,
        required this.width,
        required this.image,
        required this.title,
      });

  final double width;
  final String image;

  final String title;

  @override
  Widget build(BuildContext context) {
    var dimension = Dimensions(context);
    return SizedBox(
      width: width,
      child: Row(
        children: [
          SizedBox(
            width: dimension.width10,
            height: dimension.height10,
            child: Image(
              image: AssetImage(image),
              color: ColorsManager.lightBlack,
              width: dimension.reduce10,
            ),
          ),
          horizontalSpace(dimension.width5),
          DefaultText(
            text: title,
            fontSize: dimension.reduce15,
            color: ColorsManager.lightBlack,
            fontWeight: FontWeight.w600,
          ),
        ],
      ),
    );
  }
}
