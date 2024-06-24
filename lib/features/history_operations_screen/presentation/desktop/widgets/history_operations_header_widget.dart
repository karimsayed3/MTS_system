import 'package:flutter/material.dart';
import 'package:system/core/helpers/dimensions.dart';
import 'package:system/core/helpers/spacing.dart';
import 'package:system/core/theming/colors.dart';
import 'package:system/core/widgets/header_label_with_image_desktop.dart';
import 'package:system/core/widgets/header_widget.dart';

class HistoryOperationsHeaderWidget extends StatelessWidget {
  const HistoryOperationsHeaderWidget({super.key});

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
            title: 'اسم المستخدم',
          ),
          const Spacer(),
          HeaderLabelWithImageDesktop(
            width: dimension.width80,
            image: "assets/images/header_image.png",
            title: 'الرقم',
          ),
          const Spacer(),
          HeaderLabelWithImageDesktop(
            width: dimension.width100,
            image: "assets/images/header_image.png",
            title: 'الباقة',
          ),const Spacer(),
          HeaderLabelWithImageDesktop(
            width: dimension.width130,
            image: "assets/images/header_image.png",
            title: 'التبعية والمحصل',
          ),const Spacer(),
          HeaderLabelWithImageDesktop(
            width: dimension.width80,
            image: "assets/images/header_image.png",
            title: 'الرصيد قبل',
          ),const Spacer(),
          HeaderLabelWithImageDesktop(
            width: dimension.width80,
            image: "assets/images/header_image.png",
              title: 'الرصيد المضاف',
          ),
          const Spacer(), HeaderLabelWithImageDesktop(
            width: dimension.width80,
            image: "assets/images/header_image.png",
              title: 'العملية/الملاحظة',
          ),
          const Spacer(),HeaderLabelWithImageDesktop(
            width: dimension.width100,
            image: "assets/images/header_image.png",
              title: 'الوقت والتاريخ',
          ),
          const Spacer(),
          horizontalSpace(dimension.width30),
          const Spacer()
        ],
      ),
    );
  }
}
