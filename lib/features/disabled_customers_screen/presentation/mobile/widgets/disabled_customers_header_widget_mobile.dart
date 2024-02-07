import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system/core/widgets/header_label_with_image_mobile.dart';
import 'package:system/core/widgets/header_widget.dart';
import '../../../../../core/helpers/spacing.dart';

class DisabledCustomersHeaderWidgetMobile extends StatelessWidget {
  const DisabledCustomersHeaderWidgetMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return HeaderWidget(
      height: 60.h,
      color: Colors.white,
      child: Row(children: [
        HeaderLabelWithImageMobile(
          width: 120.w,
          image: "assets/images/header_image.png",
          title: 'المشترك',
        ),
        const Spacer(),
        HeaderLabelWithImageMobile(
          width: 140.w,
          image: "assets/images/header_image.png",
          title: 'الرقم',
        ),
        const Spacer(),
        HeaderLabelWithImageMobile(
          width: 80.w,
          image: "assets/images/header_image.png",
          title: 'الرصيد',
        ),
        const Spacer(),
        horizontalSpace(20.w),
      ]),
    );
  }
}
