import 'package:flutter/material.dart';
import 'package:system/core/helpers/dimensions.dart';
import 'package:system/core/theming/colors.dart';
import 'package:system/core/widgets/header_widget.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/widgets/header_label_with_image.dart';

class DisabledCustomersHeaderWidget extends StatelessWidget {
  const DisabledCustomersHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var dimension = Dimensions(context);
    return HeaderWidget(
      height: dimension.height30,
      color: ColorsManager.lighterGray,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          HeaderLabelWithImage(
            width: dimension.width130,
            image: "assets/images/header_image.png",
            title: 'اسم المشترك',
          ),
          const Spacer(),
          HeaderLabelWithImage(
            width: dimension.width80,
            image: "assets/images/header_image.png",
            title: 'رقم الهاتف',
          ),
          const Spacer(),
          HeaderLabelWithImage(
            width: dimension.width100,
            image: "assets/images/header_image.png",
            title: 'التبعية',
          ),
          const Spacer(),
          HeaderLabelWithImage(
            width: dimension.width150,
            image: "assets/images/header_image.png",
            title: 'الشركة والمحصل',
          ),
          const Spacer(),
          HeaderLabelWithImage(
            width: dimension.width80,
            image: "assets/images/header_image.png",
            title: 'تاريخ التسجيل',
          ),
          const Spacer(),
          HeaderLabelWithImage(
            width: dimension.width100,
            image: "assets/images/header_image.png",
            title: 'الباقة',
          ),
          const Spacer(),
          HeaderLabelWithImage(
            width: dimension.width100,
            image: "assets/images/header_image.png",
            title: 'تاريخ التعطيل',
          ),const Spacer(),
          HeaderLabelWithImage(
            width: dimension.width130,
            image: "assets/images/header_image.png",
            title: 'الرصيد',
          ),
          const Spacer(),
          horizontalSpace(dimension.width40)
        ],
      ),
    );
  }
}
