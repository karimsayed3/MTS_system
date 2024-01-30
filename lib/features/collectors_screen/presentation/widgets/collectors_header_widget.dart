import 'package:flutter/material.dart';
import 'package:system/core/helpers/dimensions.dart';
import 'package:system/core/theming/colors.dart';
import 'package:system/core/widgets/header_widget.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/widgets/header_label_with_image.dart';

class CollectorsHeaderWidget extends StatelessWidget {
  const CollectorsHeaderWidget({super.key});

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
            title: 'اسم المحصل',
          ),
          const Spacer(),
          HeaderLabelWithImage(
            width: dimension.width130,
            image: "assets/images/header_image.png",
            title: 'البريد الالكترونى',
          ),
          const Spacer(),
          HeaderLabelWithImage(
            width: dimension.width60,
            image: "assets/images/header_image.png",
            title: 'الحساب',
          ),const Spacer(),
          HeaderLabelWithImage(
            width: dimension.width60,
            image: "assets/images/header_image.png",
            title: 'نقدى',
          ),const Spacer(),
          HeaderLabelWithImage(
            width: dimension.width60,
            image: "assets/images/header_image.png",
            title: 'كاش',
          ),const Spacer(),
          HeaderLabelWithImage(
            width: dimension.width60,
            image: "assets/images/header_image.png",
            title: 'الاحمالى',
          ),
          const Spacer(),
          horizontalSpace(dimension.width150)
        ],
      ),
    );
  }
}
