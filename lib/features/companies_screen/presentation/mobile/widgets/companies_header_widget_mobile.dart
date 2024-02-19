import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system/core/widgets/header_label_with_image_mobile.dart';
import 'package:system/core/widgets/header_widget.dart';

import '../../../../../core/helpers/spacing.dart';
class CompaniesHeaderWidgetMobile extends StatelessWidget {
  const CompaniesHeaderWidgetMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return HeaderWidget(
      height: 60.h,
      color: Colors.white,
      child: Row(children: [
        HeaderLabelWithImageMobile(
          width: 180.w,
          image: "assets/images/header_image.png",
          title: 'اسم الشركة',
        ),
        const Spacer(),
        HeaderLabelWithImageMobile(
          width: 120.w,
          image: "assets/images/header_image.png",
          title: 'عدد المشتركين',
        ),
        const Spacer(),
        horizontalSpace(50.w),
      ]),
    );
  }
}
