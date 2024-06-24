import 'package:flutter/material.dart';
import 'package:system/core/helpers/dimensions.dart';

import '../../../../../core/theming/colors.dart';
import '../../../../../core/widgets/default_text.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    var dimension = Dimensions(context);
    return  DefaultText(
      text: title,
      color: ColorsManager.darkBlack,
      fontSize: dimension.width10,
      fontWeight: FontWeight.w500,
    );
  }
}
