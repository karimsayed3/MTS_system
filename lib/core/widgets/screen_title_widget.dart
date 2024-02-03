import 'package:flutter/material.dart';
import 'package:system/core/helpers/dimensions.dart';
import 'package:system/core/theming/colors.dart';
import 'package:system/core/widgets/default_text.dart';

class ScreenTitleWidget extends StatelessWidget {
  const ScreenTitleWidget({super.key, required this.coloredTitle, required this.title});

  final String coloredTitle ;
  final String title ;

  @override
  Widget build(BuildContext context) {
    var dimension =  Dimensions(context);
    return Row(
      children: [
        TextButton(
          onPressed: () {},
          child: DefaultText(
            text: coloredTitle,
            color: const Color(0xFF007C92),
            fontSize: dimension.reduce20,
            fontWeight: FontWeight.w400,
          ),
        ),
        Icon(Icons.arrow_back_ios_new,
            color: ColorsManager.lightGray, size: dimension.width10),
        DefaultText(
          text: title,
          fontSize: dimension.reduce20,
          fontWeight: FontWeight.w400,
        ),
      ],
    );
  }
}
