import 'package:flutter/material.dart';
import 'package:system/core/helpers/dimensions.dart';
import 'package:system/core/helpers/spacing.dart';
import 'package:system/core/theming/colors.dart';
import 'package:system/core/widgets/header_label_with_image_desktop.dart';
import 'package:system/core/widgets/header_widget.dart';

class ReviewDataHeaderWidget extends StatelessWidget {
  const ReviewDataHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var dimension = Dimensions(context);
    return HeaderWidget(
      // height :dimension.height30,
      color: ColorsManager.lighterGray,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          HeaderLabelWithImageDesktop(
            width: dimension.width150,
            image: "assets/images/header_image.png",
            title: 'الاسم',
          ),
          const Spacer(),
          HeaderLabelWithImageDesktop(
            width: dimension.width100,
            image: "assets/images/header_image.png",
            title: 'الرقم',
          ),
          const Spacer(),
          HeaderLabelWithImageDesktop(
            width: dimension.width100,
            image: "assets/images/header_image.png",
            title: 'الباقة فالمنظومة',
          ),const Spacer(),
          HeaderLabelWithImageDesktop(
            width: dimension.width100,
            image: "assets/images/header_image.png",
            title: 'الباقة فالشركة',
          ),const Spacer(),
          HeaderLabelWithImageDesktop(
            width: dimension.width200,
            image: "assets/images/header_image.png",
            title: 'ملاحظات',
          ),const Spacer(),
          HeaderLabelWithImageDesktop(
            width: dimension.width180,
            image: "assets/images/header_image.png",
            title: 'المواقف',
          ),
        ],
      ),
    );
  }
}
