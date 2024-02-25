import 'package:flutter/material.dart';

import '../../../../../core/helpers/dimensions.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/widgets/header_label_with_image_desktop.dart';
import '../../../../../core/widgets/header_widget.dart';

class ResellersRequestsHeaderWidget extends StatelessWidget {
  const ResellersRequestsHeaderWidget({super.key});


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
            width: dimension.width120,
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
            width: dimension.width80,
            image: "assets/images/header_image.png",
            title: 'تاريخ التسجيل',
          ),const Spacer(),
          HeaderLabelWithImageDesktop(
            width: dimension.width60,
            image: "assets/images/header_image.png",
            title: 'التبعية',
          ),const Spacer(),
          HeaderLabelWithImageDesktop(
            width: dimension.width60,
            image: "assets/images/header_image.png",
            title: 'الحساب',
          ),const Spacer(),
          HeaderLabelWithImageDesktop(
            width: dimension.width100,
            image: "assets/images/header_image.png",
            title: 'القيمة الجديدة/القديمة',
          ),
          const Spacer(),
          HeaderLabelWithImageDesktop(
            width: dimension.width60,
            image: "assets/images/header_image.png",
            title: 'الطلب',
          ), const Spacer(),
          HeaderLabelWithImageDesktop(
            width: dimension.width80,
            image: "assets/images/header_image.png",
            title: 'تاريخ الطلب',
          ),
          const Spacer(),
          horizontalSpace(dimension.width130)
        ],
      ),
    );
  }
}
