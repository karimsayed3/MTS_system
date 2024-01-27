import 'package:flutter/material.dart';
import 'package:system/core/helpers/dimensions.dart';
import 'package:system/core/theming/colors.dart';
import 'package:system/core/widgets/header_widget.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/widgets/header_label_with_image.dart';

class CompaniesHeaderWidget extends StatelessWidget {
  const CompaniesHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var dimension = Dimensions(context);
    return HeaderWidget(
      height :dimension.height30,
      color: ColorsManager.lighterGray,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          HeaderLabelWithImage(
            width: dimension.width150,
            image: "assets/images/header_image.png",
            title: 'اسم الشركة',
          ),
          const Spacer(),
          HeaderLabelWithImage(
            width: dimension.width130,
            image: "assets/images/header_image.png",
            title: 'وقت الانشاء',
          ),
          const Spacer(),
          HeaderLabelWithImage(
            width: dimension.width100,
            image: "assets/images/header_image.png",
            title: 'عدد المشتركين',
          ),
          const Spacer(),
          horizontalSpace(dimension.width350)
        ],
      ),
    );
  }
}
