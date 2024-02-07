import 'package:flutter/material.dart';
import 'package:system/core/helpers/dimensions.dart';
import 'package:system/core/theming/colors.dart';
import 'package:system/core/widgets/header_widget.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/widgets/header_label_with_image_desktop.dart';

class LateCustomersHeaderWidget extends StatelessWidget {
  const LateCustomersHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var dimension = Dimensions(context);
    return HeaderWidget(
      height: dimension.height30,
      color: ColorsManager.lighterGray,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          HeaderLabelWithImageDesktop(
            width: dimension.width130,
            image: "assets/images/header_image.png",
            title: 'اسم المشترك',
          ),
          const Spacer(),
          HeaderLabelWithImageDesktop(
            width: dimension.width80,
            image: "assets/images/header_image.png",
            title: 'رقم الهاتف',
          ),
          const Spacer(),
          HeaderLabelWithImageDesktop(
            width: dimension.width100,
            image: "assets/images/header_image.png",
            title: 'التبعية',
          ),
          const Spacer(),
          HeaderLabelWithImageDesktop(
            width: dimension.width130,
            image: "assets/images/header_image.png",
            title: 'المحصل',
          ),
          const Spacer(),
          HeaderLabelWithImageDesktop(
            width: dimension.width80,
            image: "assets/images/header_image.png",
            title: 'تاريخ التسجيل',
          ),
          const Spacer(),
          HeaderLabelWithImageDesktop(
            width: dimension.width100,
            image: "assets/images/header_image.png",
            title: 'الباقة',
          ),
          const Spacer(),
          HeaderLabelWithImageDesktop(
            width: dimension.width80,
            image: "assets/images/header_image.png",
            title: 'الرصيد',
          ),
          const Spacer(),
          horizontalSpace(dimension.width200)
        ],
      ),
    );
  }
}
