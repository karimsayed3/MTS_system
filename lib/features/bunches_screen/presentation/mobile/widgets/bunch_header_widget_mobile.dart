import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system/core/widgets/header_label_with_image_mobile.dart';
import 'package:system/core/widgets/header_widget.dart';
import '../../../../../core/helpers/spacing.dart';

class BunchHeaderWidgetMobile extends StatelessWidget {
  const BunchHeaderWidgetMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return HeaderWidget(
      height: 60.h,
      color: Colors.white,
      child: Row(children: [
        HeaderLabelWithImageMobile(
          width: 130.w,
          image: "assets/images/header_image.png",
          title: 'الباقة',
        ),
        const Spacer(),
        HeaderLabelWithImageMobile(
          width: 80.w,
          image: "assets/images/header_image.png",
          title: 'السعر',
        ),
        const Spacer(),
        HeaderLabelWithImageMobile(
          width: 100.w,
          image: "assets/images/header_image.png",
          title: 'المشتركين',
        ),
        const Spacer(),
        horizontalSpace(50.w),
      ]),
    );
  }
}
